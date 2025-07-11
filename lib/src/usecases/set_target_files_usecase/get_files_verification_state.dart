import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/files_verification.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel/src/usecases/set_target_files_usecase/get_all_commits_in_current_git_tree_ordered_by_time.dart';
import 'package:gobabel/src/usecases/set_target_files_usecase/get_changed_files_path_between_commits.dart';
import 'package:gobabel/src/usecases/set_target_files_usecase/get_project_last_commit_sha_stamps_usecase.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<FilesVerification> getFilesVerificationState({
  required String projectApiToken,
  required GitVariables gitVariables,
  required Client client,
  required String directoryPath,
}) async {
  final ShaCommit curentSha = gitVariables.latestShaIdentifier;
  final projectVersionsShasResponse =
      await getAllCommitsInCurrentGitTreeOrderedByTime(
        directoryPath: directoryPath,
      );

  if (projectVersionsShasResponse.isError()) {
    return projectVersionsShasResponse.asBabelResultErrorAsync();
  }

  final List<ShaCommit> projectVersionsShas =
      projectVersionsShasResponse.getOrThrow();

  if (projectVersionsShas.isEmpty) {
    return FilesVerification.fromZero().toSuccess();
  }

  final allTreeCommitsResponse = await getProjectLastCommitShaStampsUsecase(
    projectApiToken: projectApiToken,
    gitVariables: gitVariables,
    client: client,
  );
  if (allTreeCommitsResponse.isError()) {
    return allTreeCommitsResponse.asBabelResultErrorAsync();
  }

  final List<ShaCommit> allTreeCommits = allTreeCommitsResponse.getOrThrow();

  // The [projectVersionsShas] most recent commit that is inside the [allTreeCommits]
  ShaCommit? lastTrackedCommit;
  for (final String commit in allTreeCommits) {
    if (allTreeCommits.contains(commit)) {
      final isWithinLastProjectTrackedCommit = projectVersionsShas.any(
        (ShaCommit elementShaCommit) => elementShaCommit == commit,
      );
      if (isWithinLastProjectTrackedCommit) {
        lastTrackedCommit = commit;
        break;
      }
    }
  }

  if (lastTrackedCommit == null) {
    return FilesVerification.fromZero().toSuccess();
  }

  final isCurrentLastTrackedCommit = lastTrackedCommit == curentSha;
  if (isCurrentLastTrackedCommit) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Translation already up to date',
        description:
            'You already generated a translation for the current state of your codebase.\nNo changes have been detected since the last translation generation.\n\nIf you need to regenerate translations, make changes to your Dart files and commit them.',
      ),
    ).toFailure();
  }

  final changedFilesBetweenCommitsResponse =
      await getChangedFilesPathBetweenCommits(
        dirrPath: directoryPath,
        commit1: lastTrackedCommit,
        commit2: curentSha,
      );

  if (changedFilesBetweenCommitsResponse.isError()) {
    return changedFilesBetweenCommitsResponse.asBabelResultErrorAsync();
  }

  final Set<String> changedFiles =
      changedFilesBetweenCommitsResponse.getOrThrow();

  return FilesVerification.fromLastCommit(
    changedFilesPath: changedFiles.toList(),
  ).toSuccess();
}

AsyncBabelResult<GenerateFlowGotTargetFiles> generate_getFilesVerificationState(
  GenerateFlowEnsuredNoStaticErrorOnDartFiles payload,
) async {
  final filesVerificationState = await getFilesVerificationState(
    projectApiToken: payload.projectApiToken,
    client: payload.client.server,
    gitVariables: payload.gitVariables,
    directoryPath: payload.directoryPath,
  );

  return filesVerificationState.flatMap((filesVerification) {
    return GenerateFlowGotTargetFiles(
      willLog: payload.willLog,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      inputedByUserLocale: payload.inputedByUserLocale,
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitVariables: payload.gitVariables,
      maxLanguageCount: payload.maxLanguageCount,
      languages: payload.languages,
      projectCacheMap: payload.projectCacheMap,
      cacheMapTranslationPayloadInfo: payload.cacheMapTranslationPayloadInfo,
      filesVerificationState: filesVerification,
    ).toSuccess();
  });
}
