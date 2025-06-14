import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel_core/gobabel_core.dart';

part 'files_verification.freezed.dart';
part 'files_verification.g.dart';

@freezed
abstract class FilesVerification with _$FilesVerification {
  factory FilesVerification.fromZero() = _FilesVerificationFromZero;

  factory FilesVerification.fromLastCommit({
    required List<ChangedFilePath> changedFilesPath,
  }) = _FilesVerificationFromLastCommit;

  factory FilesVerification.fromJson(Map<String, dynamic> json) =>
      _$FilesVerificationFromJson(json);
}
