import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel/src/core/converters/babel_supported_locales_json_converter.dart';
import 'package:gobabel/src/models/l10n_project_config.dart';
import 'package:gobabel_core/gobabel_core.dart';

part 'project_arb_data.freezed.dart';
part 'project_arb_data.g.dart';

@freezed
abstract class ArbDataState with _$ArbDataState {
  factory ArbDataState.withData({
    required L10nProjectConfig config,
    required Map<TranslationKey, Set<VariableName>> variablesPlaceholdersPerKey,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales mainLocale,
    required List<ArbFileData> preMadeTranslationArb,
  }) = _ArbDataState;

  factory ArbDataState.noneData() = _ArbDataStateNoneData;

  factory ArbDataState.fromJson(Map<String, dynamic> json) =>
      _$ArbDataStateFromJson(json);
}

@freezed
abstract class ArbFileData with _$ArbFileData {
  factory ArbFileData({
    @BabelSupportedLocalesJsonConverter() required BabelSupportedLocales locale,
    required Map<L10nKey, L10nValue> allKeyValues,
  }) = _ArbFileData;

  factory ArbFileData.fromJson(Map<String, dynamic> json) =>
      _$ArbFileDataFromJson(json);
}
