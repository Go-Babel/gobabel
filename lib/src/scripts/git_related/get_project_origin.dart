import 'dart:io';

class GetProjectOriginUsecase {
  Future<String> call() async {
    try {
      final result = await Process.run('git', ['remote', 'get-url', 'origin']);

      if (result.exitCode != 0) {
        throw Exception('❌ Could not get remote URL: ${result.stderr}');
      }

      return result.stdout.toString().trim();
    } catch (e, s) {
      throw Exception('⚠️ Error detecting Git host: $e\n\n$s');
    }
  }
}
