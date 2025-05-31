import 'package:gobabel/src/core/utils/git_process_runner.dart';

class ResetAllChangesDoneUsecase {
  ResetAllChangesDoneUsecase();

  // Run commands to reset all changes including untracked files
  Future<void> call() async {
    await BabelProcessRunner.run('git reset --hard HEAD');
    await BabelProcessRunner.run('git clean -fd');
  }
}
