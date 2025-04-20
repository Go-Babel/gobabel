import 'dart:io';

import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/scripts/git_related/set_changed_files_between_commits.dart';
import 'package:test/test.dart';

void main() {
  setUpAll(() {
    Dependencies.resetAll();
  });

  // Commit history
  // 62c704a19aef84febda0c7cc2b42e715171b0001 Igor 2025-04-05 Initial commit
  // f83bd7a085c2814050343742aa88c2c87549f8af Igor 2025-04-05 First file dump
  // 63daa6a64efff2e9b6b444cb835d2e67249ec7d4 Igor 2025-04-10 Adds project synchronization and codebase extraction features
  // 3418f6a0f17f23726f78b01214f8b3455b8c3855 Igor 2025-04-18 Introduces plugin dependencies configuration and refactors AibabelController
  // 7680d190ae71011b780a1572b554eb1a1f5bd3dc Igor 2025-04-18 Adds ARB output class replacement feature
  // e2d6d5985c3776a3a537aa5edcae15793a50e763 Igor 2025-04-18 Refactors ARB output handling in Babel text migration
  test('get changed files between commits ...', () async {
    final getChangedDartFilesBetweenCommitsUsecase =
        SetChangedDartFilesBetweenCommitsUsecase();

    await getChangedDartFilesBetweenCommitsUsecase.call(
      commit1: '62c704a19aef84febda0c7cc2b42e715171b0001',
      commit2: '63daa6a64efff2e9b6b444cb835d2e67249ec7d4',
    );
    expect(Dependencies.changedPaths, equals(exceptedResult));
  });
}

final exceptedResult = {
  "bin/gobabel.dart",
  "lib/aibabel.dart",
  "lib/src/aibabel_controller.dart",
  "lib/src/core/constants.dart",
  "lib/src/core/dependencies.dart",
  "lib/src/core/extensions/string_extensions.dart",
  "lib/src/core/promps_contants.dart",
  "lib/src/core/type_defs.dart",
  "lib/src/core/utils/case_identify.dart",
  "lib/src/core/utils/recase.dart",
  "lib/src/generated_files_reference/babel_text.dart",
  "lib/src/generated_files_reference/babel_text_dependencies.dart",
  "lib/src/models/code_base_yaml_info.dart",
  "lib/src/models/code_base_yaml_info.freezed.dart",
  "lib/src/models/sentence.dart",
  "lib/src/models/sentence.freezed.dart",
  "lib/src/scripts/arb_migration_related/exclude_arb_dependencies.dart",
  "lib/src/scripts/arb_migration_related/extract_location_data_from_arb_file_name.dart",
  "lib/src/scripts/arb_migration_related/find_arb_data.dart",
  "lib/src/scripts/arb_migration_related/garantee_uniqueness_of_keys.dart",
  "lib/src/scripts/arb_migration_related/get_project_yaml_config.dart",
  "lib/src/scripts/arb_migration_related/infer_declaration_function_from_arb_json.dart",
  "lib/src/scripts/edit_each_file_content.dart",
  "lib/src/scripts/extract_project_code_base.dart",
  "lib/src/scripts/extract_strings_related/get_dynamic_values_in_string.dart",
  "lib/src/scripts/extract_strings_related/get_harcoded_strings.dart",
  "lib/src/scripts/extract_strings_related/map_strings.dart",
  "lib/src/scripts/extract_strings_related/retrive_all_aibabel_consts_from_file.dart",
  "lib/src/scripts/extract_strings_related/update_dart_file_content_strings.dart",
  "lib/src/scripts/extract_strings_related/validate_candidate_string.dart",
  "lib/src/scripts/get_codebase_yaml_info.dart",
  "lib/src/scripts/git_related/ensure_git_directory_is_configured.dart",
  "lib/src/scripts/git_related/get_project_git_dependencies.dart",
  "lib/src/scripts/git_related/reset_all_changes_done.dart",
  "lib/src/scripts/notify_aibabel_api_about_new_version.dart",
  "lib/src/scripts/test_multiple_texts.dart",
  "lib/src/scripts/testi.dart",
  "lib/src/scripts/write_babel_text_file_into_directory.dart",
  "test/aibabel_test.dart",
  "test/src/scripts/extract_strings_related/get_dynamic_values_in_string_test.dart",
  "test/src/scripts/extract_strings_related/get_harcoded_strings_test.dart",
  "test/src/scripts/extract_strings_related/map_strings_test.dart",
  "test/src/scripts/extract_strings_related/retrive_all_aibabel_consts_from_file_test.dart",
  "test/src/scripts/extract_strings_related/validate_candidate_string_test.dart",
  "test/src/utls/dependencies_class_binding.dart",
  "test/test_string_identifier.dart",
};

Future<void> get() async {
  // Replace this with the path to your Git repository
  final repoPath = Directory.current.path;

  // Check if the directory is a Git repository
  final gitDir = Directory('$repoPath/.git');
  if (!gitDir.existsSync()) {
    print('This is not a Git repository.');
    return;
  }

  // Run git log command to get commits from oldest to newest
  final result = await Process.run(
    'git',
    ['log', '--reverse', '--pretty=format:%H %an %ad %s', '--date=short'],
    workingDirectory: repoPath,
    runInShell: true,
  );

  if (result.exitCode != 0) {
    print('Error running git: ${result.stderr}');
    return;
  }

  // Print the list of commits
  final output = result.stdout as String;
  print('Commits from oldest to newest:\n');
  print(output);
}
