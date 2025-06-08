import 'dart:io';
import 'package:args/args.dart';
import 'package:chalkdart/chalkstrings.dart';
import 'package:dio/dio.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/gobabel_controller.dart';
import 'package:gobabel/src/scripts/analyse_already_used_babel_labels/resolve_already_existing_key.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/analyse_codebase_issue_integrity.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/move_hardcoded_string_param_case.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/remove_const_keyword_usecase.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/resolve_all_hardcoded_strings_usecase.dart';
import 'package:gobabel/src/scripts/arb_migration_related/ensure_integrity_of_arb.dart';
import 'package:gobabel/src/scripts/arb_migration_related/extract_location_data_from_arb_file_name.dart';
import 'package:gobabel/src/scripts/arb_migration_related/resolve_all_arb_keys.dart';
import 'package:gobabel/src/scripts/arb_migration_related/set_declaration_function.dart';
import 'package:gobabel/src/scripts/other/add_import_if_needed.dart';
import 'package:gobabel/src/scripts/other/add_babel_initialization_to_main_usecase.dart';
import 'package:gobabel/src/scripts/arb_migration_related/get_project_yaml_config.dart';
import 'package:gobabel/src/scripts/arb_migration_related/infer_declaration_function_from_arb_json.dart';
import 'package:gobabel/src/scripts/git_related/commit_all_changes.dart';
import 'package:gobabel/src/scripts/git_related/get_all_commits_in_current_git_tree_time_sorted.dart';
import 'package:gobabel/src/scripts/git_related/get_git_user.dart';
import 'package:gobabel/src/scripts/git_related/get_last_local_commit_in_current_branch.dart';
import 'package:gobabel/src/scripts/git_related/get_project_origin.dart';
import 'package:gobabel/src/scripts/git_related/set_changed_files_between_commits.dart';
import 'package:gobabel/src/scripts/other/dart_fix_format_usecase.dart';
import 'package:gobabel/src/scripts/translation_related/get_hardcoded_string_key_cache.dart';
import 'package:gobabel/src/scripts/translation_related/translate_new_strings_arb.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:gobabel_string_extractor/gobabel_labels_extractor.dart';
import 'package:yaml/yaml.dart';
import 'package:gobabel/src/scripts/arb_migration_related/find_arb_data.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/extract_project_code_base.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/get_codebase_yaml_info.dart';
import 'package:gobabel/src/scripts/git_related/ensure_git_directory_is_configured.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';
import 'package:gobabel/src/scripts/git_related/get_project_last_commit_sha_stamps.dart';
import 'package:gobabel/src/scripts/git_related/reset_all_changes_done.dart';
import 'package:gobabel/src/scripts/git_related/set_target_files.dart';
import 'package:gobabel/src/scripts/translation_related/get_app_languages.dart';
import 'package:gobabel/src/scripts/other/write_babel_text_file_into_directory.dart';

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

  final GobabelController controller = GobabelController(
    moveHardCodedStringParamUseCase: MoveHardCodedStringParamUseCase(),
    getHardcodedStringKeyCacheUsecase: GetHardcodedStringKeyCacheUsecase(),
    resolveAlreadyExistingKey: ResolveAlreadyExistingKey(
      inferDeclarationFunctionByArbValueUsecase:
          InferDeclarationFunctionByArbValueUsecase(),
    ),
    findArbDataUsecase: FindArbDataUsecase(
      extractLocationDataFromArbFileName:
          ExtractLocationDataFromArbFileNameUsecase(),
      getProjectYamlConfig: GetProjectYamlConfigUsecase(),
      garanteeUniquenessOfKeys: GaranteeUniquenessOfArbKeysUsecase(),
      inferDeclarationFunctionFromArbJson:
          InferDeclarationFunctionFromArbJsonUsecase(),
    ),
    resolveAllArbKeysUsecase: ResolveAllArbKeysUsecase(
      setDeclarationFunctionUsecase: SetDeclarationFunctionUsecase(
        inferDeclarationFunctionFromArbJson:
            InferDeclarationFunctionFromArbJsonUsecase(),
      ),
      ensureIntegrityOfArbUsecase: EnsureIntegrityOfArbUsecase(),
    ),
    resolveAllHardcodedStringsUsecase: ResolveAllHardcodedStringsUsecase(
      inferDeclarationFunctionByArbValueUsecase:
          InferDeclarationFunctionByArbValueUsecase(),
      addImportIfNeededUsecase: AddImportIfNeededUsecase(),
      getHarcodedStringsUsecase: GobabelStringExtractorController(
        client: Dependencies.client,
      ),
    ),
    translateNewStringsArbUsecase: TranslateNewStringsArbUsecase(),
    getLastLocalCommitInCurrentBranch:
        GetLastLocalCommitInCurrentBranchUsecase(),
    analyseCodebaseIssueIntegrityUsecase:
        AnalyseCodebaseIssueIntegrityUsecase(),
    commitAllChangesUsecase: CommitAllChangesUsecase(),
    ensureGitDirectoryIsConfigured: EnsureGitDirectoryIsConfiguredUsecase(),
    getCodeBaseYamlInfo: GetCodeBaseYamlInfoUsecase(),
    writeBabelTextFileIntoDirectory: WriteBabelTextFileIntoDirectory(),
    addBabelInitializationToMainUsecase: AddBabelInitializationToMainUsecase(),
    resetAllChangesDoneUsecase: ResetAllChangesDoneUsecase(),
    getProjectGitDependenciesUsecase: GetProjectGitDependenciesUsecase(
      getProjectOriginUsecase: GetProjectOriginUsecase(),
      getLastLocalCommitInCurrentBranch:
          GetLastLocalCommitInCurrentBranchUsecase(),
      getGitUserUsecase: GetGitUserUsecase(),
    ),
    extractProjectCodeBaseUsecase: ExtractProjectCodeBaseUsecase(),
    getAppLanguagesUsecase: GetAppLanguagesUsecase(dio: Dio()),
    setTargetFilesUsecase: SetTargetFilesUsecase(
      setChangedDartFilesBetweenCommitsUsecase:
          SetChangedDartFilesBetweenCommitsUsecase(),
      getProjectLastCommitShaStampsUsecase:
          GetProjectLastCommitShaStampsUsecase(),
      getAllCommitsInCurrentGitTreeOrdoredByTime:
          GetAllCommitsInCurrentGitTreeOrdoredByTime(),
    ),
    removeConstKeywordUsecase: RemoveConstKeywordUsecase(),
    dartFixFormatUsecase: DartFixFormatUsecase(),
  );

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

  // Handle the sync command
  if (argResults['sync'] as bool) {
    if (argResults['api-key'] == null) {
      print('❌ Error: --api-key is required for sync operation.'.red);
      printUsage(parser);
      return;
    }
    final apiKey = argResults['api-key'] as String;

    await runInTryCatch(
      errorMessage: 'Error during sync operation',
      operation: () async {
        await controller.sync(projectApiToken: apiKey, directory: directory);
      },
    );
  }
  // Handle the generate command
  else if (argResults['generate'] as bool) {
    if (argResults['api-key'] == null) {
      print('❌ Error: --api-key is required for generate operation.'.red);
      printUsage(parser);
      exit(1);
    }

    final apiKey = argResults['api-key'] as String;
    String? language = argResults['language'] as String?;

    // If language is not provided, prompt the user
    if (language == null) {
      print('ℹ️  Language is required for generate operation.'.wheat);
      print('Enter language in format language_country (e.g., en_US)'.wheat);
      print('Type "list-all" to see all supported languages'.wheat);
      stdout.write('> ');
      language = stdin.readLineSync()?.trim();

      // If user wants to see all languages
      if (language == 'list-all') {
        printSupportedLanguages();
        stdout.write('\nNow enter a language code: ');
        language = stdin.readLineSync()?.trim();
      }

      if (language == null || language.isEmpty) {
        print('❌ Error: Language is required.'.red);
        exit(1);
      }
    }

    // Split the language into languageCode and countryCode
    final parts = language.split('_');
    if (parts.length != 2) {
      print(
        '❌ Error: Invalid language format.\n'
                'Expected language_country, in this exact format, e.g., en_US.'
            .red,
      );
      printSupportedLanguages();
      exit(1);
    }
    final languageCode = parts[0];
    final countryCode = parts[1];

    final BabelSupportedLocales? babelSupportedLocale =
        BabelSupportedLocales.fromLocale(languageCode, countryCode);
    if (babelSupportedLocale == null) {
      print('❌ Error: Invalid language/country code for $language'.red);
      printSupportedLanguages();
      exit(1);
    }

    await runInTryCatch(
      errorMessage: 'Error during generate operation',
      operation: () async {
        await controller.generateNewVersion(
          projectApiToken: apiKey,
          targetLanguage: babelSupportedLocale,
          directory: directory,
        );
      },
    );
  } else if (argResults['create'] as bool) {
    if (argResults['attach-to-user-with-id'] == null) {
      print(
        '❌ Error: --attach-to-user-with-id is required for create operation.\n'
                'You can get account api-key in the account tab in go babel dashboard.'
            .red,
      );
      printUsage(parser);
      exit(0);
    }

    await runInTryCatch(
      errorMessage: 'Error during create operation',
      operation: () async {
        final accountApiKey = argResults['attach-to-user-with-id'] as String;
        await controller.create(
          directory: directory,
          accountApiKey: accountApiKey,
        );
      },
    );
  }
}

Future<void> runInTryCatch({
  required String errorMessage,
  required Future<void> Function() operation,
}) async {
  try {
    await operation();
    exit(0);
  } on BabelException catch (e) {
    stdout.writeln(
      '\n❌ $errorMessage:\n'.red +
          "[ ${e.title} ]".darkOrange +
          '\n${e.description}'.red,
    );
    exit(1);
  } catch (e, s) {
    print('\n❌ $errorMessage:\n$e'.replaceAll('Exception: ', '').darkOrange);
    print('Stack trace: $s'.red); // Todo(igor): remove this in production
    exit(1);
  }
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
