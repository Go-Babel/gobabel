import 'dart:io';

import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/models/files_verification.dart';
import 'package:gobabel/src/scripts/edit_each_file_content.dart';
import 'package:test/test.dart';

import '../utls/dependencies_class_binding.dart';

void main() {
  setUp(() {
    setDependenciesMock();
    Dependencies.filesVerificationState = FilesVerification.fromLastCommit(
      changedFilesPath: ["lib/src/scripts/edit_each_file_content.dart"],
    );
  });

  test('Should run from zero', () async {
    print(Directory.current.path);
    Dependencies.setTargetDirectory(Directory.current);
    Dependencies.filesVerificationState = FilesVerification.fromZero();
    final RunForEachFileTextUsecase runForEachFileTextUsecase =
        RunForEachFileTextUsecase();

    await runForEachFileTextUsecase(
      onDartFileFinded: (filePath, fileContentAsString) async {
        print(filePath);
        return null;
      },
    );
  });

  test('edit each file content ...', () async {
    Dependencies.filesVerificationState = FilesVerification.fromLastCommit(
      changedFilesPath: ["lib/src/scripts/edit_each_file_content.dart"],
    );
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
