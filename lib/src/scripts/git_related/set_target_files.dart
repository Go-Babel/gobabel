import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel/src/models/files_verification.dart';
import 'package:gobabel/src/scripts/git_related/get_all_commits_in_current_git_tree_time_sorted.dart';
import 'package:gobabel/src/scripts/git_related/get_project_last_commit_sha_stamps.dart';
import 'package:gobabel/src/scripts/git_related/set_changed_files_between_commits.dart';

/// The target files are the ones changed since last tracked commit.
class SetTargetFilesUsecase {
  final GetAllCommitsInCurrentGitTreeOrdoredByTime
  _getAllCommitsInCurrentGitTreeOrdoredByTime;
  final SetChangedDartFilesBetweenCommitsUsecase
  _setChangedDartFilesBetweenCommitsUsecase;
  final GetProjectLastCommitShaStampsUsecase
  _getProjectLastCommitShaStampsUsecase;

  const SetTargetFilesUsecase({
    required GetAllCommitsInCurrentGitTreeOrdoredByTime
    getAllCommitsInCurrentGitTreeOrdoredByTime,
    required SetChangedDartFilesBetweenCommitsUsecase
    setChangedDartFilesBetweenCommitsUsecase,
    required GetProjectLastCommitShaStampsUsecase
    getProjectLastCommitShaStampsUsecase,
  }) : _getAllCommitsInCurrentGitTreeOrdoredByTime =
           getAllCommitsInCurrentGitTreeOrdoredByTime,
       _setChangedDartFilesBetweenCommitsUsecase =
           setChangedDartFilesBetweenCommitsUsecase,
       _getProjectLastCommitShaStampsUsecase =
           getProjectLastCommitShaStampsUsecase;

  Future<void> call({required String projectApiToken}) async {
    final ShaCommit curentSha = Dependencies.gitVariables.latestShaIdentifier;

    // Sort. The most recent first.
    final List<ShaCommit> projectVersionsShas = [
      ...await _getProjectLastCommitShaStampsUsecase(
        projectApiToken: projectApiToken,
      ),
    ];

    if (projectVersionsShas.isEmpty) {
      Dependencies.filesVerificationState = FilesVerification.fromZero();
      return;
    }

    final List<ShaCommit> allTreeCommits =
        await _getAllCommitsInCurrentGitTreeOrdoredByTime.call();
    if (allTreeCommits.contains(curentSha)) {
      throw Exception(
        'Your already generated a translation for this state that your code base currently is.',
      );
    }

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
      Dependencies.filesVerificationState = FilesVerification.fromZero();
      return;
    }

    await _setChangedDartFilesBetweenCommitsUsecase(
      commit1: lastTrackedCommit,
      commit2: curentSha,
    );
  }
}
