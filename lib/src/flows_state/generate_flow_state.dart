import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel/src/core/converters/babel_supported_locales_json_converter.dart';
import 'package:gobabel/src/entities/api_client_entity.dart';
import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/models/extract_hardcode_string/babel_label_entity.dart';
import 'package:gobabel/src/models/files_verification.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel/src/models/l10n_project_config.dart';
import 'package:gobabel/src/models/project_arb_data.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/get_eligible_files.dart';
import 'package:gobabel/src/usecases/key_integrity/garantee_key_integrity.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

part 'generate_flow_state.freezed.dart';
part 'generate_flow_state.g.dart';

@freezed
abstract class GenerateFlowState with _$GenerateFlowState {
  const GenerateFlowState._();

  /// Step 1
  factory GenerateFlowState.initial({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
  }) = GenerateFlowInitial;

  /// Step 2
  factory GenerateFlowState.createdClient({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
  }) = GenerateFlowCreatedClient;

  /// Step 3
  factory GenerateFlowState.ensuredGit({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
  }) = GenerateFlowEnsureGit;

  /// Step 4
  factory GenerateFlowState.gotCodeBaseYaml({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
  }) = GenerateFlowGotCodeBaseYaml;

  /// Step 5
  factory GenerateFlowState.gotGitUser({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitUser gitUser,
  }) = GenerateFlowGotGitUser;

  /// Step 6
  factory GenerateFlowState.gotLastLocalCommit({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitUser gitUser,
    required GitCommit previousCommit,
  }) = GenerateFlowGotLastLocalCommit;

  /// Step 7
  factory GenerateFlowState.gotProjectOriginUrl({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitUser gitUser,
    required GitCommit previousCommit,
    required String projectOriginUrl,
  }) = GenerateFlowGotProjectOriginUrl;

  /// Step 8
  factory GenerateFlowState.gotGitVariables({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
  }) = GenerateFlowGotGitVariables;

  /// Step 9
  factory GenerateFlowState.gotAppLanguages({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required Set<BabelSupportedLocales> languages,
    required String downloadLink,
  }) = GenerateFlowGotAppLanguages;

  /// Step 10
  factory GenerateFlowState.downloadReferenceArb({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required Set<BabelSupportedLocales> languages,
    required String downloadLink,
    required Map<L10nKey, L10nValue> referenceArbMap,
  }) = GenerateFlowDownloadReferenceArb;

  /// Step 11
  factory GenerateFlowState.projectCacheMap({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required Set<BabelSupportedLocales> languages,
    required String downloadLink,
    required Map<L10nKey, L10nValue> referenceArbMap,
    required ProjectCacheMap projectCacheMap,
  }) = GenerateFlowProjectCacheMap;

  /// Step 12
  factory GenerateFlowState.resolvedProjectCacheTranslation({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required Set<BabelSupportedLocales> languages,
    required String downloadLink,
    required Map<L10nKey, L10nValue> referenceArbMap,
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
  }) = GenerateFlowResolvedProjectCacheTranslation;

  /// Step 13
  factory GenerateFlowState.ensuredTheresNoStaticErrorOnDartFiles({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required Set<BabelSupportedLocales> languages,
    required String downloadLink,
    required Map<L10nKey, L10nValue> referenceArbMap,
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
  }) = GenerateFlowEnsuredNoStaticErrorOnDartFiles;

  /// Step 14
  factory GenerateFlowState.gotTargetFiles({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required Set<BabelSupportedLocales> languages,
    required String downloadLink,
    required Map<L10nKey, L10nValue> referenceArbMap,
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
  }) = GenerateFlowGotTargetFiles;

  /// Step 15
  factory GenerateFlowState.gotL10nProjectConfig({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required Set<BabelSupportedLocales> languages,
    required String downloadLink,
    required Map<L10nKey, L10nValue> referenceArbMap,
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required L10nProjectConfig l10nProjectConfig,
  }) = GenerateFlowGotL10nProjectConfig;

