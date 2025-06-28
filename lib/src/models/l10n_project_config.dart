import 'package:freezed_annotation/freezed_annotation.dart';

part 'l10n_project_config.freezed.dart';
part 'l10n_project_config.g.dart';

@freezed
abstract class L10nProjectConfig with _$L10nProjectConfig {
  factory L10nProjectConfig.withData({
    required String l10nFileName,
    required String templateArbFile,
    required String outputClass,
    required String outputDir,
    required String arbDir,
  }) = L10nProjectConfigWithData;

  factory L10nProjectConfig.noData() = _L10nProjectConfigNoData;
  factory L10nProjectConfig.fromJson(Map<String, dynamic> json) =>
      _$L10nProjectConfigFromJson(json);
}
