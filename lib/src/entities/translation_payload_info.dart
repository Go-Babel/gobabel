import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel_core/gobabel_core.dart';

part 'translation_payload_info.freezed.dart';
part 'translation_payload_info.g.dart';

@freezed
abstract class TranslationPayloadInfo with _$TranslationPayloadInfo {
  factory TranslationPayloadInfo({
    required Map<HardCodedString, TranslationKey> hardcodedStringToKeyCache,
    required Map<TranslationKey, BabelFunctionDeclaration> keyToDeclaration,
    required Map<TranslationKey, BabelFunctionImplementation>
    keyToImplementation,
    required Map<TranslationKey, Set<ContextPath>> keyToContextsPaths,
  }) = _TranslationPayloadInfo;

  factory TranslationPayloadInfo.fromJson(Map<String, dynamic> json) =>
      _$TranslationPayloadInfoFromJson(json);
}

extension TranslationPayloadInfoX on TranslationPayloadInfo {}
