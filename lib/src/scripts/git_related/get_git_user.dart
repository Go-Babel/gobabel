import 'dart:io';

import 'package:gobabel/src/core/dependencies.dart';

class GetGitUserUsecase {
  Future<GitUser> call() async {
    try {
      final nameResult = await Process.run('git', ['config', 'user.name']);
      final emailResult = await Process.run('git', ['config', 'user.email']);

      final name = nameResult.stdout.toString().trim();
      final email = emailResult.stdout.toString().trim();

      return GitUser(name: name, email: email);
    } catch (e) {
      throw Exception(
        'Failed to get git user information.\nPlease ensure you have Git installed and configured correctly.\nAlso, check if you are in the correct path: ${Dependencies.targetDirectory.path}',
      );
    }
  }
}

class GitUser {
  final String name;
  final String email;

  const GitUser({required this.name, required this.email});
}
