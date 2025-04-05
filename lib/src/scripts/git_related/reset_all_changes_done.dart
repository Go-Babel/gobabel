import 'package:git/git.dart';

class ResetAllChangesDoneUsecase {
  ResetAllChangesDoneUsecase();

  // Run command "git restore ."
  Future<void> call() async {
    await runGit(['restore', '.']);
  }
}
