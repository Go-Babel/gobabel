import 'package:gobabel/src/core/utils/git_process_runner.dart';

class ResetAllChangesDoneUsecase {
  ResetAllChangesDoneUsecase();

  // Run command "git restore ."
  Future<void> call() async {
    // await BabelProcessRunner.run('git restore .');
    await BabelProcessRunner.run('git reset --hard HEAD');
    // await runGit(['restore', '.']);
  }
}
