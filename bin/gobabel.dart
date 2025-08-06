import 'dart:io';

import 'package:args/args.dart';
import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/utils/console_manager.dart';
import 'package:gobabel/src/core/utils/terminal_textfield.dart';
import 'package:gobabel/src/gobabel_conductor.dart';
import 'package:gobabel/src/usecases/create_api_client_entity.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:yaml/yaml.dart';

// Global console instance
final console = ConsoleManager.instance;

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

  console.info(description);

  final result = await getTextFieldInput(
    prompt: 'Please enter your $parameterName',
  );

  if (result.isEmpty) {
    console.error('Error: $parameterName is required.');
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
          'dangerously-auto-detect-user-facing-hardcoded-strings',
          help:
              'Will automatically detect user-facing hardcoded strings with AI and won\'t enter the flow that asks for user confirmation in a web review session. This is dangerous since the AI may misinterpret strings and should be used only if you are sure that all hardcoded strings will be easily detected as user-facing.',
          defaultsTo: false,
          negatable: true,
        )
        ..addFlag(
          'will-create-log-file',
          help: 'Enable detailed logging output',
          defaultsTo: false,
          negatable: true,
        )
        ..addFlag(
          'run-for-all-files',
          help: 'Force checking all files for hardcoded strings instead of only files changed since the last translation checkpoint. By default, the CLI optimizes performance by only checking files that have been modified since the last commit checkpoint, as unchanged files don\'t need to be rechecked.',
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
        )
        ..addFlag('run-locally', hide: true);

  final GobabelConductor controller = GobabelConductor();

  // Parse the arguments
  ArgResults argResults;
  try {
    argResults = parser.parse(arguments);
  } catch (e) {
    console.error('Error parsing arguments: $e');
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
      console.writeLine('go_babel version: $version');
      exit(0);
    } catch (e) {
      console.error('Error reading package version: $e');
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
    console.error('Error: Cannot specify --sync, --generate, or --create together. Use one at a time.');
    printUsage(parser);
    exit(1);
  }

  // Ensure an operation is specified
  if (!(argResults['sync'] as bool) &&
      !(argResults['generate'] as bool) &&
      !(argResults['create'] as bool)) {
    console.error('Error: Must specify either --sync or --generate.');
    printUsage(parser);
    exit(1);
  }
  final apiPath = argResults['path'] as String?;
  final directory = resolvePath(apiPath);
  if (apiPath != null) {
    console.info('Running for dirrectory: $directory');
  }

  // Get the will-create-log-file flag value
  final bool willLog = argResults['will-create-log-file'] as bool;
  final bool dangerouslyAutoDetectUserFacingHardcodedStrings =
      argResults['dangerously-auto-detect-user-facing-hardcoded-strings']
          as bool;

  // Get the run-locally flag value (hidden flag for debug)
  final runLocally = argResults['run-locally'] as bool;

  // Set the global run locally flag if needed
  if (runLocally) {
    setRunLocally(true);
  }

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
      console.warning('Language is required for generate operation.');
      console.warning('Enter language in format language_country (e.g., en_US)');
      console.info('Use arrow keys to navigate options or type to filter');

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
        console.error('Error: Language selection cancelled or invalid.');
        exit(1);
      }
    } else {
      // Language provided via command line
      // Normalize the language format
      final normalizedLanguage = normalizeLanguageFormat(language);
      if (normalizedLanguage == null) {
        console.error('Error: Invalid language format.\nExpected formats: en_US, enus, enUS, or ENUS.');
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
        console.error('Error: Invalid language/country code for $language');
        printSupportedLanguages();
        exit(1);
      }
    }

    final runForAllFiles = argResults['run-for-all-files'] as bool;
    
    await runInTryCatch(
      errorMessage: 'Error during generate operation',
      operation: controller.generate(
        projectApiToken: apiKey,
        inputedByUserLocale: babelSupportedLocale,
        directoryPath: directory.path,
        willLog: willLog,
        dangerouslyAutoDetectUserFacingHardcodedStrings:
            dangerouslyAutoDetectUserFacingHardcodedStrings,
        runForAllFiles: runForAllFiles,
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

      console.writeLine(mainMessage);

      exit(1);
    },
  );
}

// Helper function to read the package version from pubspec.yaml
Future<String> getPackageVersion() async {
  final file = File('pubspec.yaml');
  if (!await file.exists()) {
    console.error('\npubspec.yaml not found');
    exit(0);
  }
  final content = await file.readAsString();
  final yaml = loadYaml(content);
  final version = yaml['version'];
  if (version == null) {
    console.error('\nVersion not specified in pubspec.yaml');
    exit(0);
  }
  return version.toString();
}

// Helper function to display usage information
void printUsage(ArgParser parser) {
  console.usage('ℹ️ Usage: go_babel [options]');
  console.usage('Options:');
  console.usage(parser.usage);
}

// Helper function to display all supported languages
void printSupportedLanguages() {
  console.info('Supported Languages:');
  console.info('Format: language_country - Display Name\n');

  final locales = BabelSupportedLocales.values;

  for (var locale in locales) {
    final code = '${locale.languageCode}_${locale.countryCode}'.padRight(6);
    console.usage('${locale.flagEmoji}  $code - ${locale.displayName}');
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
