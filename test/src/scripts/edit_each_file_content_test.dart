import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/models/files_verification.dart';
import 'package:gobabel/src/scripts/edit_each_file_content.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
    Dependencies.resetAll();
    Dependencies.filesVerificationState = FilesVerification.fromLastCommit(
      changedFilesPath: ["lib/src/scripts/edit_each_file_content.dart"],
    );
  });

  test('edit each file content ...', () async {
    final RunForEachFileTextUsecase runForEachFileTextUsecase =
        RunForEachFileTextUsecase();

    String? resultFileContentAsString;

    await runForEachFileTextUsecase(
      onDartFileFinded: (filePath, fileContentAsString) async {
        print(filePath);
        print('-----------------');
        resultFileContentAsString = fileContentAsString;
        return null;
      },
    );

    expect(resultFileContentAsString, isNotNull);
    expect(resultFileContentAsString, isA<String>());
    expect(
      resultFileContentAsString!.contains('RunForEachFileTextUsecase'),
      isTrue,
    );
  });
}
