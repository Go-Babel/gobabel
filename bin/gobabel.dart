import 'dart:io';
import 'package:args/args.dart';
import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/gobabel_controller.dart';
import 'package:gobabel/src/scripts/arb_migration_related/extract_location_data_from_arb_file_name.dart';
import 'package:gobabel/src/scripts/arb_migration_related/garantee_uniqueness_of_keys.dart';
import 'package:gobabel/src/scripts/arb_migration_related/get_project_yaml_config.dart';
import 'package:gobabel/src/scripts/arb_migration_related/infer_declaration_function_from_arb_json.dart';
import 'package:gobabel/src/scripts/extract_strings_related/get_dynamic_values_in_string.dart';
import 'package:gobabel/src/scripts/extract_strings_related/retrive_all_aibabel_consts_from_file.dart';
import 'package:gobabel/src/scripts/extract_strings_related/validate_candidate_string.dart';
import 'package:gobabel/src/scripts/git_related/get_all_commits_in_current_git_tree_time_sorted.dart';
import 'package:gobabel/src/scripts/git_related/set_changed_files_between_commits.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:yaml/yaml.dart';
import 'package:gobabel/src/scripts/arb_migration_related/find_arb_data.dart';
import 'package:gobabel/src/scripts/arb_migration_related/replace_arb_output_class_to_babel_text.dart';
import 'package:gobabel/src/scripts/extract_project_code_base.dart';
import 'package:gobabel/src/scripts/extract_strings_related/get_harcoded_strings.dart';
import 'package:gobabel/src/scripts/extract_strings_related/map_strings.dart';
import 'package:gobabel/src/scripts/extract_strings_related/update_dart_file_content_strings.dart';
import 'package:gobabel/src/scripts/get_codebase_yaml_info.dart';
import 'package:gobabel/src/scripts/edit_each_file_content.dart';
import 'package:gobabel/src/scripts/git_related/ensure_git_directory_is_configured.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';
import 'package:gobabel/src/scripts/git_related/get_project_last_commit_sha_stamps.dart';
import 'package:gobabel/src/scripts/git_related/reset_all_changes_done.dart';
import 'package:gobabel/src/scripts/git_related/set_target_files.dart';
import 'package:gobabel/src/scripts/translation_related/get_app_languages.dart';
import 'package:gobabel/src/scripts/write_babel_text_file_into_directory.dart';

Future<void> main(List<String> arguments) async {
  final GobabelController controller = GobabelController(
    ensureGitDirectoryIsConfigured: EnsureGitDirectoryIsConfiguredUsecase(),
    getCodeBaseYamlInfo: GetCodeBaseYamlInfoUsecase(),
    getHarcodedStringsUsecase: GetHarcodedStringsUsecase(
      validateCandidateStringUsecase: ValidateCandidateStringUsecase(),
    ),
    runForEachFileTextUsecase: RunForEachFileTextUsecase(),
    mapStringsUsecase: MapStringsUsecase(
      getDynamicValuesInStringUsecase: GetDynamicValuesInStringUsecase(),
    ),
    replaceArbOutputClassToBabelTextUsecase:
        ReplaceArbOutputClassToBabelTextUsecase(),
    updateDartFileContentStringsUsecase: UpdateDartFileContentStringsUsecase(
      getHarcodedStringsUsecase: GetHarcodedStringsUsecase(
        validateCandidateStringUsecase: ValidateCandidateStringUsecase(),
      ),
      mapStringsUsecase: MapStringsUsecase(
        getDynamicValuesInStringUsecase: GetDynamicValuesInStringUsecase(),
      ),
      retriveAllAibabelConstsFromFile: RetriveAllAibabelConstsFromFile(),
    ),
    findArbDataUsecase: FindArbDataUsecase(
      extractLocationDataFromArbFileName:
          ExtractLocationDataFromArbFileNameUsecase(),
      getProjectYamlConfig: GetProjectYamlConfigUsecase(),
      garanteeUniquenessOfKeys: GaranteeUniquenessOfKeysUsecase(),
      inferDeclarationFunctionFromArbJson:
          InferDeclarationFunctionFromArbJsonUsecase(),
    ),
    writeBabelTextFileIntoDirectory: WriteBabelTextFileIntoDirectory(),
    resetAllChangesDoneUsecase: ResetAllChangesDoneUsecase(),
    getProjectGitDependenciesUsecase: GetProjectGitDependenciesUsecase(),
    extractProjectCodeBaseUsecase: ExtractProjectCodeBaseUsecase(),
    getAppLanguagesUsecase: GetAppLanguagesUsecase(),
    setTargetFilesUsecase: SetTargetFilesUsecase(
      setChangedDartFilesBetweenCommitsUsecase:
          SetChangedDartFilesBetweenCommitsUsecase(),
      getProjectLastCommitShaStampsUsecase:
          GetProjectLastCommitShaStampsUsecase(),
      getAllCommitsInCurrentGitTreeOrdoredByTime:
          GetAllCommitsInCurrentGitTreeOrdoredByTime(),
    ),
  );

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
      exit(1);
    } catch (e) {
      print('❌ Error reading package version: $e'.red);
      exit(0);
    }
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
    try {
      await controller.sync(projectApiToken: apiKey, directory: directory);
      print('✅  Sync operation completed successfully.'.green);
      exit(0);
    } catch (e) {
      print('\n❌ Error during sync operation:\n$e'.red);
      exit(1);
    }
  }
  // Handle the generate command
  else if (argResults['generate'] as bool) {
    if (argResults['language'] == null) {
      print('❌ Error: --language is required for generate operation.'.red);
      printUsage(parser);
      exit(0);
    }
    if (argResults['api-key'] == null) {
      print('❌ Error: --api-key is required for generate operation.'.red);
      printUsage(parser);
      exit(0);
    }
    final language = argResults['language'] as String;
    final apiKey = argResults['api-key'] as String;
    // Split the language into languageCode and countryCode
    final parts = language.split('_');
    if (parts.length != 2) {
      print(
        '❌ Error: Invalid language format.\n'
                'Expected language_country, in this exact format, e.g., en_US.'
            .red,
      );
      exit(0);
    }
    final languageCode = parts[0];
    final countryCode = parts[1];
    try {
      final BabelSupportedLocales? babelSupportedLocale =
          BabelSupportedLocales.fromLocale(languageCode, countryCode);
      if (babelSupportedLocale == null) {
        print('❌ Error: Invalid language/country code for $language'.red);
        exit(1);
      }
      await controller.generateNewVersion(
        projectApiToken: apiKey,
        labelLocale: babelSupportedLocale,
        directory: directory,
      );
      print('✅ Generate operation completed successfully.'.green);
      exit(1);
    } catch (e) {
      print('\n❌ Error during generate operation:\n$e'.red);
      exit(1);
    }
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
    // --attach-to-user-with-id
    try {
      final accountApiKey = argResults['attach-to-user-with-id'] as String;
      await controller.create(
        directory: directory,
        accountApiKey: accountApiKey,
      );
      print('✅ Create operation completed successfully.'.green);
      exit(1);
    } catch (e) {
      print('\n❌ Error during create operation:\n$e'.red);
      exit(1);
    }
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
