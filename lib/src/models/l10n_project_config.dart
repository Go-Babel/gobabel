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
    required bool syntheticPackage,
  }) = L10nProjectConfigWithData;

  factory L10nProjectConfig.noData() = _L10nProjectConfigNoData;
  factory L10nProjectConfig.fromJson(Map<String, dynamic> json) =>
      _$L10nProjectConfigFromJson(json);
}

extension L10nProjectConfigExtensions on L10nProjectConfigWithData {
  String getImportString(String projectName) {
    // Convert outputClass to lowercase for the file name
    final fileName = outputClass.toLowerCase();
    
    if (syntheticPackage) {
      // When using synthetic package, always use flutter_gen
      return 'package:flutter_gen/gen_l10n/$fileName.dart';
    } else {
      // When not using synthetic package, use project package name with output dir
      // Remove leading 'lib/' if present in outputDir
      final cleanOutputDir = outputDir.startsWith('lib/') 
          ? outputDir.substring(4) 
          : outputDir;
      
      return 'package:$projectName/$cleanOutputDir/$fileName.dart';
    }
  }
}
