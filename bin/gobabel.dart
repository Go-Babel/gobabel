import 'dart:io';

import 'package:args/args.dart';
import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/utils/terminal_textfield.dart';
import 'package:gobabel/src/gobabel_conductor.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:yaml/yaml.dart';

// Helper function to get required parameter interactively if not provided
Future<String> getRequiredParameter({
  required String? providedValue,
  required String parameterName,
  required String description,
  bool isSecret = false,
}) async {
  if (providedValue != null && providedValue.isNotEmpty) {
    return providedValue;
  }

  print('ℹ️  $description'.wheat);

  final result = await getTextFieldInput(
    prompt: 'Please enter your $parameterName',
  );

  if (result.isEmpty) {
    print('❌ Error: $parameterName is required.'.red);
    exit(1);
  }

  return result;
}

Future<void> main(List<String> arguments) async {
  // Set up the argument parser
  final parser =
      ArgParser()
        ..addFlag('sync', abbr: 's', help: 'Perform sync operation')
        ..addFlag('generate', abbr: 'g', help: 'Generate new version')
        ..addFlag(
          'create',
          abbr: 'c',
          help: 'Add a new project in GoBabel system',
        )
        ..addOption(
          'language',
          abbr: 'l',
          help: 'Language in format language_country, e.g., en_US',
        )
        ..addOption('attach-to-user-with-id', abbr: 'u', help: 'Attach to user')
        ..addOption('api-key', abbr: 'k', help: 'API key')
        ..addOption('path', abbr: 'p', help: 'Path to the API directory')
        ..addFlag(
          'will-create-log-file',
          help: 'Enable detailed logging output',
          defaultsTo: false,
          negatable: true,
        )
        ..addFlag(
          'help',
          abbr: 'h',
          help: 'Show this help message',
          negatable: false,
        )
        ..addFlag(
          'version',
          abbr: 'v',
          help: 'Show the package version',
          negatable: false,
        )
        ..addFlag(
          'list-languages',
          help: 'Show all supported languages',
          negatable: false,
        );

  final GobabelConductor controller = GobabelConductor();

  // Parse the arguments
  ArgResults argResults;
  try {
    argResults = parser.parse(arguments);
  } catch (e) {
    print('❌ Error parsing arguments: $e'.red);
    printUsage(parser);
    exit(1);
  }

  // Handle the --help flag
  if (argResults['help'] as bool) {
    printUsage(parser);
    exit(0);
  }

  // Handle the --version flag
  if (argResults['version'] as bool) {
    try {
      final version = await getPackageVersion();
      print('go_babel version: $version');
      exit(0);
    } catch (e) {
      print('❌ Error reading package version: $e'.red);
      exit(1);
    }
  }

  // Handle the --list-languages flag
  if (argResults['list-languages'] as bool) {
    printSupportedLanguages();
    exit(0);
  }

  // Check for mutually exclusive operations
  if (argResults['sync'] as bool && argResults['generate'] as bool ||
      argResults['sync'] as bool && argResults['create'] as bool ||
      argResults['generate'] as bool && argResults['create'] as bool) {
    print(
      '❌ Error: Cannot specify --sync, --generate, or --create together. Use one at a time.'
          .red,
    );
    printUsage(parser);
    exit(1);
  }

  // Ensure an operation is specified
  if (!(argResults['sync'] as bool) &&
      !(argResults['generate'] as bool) &&
      !(argResults['create'] as bool)) {
    print('❌ Error: Must specify either --sync or --generate.'.red);
    printUsage(parser);
    exit(1);
  }
  final apiPath = argResults['path'] as String?;
  final directory = resolvePath(apiPath);
  if (apiPath != null) {
    print('ℹ️  Running for dirrectory: $directory'.wheat);
  }

  // Get the will-create-log-file flag value
  final willLog = argResults['will-create-log-file'] as bool;

  // Handle the sync command
  if (argResults['sync'] as bool) {
    final apiKey = await getRequiredParameter(
      providedValue: argResults['api-key'] as String?,
      parameterName: 'API key',
      description:
          'API key is required for sync operation. You can find it in your GoBabel dashboard.',
    );

    await runInTryCatch(
      errorMessage: 'Error during sync operation',
      operation: controller.sync(
        accountApiKey: apiKey,
        directoryPath: directory.path,
        willLog: willLog,
      ),
    );
  }
  // Handle the generate command
  else if (argResults['generate'] as bool) {
    final apiKey = await getRequiredParameter(
      providedValue: argResults['api-key'] as String?,
      parameterName: 'API key',
      description:
          'API key is required for generate operation. You can find it in your GoBabel dashboard.',
    );

    String? language = argResults['language'] as String?;

    // Handle language selection
    BabelSupportedLocales? babelSupportedLocale;

    if (language == null) {
      // Interactive mode - prompt user
      print('⚠️ Language is required for generate operation.'.yellowBright);
      print(
        'Enter language in format language_country (e.g., en_US)'.yellowBright,
      );
      print('> Use arrow keys to navigate options or type to filter'.wheat);

      babelSupportedLocale = await getDataFromInput<BabelSupportedLocales>(
        prompt: 'Please select or type a language code (ex: en_US)',
        errorMessage:
            'Invalid language code. Please enter a valid format (e.g., en_US)',
        userInputToOptionMapper: (input) {
          // First try to normalize the input
          final normalized = normalizeLanguageFormat(input);
          if (normalized == null) return null;

          // Split and try to get the locale
          final parts = normalized.split('_');
          if (parts.length == 2) {
            return BabelSupportedLocales.fromLocale(parts[0], parts[1]);
          }
          return null;
        },
        inputOptions: InputFormOptions<BabelSupportedLocales>(
          options: BabelSupportedLocales.values.toSet(),
          optionToString:
              (locale) =>
                  '${locale.flagEmoji} ${locale.languageCode}_${locale.countryCode} - ${locale.displayName}',
        ),
      );

      if (babelSupportedLocale == null) {
        print('❌ Error: Language selection cancelled or invalid.'.red);
        exit(1);
      }
    } else {
      // Language provided via command line
      // Normalize the language format
      final normalizedLanguage = normalizeLanguageFormat(language);
      if (normalizedLanguage == null) {
        print(
          '❌ Error: Invalid language format.\n'
                  'Expected formats: en_US, enus, enUS, or ENUS.'
              .red,
        );
        printSupportedLanguages();
        exit(1);
      }

      // Split the normalized language into languageCode and countryCode
      final normalizedParts = normalizedLanguage.split('_');
      final languageCode = normalizedParts[0];
      final countryCode = normalizedParts[1];

      babelSupportedLocale = BabelSupportedLocales.fromLocale(
        languageCode,
        countryCode,
      );
      if (babelSupportedLocale == null) {
        print('❌ Error: Invalid language/country code for $language'.red);
        printSupportedLanguages();
        exit(1);
      }
    }

    await runInTryCatch(
      errorMessage: 'Error during generate operation',
      operation: controller.generate(
        projectApiToken: apiKey,
        inputedByUserLocale: babelSupportedLocale,
        directoryPath: directory.path,
        willLog: willLog,
      ),
    );
  } else if (argResults['create'] as bool) {
    final accountApiKey = await getRequiredParameter(
      providedValue: argResults['attach-to-user-with-id'] as String?,
      parameterName: 'account API key',
      description:
          'Account API key is required for create operation. You can get it in the account tab in GoBabel dashboard.',
    );

    await runInTryCatch(
      errorMessage: 'Error during create operation',
      operation: controller.create(
        directoryPath: directory.path,
        accountApiKey: accountApiKey,
        willLog: willLog,
      ),
    );
  }
}

