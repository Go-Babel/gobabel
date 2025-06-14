import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/utils/git_process_runner.dart';

class CommitAllChangesUsecase {
  Future<void> call() async {
    // 1. Stage all changes

    var addResult = await BabelProcessRunner.run('git add .');
    if (addResult.exitCode != 0) {
      final output = addResult.stdout as String;
      print(output.cadetBlue);
      throw Exception(
        'GOBABEL bot could not stage translation changes.\n>> Now, you should stage the changes manually\nThis could be a problem with your git configuration.\nAlso, double-check if cli have the permissions for making commits\nPlease check if you have a valid git user configured.',
      );
    }

    final yamlInfo = Dependencies.codeBaseYamlInfo;
    final versionText = yamlInfo.version;
    // 2. Commit with your generated message and custom author
    final message =
        'Gobabel translation | $versionText\n\ngobabel static translation analysis number for version $versionText';
    final author = 'Gobabel Bot <admin@gobabel.io>';
    final commitResult = await BabelProcessRunner.run(
      'git commit -m "$message" --author "$author"',
    );

    if (commitResult.exitCode != 0) {
      throw Exception(
        'GOBABEL bot could not commit translation changes.\n>> Now, you should commit the changes manually\nThis could be a problem with your git configuration.\nAlso, double-check if cli have the permissions for making commits\nPlease check if you have a valid git user configured.',
      );
    }

    // 3. Push to the current branch
    final pushResult = await BabelProcessRunner.run('git push -u origin HEAD');

    if (pushResult.exitCode != 0) {
      final output = pushResult.stderr as String;
      print(
        '(${pushResult.exitCode}) output: ${output.green}',
      ); //TODO(igor): Remove this, only for debugging
      throw Exception(
        'GOBABEL bot could not push translation changes.\n>> Now, you should push the changes manually\nThis could be a problem with your git configuration.\nAlso, double-check if cli have the permissions for making commits\nPlease check if you have a valid git user configured.',
      );
    }
  }
}
