import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel_client/gobabel_client.dart';

import '../../core/utils/git_process_runner.dart';

class GetGitUserUsecase {
  Future<GitUser> call() async {
    try {
      final nameResult = await BabelProcessRunner.run('git config user.name');
      final emailResult = await BabelProcessRunner.run('git config user.email');

      final name = nameResult.stdout.toString().trim();
      final email = emailResult.stdout.toString().trim();

      return GitUser(authorName: name, authorEmail: email);
    } catch (e) {
      throw Exception(
        'Failed to get git user information.\nPlease ensure you have Git installed and configured correctly.\nAlso, check if you are in the correct path: ${Dependencies.targetDirectory.path}',
      );
    }
  }
}