Future<void> runInTryCatch({
  required String errorMessage,
  required AsyncBabelResult<void> operation,
}) async {
  final result = await operation;
  result.fold(
    // Success case
    (_) {
      exit(0);
    },
    // Failure case
    (failure) {
      String suffixMessage = '';
      failure.whenOrNull(
        withErrorAndStackTrace: (_, error, stackTrace) {
          suffixMessage =
              '\n\n${'Error: "$error"'.darkOrange}\n${"Stack Trace:".darkOrange}\n$stackTrace';
        },
      );

      final mainMessage =
          '\n❌ $errorMessage:\n'.red +
          "[ ${failure.exception.title} ]\n".darkOrange +
          failure.exception.description.red +
          suffixMessage;

      stdout.writeln(mainMessage);

      exit(1);
    },
  );
}

// Helper function to read the package version from pubspec.yaml
Future<String> getPackageVersion() async {
  final file = File('pubspec.yaml');
  if (!await file.exists()) {
    print('\n❌ pubspec.yaml not found'.red);
    exit(0);
  }
  final content = await file.readAsString();
  final yaml = loadYaml(content);
  final version = yaml['version'];
  if (version == null) {
    print('\n❌ Version not specified in pubspec.yaml'.red);
    exit(0);
  }
  return version.toString();
}

// Helper function to display usage information
void printUsage(ArgParser parser) {
  print('ℹ️ Usage: go_babel [options]'.white);
  print('Options:'.white);
  print(parser.usage.white);
}

// Helper function to display all supported languages
void printSupportedLanguages() {
  print('ℹ️ Supported Languages:'.wheat);
  print('Format: language_country - Display Name\n'.wheat);

  final locales = BabelSupportedLocales.values;

  for (var locale in locales) {
    final code = '${locale.languageCode}_${locale.countryCode}'.padRight(6);
    print('${locale.flagEmoji}  $code - ${locale.displayName}'.white);
  }
}

// Helper function to normalize language format
String? normalizeLanguageFormat(String input) {
  final normalized = input.trim().toLowerCase();

  // If already in correct format (contains underscore)
  if (normalized.contains('_')) {
    final parts = normalized.split('_');
    if (parts.length == 2 && parts[0].length == 2 && parts[1].length == 2) {
      return '${parts[0]}_${parts[1].toUpperCase()}';
    }
    return null; // Invalid format
  }

  // Handle formats without underscore (e.g., "enus", "enUS", "ENUS")
  if (normalized.length == 4) {
    final languageCode = normalized.substring(0, 2);
    final countryCode = normalized.substring(2, 4).toUpperCase();
    return '${languageCode}_$countryCode';
  }

  return null; // Invalid format
}

Directory resolvePath(String? pathInput) {
  // If pathInput is null, return current directory
  final currDir = Directory.current;
  if (pathInput == null) {
    return currDir;
  }

  // Normalize path input (handles trailing slashes)
  String normalizedPath = pathInput.trim();
  if (normalizedPath.isEmpty) {
    return currDir;
  }

  // Split the path into segments
  List<String> segments =
      normalizedPath
          .split(RegExp(r'[\\/]'))
          .where((s) => s.isNotEmpty)
          .toList();

  // Start from current directory
  Directory current = currDir;

  for (String segment in segments) {
    if (segment == '..') {
      // Move up one directory
      current = Directory.fromUri(current.uri.resolve('..'));
    } else if (segment == '.') {
      // Stay in current directory (optional handling)
      continue;
    } else {
      // Append the segment to the path
      current = Directory.fromUri(current.uri.resolve('$segment/'));
    }
  }

  return current;
}