  /// Step 16
  factory GenerateFlowState.mappedProjectArbData({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required Set<BabelSupportedLocales> languages,
    required String downloadLink,
    required Map<L10nKey, L10nValue> referenceArbMap,
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
  }) = GenerateFlowMappedProjectArbData;

  /// Step 17
  factory GenerateFlowState.resolvedProjectArbTranslationPayload({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required Set<BabelSupportedLocales> languages,
    required String downloadLink,
    required Map<L10nKey, L10nValue> referenceArbMap,
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
  }) = GenerateFlowResolvedProjectArbTranslationPayload;

  /// Step 18
  factory GenerateFlowState.replacedAllL10nKeyReferencesInCodebaseForBabelFunctions({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required Set<BabelSupportedLocales> languages,
    required String downloadLink,
    required Map<L10nKey, L10nValue> referenceArbMap,
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
  }) = GenerateFlowReplacedAllL10nKeyReferencesInCodebaseForBabelFunctions;

  /// Step 19
  factory GenerateFlowState.codebaseNormalized({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required Set<BabelSupportedLocales> languages,
    required String downloadLink,
    required Map<L10nKey, L10nValue> referenceArbMap,
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
  }) = GenerateFlowCodebaseNormalized;

  /// Step 20
  factory GenerateFlowState.resolvedHardcodedStrings({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required Set<BabelSupportedLocales> languages,
    required String downloadLink,
    required Map<L10nKey, L10nValue> referenceArbMap,
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
    required TranslationPayloadInfo hardcodedStringsPayloadInfo,
    required Map<FilePath, List<BabelLabelEntityRootLabel>>
    hardcodedStringsPerFile,
  }) = GenerateFlowResolvedHardcodedStrings;

  /// Step 21
  factory GenerateFlowState.replacedHardcodedStringsForBabelText({
    required bool willLog,
    required String projectApiToken,
    required String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required BabelSupportedLocales inputedByUserLocale,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required Set<BabelSupportedLocales> languages,
    required String downloadLink,
    required Map<L10nKey, L10nValue> referenceArbMap,
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
    required TranslationPayloadInfo hardcodedStringsPayloadInfo,
    required Map<FilePath, List<BabelLabelEntityRootLabel>>
    hardcodedStringsPerFile,
  }) = GenerateFlowReplacedHardcodedStringsForBabelText;

  Directory get directory {
    return Directory(directoryPath);
  }

  Future<List<File>> get filesToBeAnalysed async {
    final filesVerificationState = mapOrNull(
      gotTargetFiles: (value) => value.filesVerificationState,
    );
    if (filesVerificationState == null) return <File>[];

    return await filesVerificationState.map(
      fromLastCommit: (value) async {
        final List<File> changedFiles = [];
        for (final filePath in value.changedFilesPath) {
          final file = File(filePath);
          if (await file.exists()) {
            changedFiles.add(file);
          }
        }

        return changedFiles;
      },
      fromZero: (value) async => await getEligibleFiles(directory),
    );
  }

  factory GenerateFlowState.fromJson(Map<String, dynamic> json) =>
      _$GenerateFlowStateFromJson(json);
}

AsyncResult<GenerateFlowInitial> generate_initFlowState({
  required bool willLog,
  required String projectApiToken,
  required String directoryPath,
  required BabelSupportedLocales inputedByUserLocale,
}) async {
  final createFlowInitial = GenerateFlowInitial(
    willLog: willLog,
    projectApiToken: projectApiToken,
    directoryPath: directoryPath,
    inputedByUserLocale: inputedByUserLocale,
  );
  final existsDirectory = await createFlowInitial.directory.exists();
  if (!existsDirectory) {
    return Failure(
      BabelException(
        title: 'Directory does not exist',
        description:
            'The directory at ${createFlowInitial.directoryPath} does not exist.',
      ),
    );
  }

  return createFlowInitial.toSuccess();
}
