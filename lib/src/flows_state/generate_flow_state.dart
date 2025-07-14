import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/converters/babel_supported_locales_json_converter.dart';
import 'package:gobabel/src/entities/api_client_entity.dart';
import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/flows_state/flow_interface.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/models/extract_hardcode_string/babel_label_entity.dart';
import 'package:gobabel/src/models/extract_hardcode_string/hardcoded_string_entity.dart';
import 'package:gobabel/src/models/extract_hardcode_string/labels_entity.dart';
import 'package:gobabel/src/models/files_verification.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel/src/models/l10n_project_config.dart';
import 'package:gobabel/src/models/project_arb_data.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/get_eligible_files.dart';
import 'package:gobabel/src/usecases/hardcoded_string/create_human_friendly_arb_keys.dart';
import 'package:gobabel/src/usecases/key_integrity/garantee_key_integrity.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

part 'generate_flow_state.freezed.dart';
part 'generate_flow_state.g.dart';

@freezed
abstract class GenerateFlowState
    with _$GenerateFlowState
    implements FlowInterface<GenerateFlowState> {
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
  }) = GenerateFlowGotAppLanguages;

  /// Step 10
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
    required ProjectCacheMap projectCacheMap,
  }) = GenerateFlowProjectCacheMap;

  /// Step 11
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
  }) = GenerateFlowResolvedProjectCacheTranslation;

  /// Step 12
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
  }) = GenerateFlowEnsuredNoStaticErrorOnDartFiles;

  /// Step 13
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
  }) = GenerateFlowGotTargetFiles;

  /// Step 14
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required L10nProjectConfig l10nProjectConfig,
  }) = GenerateFlowGotL10nProjectConfig;

  /// Step 15
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
  }) = GenerateFlowMappedProjectArbData;

  /// Step 16
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
  }) = GenerateFlowResolvedProjectArbTranslationPayload;

  /// Step 17
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
  }) = GenerateFlowReplacedAllL10nKeyReferencesInCodebaseForBabelFunctions;

  /// Step 18
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
  }) = GenerateFlowCodebaseNormalized;

  /// Step 19
  factory GenerateFlowState.extractedAllStrings({
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
    required List<HardcodedStringEntity> allExtractedStrings,
  }) = GenerateFlowExtractedAllStrings;

  /// Step 20
  factory GenerateFlowState.definedStringLabels({
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
    required List<HardcodedStringEntity> allExtractedStrings,
    required List<HardcodedStringEntity> labelStrings,
  }) = GenerateFlowDefinedStringLabels;

  /// Step 21
  factory GenerateFlowState.createdHumanFriendlyArbKeys({
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
    required List<HardcodedStringEntity> allExtractedStrings,
    required List<HardcodedStringEntity> labelStrings,
    required HumanFriendlyResponse humanFriendlyResponse,
  }) = GenerateFlowCreatedHumanFriendlyArbKeys;

  /// Step 22
  factory GenerateFlowState.mappedStringsHierarchy({
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
    required List<HardcodedStringEntity> allExtractedStrings,
    required List<HardcodedStringEntity> labelStrings,
    required HumanFriendlyResponse humanFriendlyResponse,
    required List<LabelsEntityRootLabel> labelEntities,
  }) = GenerateFlowMappedStringsHierarchy;

  /// Step 23
  factory GenerateFlowState.mappedBabelLabels({
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
    required List<HardcodedStringEntity> allExtractedStrings,
    required List<HardcodedStringEntity> labelStrings,
    required HumanFriendlyResponse humanFriendlyResponse,
    required List<LabelsEntityRootLabel> labelEntities,
    required List<BabelLabelEntityRootLabel> babelLabels,
  }) = GenerateFlowMappedBabelLabels;

  /// Step 24
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

  /// Step 25
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

  /// Step 26
  factory GenerateFlowState.appliedCodebaseGeneralDartFixes({
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
    required TranslationPayloadInfo hardcodedStringsPayloadInfo,
    required Map<FilePath, List<BabelLabelEntityRootLabel>>
    hardcodedStringsPerFile,
  }) = GenerateFlowAppliedCodebaseGeneralDartFixes;

  /// Step 27
  factory GenerateFlowState.generatedBabelClass({
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
    required TranslationPayloadInfo hardcodedStringsPayloadInfo,
    required Map<FilePath, List<BabelLabelEntityRootLabel>>
    hardcodedStringsPerFile,
    required String babelClass,
  }) = GenerateFlowGeneratedBabelClass;

  /// Step 28
  factory GenerateFlowState.writtedBabelClassInDartFile({
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
    required TranslationPayloadInfo hardcodedStringsPayloadInfo,
    required Map<FilePath, List<BabelLabelEntityRootLabel>>
    hardcodedStringsPerFile,
  }) = GenerateFlowWrittedBabelClassInDartFile;

  /// Step 29
  factory GenerateFlowState.addedBabelClassInitializationInMain({
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
    required TranslationPayloadInfo hardcodedStringsPayloadInfo,
    required Map<FilePath, List<BabelLabelEntityRootLabel>>
    hardcodedStringsPerFile,
  }) = GenerateFlowAddedBabelClassInitializationInMain;

  /// Step 30
  factory GenerateFlowState.addedSharedPrefsInFlutterProjects({
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
    required TranslationPayloadInfo hardcodedStringsPayloadInfo,
    required Map<FilePath, List<BabelLabelEntityRootLabel>>
    hardcodedStringsPerFile,
  }) = GenerateFlowAddedSharedPrefsInFlutterProjects;

  /// Step 31
  factory GenerateFlowState.extractedCodeBase({
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
    required TranslationPayloadInfo hardcodedStringsPayloadInfo,
    required Map<FilePath, List<BabelLabelEntityRootLabel>>
    hardcodedStringsPerFile,
    required Set<ContextPath> contextPaths,
  }) = GenerateFlowExtractedCodeBase;

  /// Step 32
  factory GenerateFlowState.translatedNewStringsArb({
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
    required TranslationPayloadInfo hardcodedStringsPayloadInfo,
    required Map<FilePath, List<BabelLabelEntityRootLabel>>
    hardcodedStringsPerFile,
    required Set<ContextPath> contextPaths,
    required Map<
      LanguageCode,

      Map<CountryCode, Map<TranslationKey, TranslationContent>>
    >
    madeTranslations,
  }) = GenerateFlowTranslatedNewStringsArb;

  /// Step 33
  factory GenerateFlowState.uploadedNewTranslations({
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
    required TranslationPayloadInfo hardcodedStringsPayloadInfo,
    required Map<FilePath, List<BabelLabelEntityRootLabel>>
    hardcodedStringsPerFile,
    required Set<ContextPath> contextPaths,

    required Map<
      LanguageCode,

      Map<CountryCode, Map<TranslationKey, TranslationContent>>
    >
    madeTranslations,
    required GenerateHistory generatedHistoryItem,
  }) = GenerateFlowUploadedNewTranslations;

  /// Step 34
  factory GenerateFlowState.commitedAllChangesOfCodebase({
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
    required TranslationPayloadInfo hardcodedStringsPayloadInfo,
    required Map<FilePath, List<BabelLabelEntityRootLabel>>
    hardcodedStringsPerFile,
    required Set<ContextPath> contextPaths,
    required Map<
      LanguageCode,

      Map<CountryCode, Map<TranslationKey, TranslationContent>>
    >
    madeTranslations,
    required GenerateHistory generatedHistoryItem,
  }) = GenerateFlowCommitedAllChangesOfCodebase;

  /// Step 35
  factory GenerateFlowState.getBabelChangesCommit({
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
    required TranslationPayloadInfo hardcodedStringsPayloadInfo,
    required Map<FilePath, List<BabelLabelEntityRootLabel>>
    hardcodedStringsPerFile,
    required Set<ContextPath> contextPaths,
    required Map<
      LanguageCode,

      Map<CountryCode, Map<TranslationKey, TranslationContent>>
    >
    madeTranslations,
    required GenerateHistory generatedHistoryItem,
    required GitCommit babelGitCommit,
  }) = GenerateFlowGetBabelChangesCommit;

  /// Step 36
  factory GenerateFlowState.sincronizedBabelCommitWithApi({
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
    required ProjectCacheMap projectCacheMap,
    required TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required FilesVerification filesVerificationState,
    required ArbDataState projectArbData,
    required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
    required TranslationPayloadInfo codebaseArbTranslationPayloadInfo,
    required TranslationPayloadInfo hardcodedStringsPayloadInfo,
    required Map<FilePath, List<BabelLabelEntityRootLabel>>
    hardcodedStringsPerFile,
    required Set<ContextPath> contextPaths,
    required Map<
      LanguageCode,

      Map<CountryCode, Map<TranslationKey, TranslationContent>>
    >
    madeTranslations,
    required GenerateHistory generatedHistoryItem,
    required GitCommit babelGitCommit,
  }) = GenerateFlowSincronizedBabelCommitWithApi;

  @override
  Directory get directory {
    return Directory(directoryPath);
  }

  @override
  int get maxAmountOfSteps => 36;

  @override
  String get message => map(
    initial: (_) => 'Creating client connection...',
    createdClient: (_) => 'Ensuring git dependencies...',
    ensuredGit: (_) => 'Reading codebase YAML configuration...',
    gotCodeBaseYaml: (_) => 'Getting git user information...',
    gotGitUser: (_) => 'Getting last local commit...',
    gotLastLocalCommit: (_) => 'Getting project origin URL...',
    gotProjectOriginUrl: (_) => 'Collecting git variables...',
    gotGitVariables: (_) => 'Getting app languages...',
    gotAppLanguages: (_) => 'Building project cache map...',
    projectCacheMap: (_) => 'Resolving project cache translations...',
    resolvedProjectCacheTranslation:
        (_) => 'Ensuring no static errors in Dart files...',
    ensuredTheresNoStaticErrorOnDartFiles:
        (_) => 'Getting target files for analysis...',
    gotTargetFiles: (_) => 'Getting L10n project configuration...',
    gotL10nProjectConfig: (_) => 'Mapping project ARB data...',
    mappedProjectArbData: (_) => 'Resolving project ARB translation payload...',
    resolvedProjectArbTranslationPayload:
        (_) => 'Replacing L10n key references with Babel functions...',
    replacedAllL10nKeyReferencesInCodebaseForBabelFunctions:
        (_) => 'Normalizing codebase...',
    codebaseNormalized: (_) => 'Extracting all strings from Dart files...',
    extractedAllStrings: (_) => 'Identifying user-facing labels...',
    definedStringLabels: (_) => 'Creating human-friendly ARB keys...',
    createdHumanFriendlyArbKeys: (_) => 'Mapping strings hierarchy...',
    mappedStringsHierarchy: (_) => 'Mapping babel label entities...',
    mappedBabelLabels: (_) => 'Resolving hardcoded strings...',
    resolvedHardcodedStrings:
        (_) => 'Replacing hardcoded strings with Babel text...',
    replacedHardcodedStringsForBabelText:
        (_) => 'Applying general Dart fixes...',
    appliedCodebaseGeneralDartFixes: (_) => 'Generating Babel class...',
    generatedBabelClass: (_) => 'Writing Babel class to Dart file...',
    writtedBabelClassInDartFile:
        (_) => 'Adding Babel class initialization in main...',
    addedBabelClassInitializationInMain:
        (_) => 'Adding shared preferences for Flutter projects...',
    addedSharedPrefsInFlutterProjects: (_) => 'Extracting codebase...',
    extractedCodeBase: (_) => 'Translating new strings in ARB files...',
    translatedNewStringsArb: (_) => 'Uploading new translations...',
    uploadedNewTranslations: (_) => 'Committing all codebase changes...',
    commitedAllChangesOfCodebase: (_) => 'Getting Babel changes commit...',
    getBabelChangesCommit: (_) => 'Synchronizing Babel commit with API...',
    sincronizedBabelCommitWithApi: (_) => 'Generation completed!',
  );

  @override
  int get stepCount => map(
    initial: (_) => 1,
    createdClient: (_) => 2,
    ensuredGit: (_) => 3,
    gotCodeBaseYaml: (_) => 4,
    gotGitUser: (_) => 5,
    gotLastLocalCommit: (_) => 6,
    gotProjectOriginUrl: (_) => 7,
    gotGitVariables: (_) => 8,
    gotAppLanguages: (_) => 9,
    projectCacheMap: (_) => 10,
    resolvedProjectCacheTranslation: (_) => 11,
    ensuredTheresNoStaticErrorOnDartFiles: (_) => 12,
    gotTargetFiles: (_) => 13,
    gotL10nProjectConfig: (_) => 14,
    mappedProjectArbData: (_) => 15,
    resolvedProjectArbTranslationPayload: (_) => 16,
    replacedAllL10nKeyReferencesInCodebaseForBabelFunctions: (_) => 17,
    codebaseNormalized: (_) => 18,
    extractedAllStrings: (_) => 19,
    definedStringLabels: (_) => 20,
    createdHumanFriendlyArbKeys: (_) => 21,
    mappedStringsHierarchy: (_) => 22,
    mappedBabelLabels: (_) => 23,
    resolvedHardcodedStrings: (_) => 24,
    replacedHardcodedStringsForBabelText: (_) => 25,
    appliedCodebaseGeneralDartFixes: (_) => 26,
    generatedBabelClass: (_) => 27,
    writtedBabelClassInDartFile: (_) => 28,
    addedBabelClassInitializationInMain: (_) => 29,
    addedSharedPrefsInFlutterProjects: (_) => 30,
    extractedCodeBase: (_) => 31,
    translatedNewStringsArb: (_) => 32,
    uploadedNewTranslations: (_) => 33,
    commitedAllChangesOfCodebase: (_) => 34,
    getBabelChangesCommit: (_) => 35,
    sincronizedBabelCommitWithApi: (_) => 36,
  );

  Future<List<File>> get filesToBeAnalysed async {
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
      fromZero: (value) async {
        final result = await getEligibleFiles(directory);
        if (result.isError()) {
          return <File>[];
        }
        return result.getOrThrow();
      },
    );
  }

  // Updated getter without using orElse
  FilesVerification get filesVerificationState => map(
    initial: (_) => FilesVerification.fromZero(),
    createdClient: (_) => FilesVerification.fromZero(),
    ensuredGit: (_) => FilesVerification.fromZero(),
    gotCodeBaseYaml: (_) => FilesVerification.fromZero(),
    gotGitUser: (_) => FilesVerification.fromZero(),
    gotLastLocalCommit: (_) => FilesVerification.fromZero(),
    gotProjectOriginUrl: (_) => FilesVerification.fromZero(),
    gotGitVariables: (_) => FilesVerification.fromZero(),
    gotAppLanguages: (_) => FilesVerification.fromZero(),
    projectCacheMap: (_) => FilesVerification.fromZero(),
    resolvedProjectCacheTranslation: (_) => FilesVerification.fromZero(),
    ensuredTheresNoStaticErrorOnDartFiles: (_) => FilesVerification.fromZero(),
    gotTargetFiles: (state) => state.filesVerificationState,
    gotL10nProjectConfig: (state) => state.filesVerificationState,
    mappedProjectArbData: (state) => state.filesVerificationState,
    resolvedProjectArbTranslationPayload:
        (state) => state.filesVerificationState,
    replacedAllL10nKeyReferencesInCodebaseForBabelFunctions:
        (state) => state.filesVerificationState,
    codebaseNormalized: (state) => state.filesVerificationState,
    extractedAllStrings: (state) => state.filesVerificationState,
    definedStringLabels: (state) => state.filesVerificationState,
    createdHumanFriendlyArbKeys: (state) => state.filesVerificationState,
    mappedStringsHierarchy: (state) => state.filesVerificationState,
    mappedBabelLabels: (state) => state.filesVerificationState,
    resolvedHardcodedStrings: (state) => state.filesVerificationState,
    replacedHardcodedStringsForBabelText:
        (state) => state.filesVerificationState,
    appliedCodebaseGeneralDartFixes: (state) => state.filesVerificationState,
    generatedBabelClass: (state) => state.filesVerificationState,
    writtedBabelClassInDartFile: (state) => state.filesVerificationState,
    addedBabelClassInitializationInMain:
        (state) => state.filesVerificationState,
    addedSharedPrefsInFlutterProjects: (state) => state.filesVerificationState,
    extractedCodeBase: (state) => state.filesVerificationState,
    translatedNewStringsArb: (state) => state.filesVerificationState,
    uploadedNewTranslations: (state) => state.filesVerificationState,
    commitedAllChangesOfCodebase: (state) => state.filesVerificationState,
    getBabelChangesCommit: (state) => state.filesVerificationState,
    sincronizedBabelCommitWithApi: (state) => state.filesVerificationState,
  );

  factory GenerateFlowState.fromJson(Map<String, dynamic> json) =>
      _$GenerateFlowStateFromJson(json);

  @override
  GenerateFlowState fromJson(Map<String, dynamic> json) =>
      GenerateFlowState.fromJson(json);

  @override
  bool get shouldLog => willLog;

  @override
  bool get shouldReset => stepCount < 33;
}

AsyncBabelResult<GenerateFlowInitial> generate_initFlowState({
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

  // Start the loading indicator with the initial state
  resolve(createFlowInitial);

  final existsDirectory = await createFlowInitial.directory.exists();
  if (!existsDirectory) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Directory does not exist',
        description:
            'The directory at ${createFlowInitial.directoryPath} does not exist.',
      ),
    ).toFailure();
  }

  return createFlowInitial.toSuccess();
}
