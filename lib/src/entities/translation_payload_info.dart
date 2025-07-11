import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel/src/core/converters/babel_supported_locales_json_converter.dart';
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
    required List<Translatables> referenceMap,
  }) = _TranslationPayloadInfo;

  factory TranslationPayloadInfo.fromJson(Map<String, dynamic> json) =>
      _$TranslationPayloadInfoFromJson(json);
}

@freezed
abstract class Translatables with _$Translatables {
  const Translatables._();
  factory Translatables({
    @BabelSupportedLocalesJsonConverter() required BabelSupportedLocales locale,
    required Map<L10nKey, L10nValue> referenceMap,
  }) = _Translatables;

  factory Translatables.fromEntries(
    MapEntry<BabelSupportedLocales, Map<L10nKey, L10nValue>> entry,
  ) {
    return Translatables(locale: entry.key, referenceMap: entry.value);
  }

  factory Translatables.fromJson(Map<String, dynamic> json) =>
      _$TranslatablesFromJson(json);
}

extension TranslationPayloadInfoX on TranslationPayloadInfo {}
