import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel/src/core/type_defs.dart';

part 'files_verification.freezed.dart';

@freezed
abstract class FilesVerification with _$FilesVerification {
  factory FilesVerification.fromZero() = _FilesVerificationFromZero;

  factory FilesVerification.fromLastCommit({
    required List<ChangedPaths> changedFilesPath,
  }) = _FilesVerificationFromLastCommit;
}
