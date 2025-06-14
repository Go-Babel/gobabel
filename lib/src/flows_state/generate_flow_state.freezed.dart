// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GenerateFlowState _$GenerateFlowStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'initial':
      return GenerateFlowInitial.fromJson(json);
    case 'createdClient':
      return GenerateFlowCreatedClient.fromJson(json);
    case 'ensuredGit':
      return GenerateFlowEnsureGit.fromJson(json);
    case 'gotCodeBaseYaml':
      return GenerateFlowGotCodeBaseYaml.fromJson(json);
    case 'gotGitUser':
      return GenerateFlowGotGitUser.fromJson(json);
    case 'gotLastLocalCommit':
      return GenerateFlowGotLastLocalCommit.fromJson(json);
    case 'gotProjectOriginUrl':
      return GenerateFlowGotProjectOriginUrl.fromJson(json);
    case 'gotGitVariables':
      return GenerateFlowGotGitVariables.fromJson(json);
    case 'gotAppLanguages':
      return GenerateFlowGotAppLanguages.fromJson(json);
    case 'downloadReferenceArb':
      return GenerateFlowDownloadReferenceArb.fromJson(json);
    case 'projectCacheMap':
      return GenerateFlowProjectCacheMap.fromJson(json);
    case 'resolvedProjectCacheTranslation':
      return GenerateFlowResolvedProjectCacheTranslation.fromJson(json);
    case 'ensuredTheresNoStaticErrorOnDartFiles':
      return GenerateFlowEnsuredNoStaticErrorOnDartFiles.fromJson(json);
    case 'gotTargetFiles':
      return GenerateFlowGotTargetFiles.fromJson(json);
    case 'gotL10nProjectConfig':
      return GenerateFlowGotL10nProjectConfig.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'GenerateFlowState',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$GenerateFlowState {
  String get accountApiKey => throw _privateConstructorUsedError;
  String get directoryPath => throw _privateConstructorUsedError;
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get inputedByUserLocale =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    gotAppLanguages,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )
    downloadReferenceArb,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )
    projectCacheMap,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    resolvedProjectCacheTranslation,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )
    gotTargetFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )
    gotL10nProjectConfig,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
    required TResult Function(GenerateFlowGotAppLanguages value)
    gotAppLanguages,
    required TResult Function(GenerateFlowDownloadReferenceArb value)
    downloadReferenceArb,
    required TResult Function(GenerateFlowProjectCacheMap value)
    projectCacheMap,
    required TResult Function(GenerateFlowResolvedProjectCacheTranslation value)
    resolvedProjectCacheTranslation,
    required TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(GenerateFlowGotTargetFiles value) gotTargetFiles,
    required TResult Function(GenerateFlowGotL10nProjectConfig value)
    gotL10nProjectConfig,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult? Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult? Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult? Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult? Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult? Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this GenerateFlowState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerateFlowStateCopyWith<GenerateFlowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateFlowStateCopyWith<$Res> {
  factory $GenerateFlowStateCopyWith(
    GenerateFlowState value,
    $Res Function(GenerateFlowState) then,
  ) = _$GenerateFlowStateCopyWithImpl<$Res, GenerateFlowState>;
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    BabelSupportedLocales inputedByUserLocale,
  });
}

/// @nodoc
class _$GenerateFlowStateCopyWithImpl<$Res, $Val extends GenerateFlowState>
    implements $GenerateFlowStateCopyWith<$Res> {
  _$GenerateFlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? inputedByUserLocale = null,
  }) {
    return _then(
      _value.copyWith(
            accountApiKey:
                null == accountApiKey
                    ? _value.accountApiKey
                    : accountApiKey // ignore: cast_nullable_to_non_nullable
                        as String,
            directoryPath:
                null == directoryPath
                    ? _value.directoryPath
                    : directoryPath // ignore: cast_nullable_to_non_nullable
                        as String,
            inputedByUserLocale:
                null == inputedByUserLocale
                    ? _value.inputedByUserLocale
                    : inputedByUserLocale // ignore: cast_nullable_to_non_nullable
                        as BabelSupportedLocales,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GenerateFlowInitialImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowInitialImplCopyWith(
    _$GenerateFlowInitialImpl value,
    $Res Function(_$GenerateFlowInitialImpl) then,
  ) = __$$GenerateFlowInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    BabelSupportedLocales inputedByUserLocale,
  });
}

/// @nodoc
class __$$GenerateFlowInitialImplCopyWithImpl<$Res>
    extends _$GenerateFlowStateCopyWithImpl<$Res, _$GenerateFlowInitialImpl>
    implements _$$GenerateFlowInitialImplCopyWith<$Res> {
  __$$GenerateFlowInitialImplCopyWithImpl(
    _$GenerateFlowInitialImpl _value,
    $Res Function(_$GenerateFlowInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? inputedByUserLocale = null,
  }) {
    return _then(
      _$GenerateFlowInitialImpl(
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        inputedByUserLocale:
            null == inputedByUserLocale
                ? _value.inputedByUserLocale
                : inputedByUserLocale // ignore: cast_nullable_to_non_nullable
                    as BabelSupportedLocales,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateFlowInitialImpl extends GenerateFlowInitial {
  _$GenerateFlowInitialImpl({
    required this.accountApiKey,
    required this.directoryPath,
    @BabelSupportedLocalesJsonConverter() required this.inputedByUserLocale,
    final String? $type,
  }) : $type = $type ?? 'initial',
       super._();

  factory _$GenerateFlowInitialImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateFlowInitialImplFromJson(json);

  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  final BabelSupportedLocales inputedByUserLocale;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenerateFlowState.initial(accountApiKey: $accountApiKey, directoryPath: $directoryPath, inputedByUserLocale: $inputedByUserLocale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowInitialImpl &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.inputedByUserLocale, inputedByUserLocale) ||
                other.inputedByUserLocale == inputedByUserLocale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accountApiKey,
    directoryPath,
    inputedByUserLocale,
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowInitialImplCopyWith<_$GenerateFlowInitialImpl> get copyWith =>
      __$$GenerateFlowInitialImplCopyWithImpl<_$GenerateFlowInitialImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    gotAppLanguages,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )
    downloadReferenceArb,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )
    projectCacheMap,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    resolvedProjectCacheTranslation,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )
    gotTargetFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )
    gotL10nProjectConfig,
  }) {
    return initial(accountApiKey, directoryPath, inputedByUserLocale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
  }) {
    return initial?.call(accountApiKey, directoryPath, inputedByUserLocale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(accountApiKey, directoryPath, inputedByUserLocale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
    required TResult Function(GenerateFlowGotAppLanguages value)
    gotAppLanguages,
    required TResult Function(GenerateFlowDownloadReferenceArb value)
    downloadReferenceArb,
    required TResult Function(GenerateFlowProjectCacheMap value)
    projectCacheMap,
    required TResult Function(GenerateFlowResolvedProjectCacheTranslation value)
    resolvedProjectCacheTranslation,
    required TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(GenerateFlowGotTargetFiles value) gotTargetFiles,
    required TResult Function(GenerateFlowGotL10nProjectConfig value)
    gotL10nProjectConfig,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult? Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult? Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult? Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult? Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult? Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowInitialImplToJson(this);
  }
}

abstract class GenerateFlowInitial extends GenerateFlowState {
  factory GenerateFlowInitial({
    required final String accountApiKey,
    required final String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required final BabelSupportedLocales inputedByUserLocale,
  }) = _$GenerateFlowInitialImpl;
  GenerateFlowInitial._() : super._();

  factory GenerateFlowInitial.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowInitialImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get inputedByUserLocale;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowInitialImplCopyWith<_$GenerateFlowInitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowCreatedClientImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowCreatedClientImplCopyWith(
    _$GenerateFlowCreatedClientImpl value,
    $Res Function(_$GenerateFlowCreatedClientImpl) then,
  ) = __$$GenerateFlowCreatedClientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    BabelSupportedLocales inputedByUserLocale,
    ApiClientEntity client,
  });

  $ApiClientEntityCopyWith<$Res> get client;
}

/// @nodoc
class __$$GenerateFlowCreatedClientImplCopyWithImpl<$Res>
    extends
        _$GenerateFlowStateCopyWithImpl<$Res, _$GenerateFlowCreatedClientImpl>
    implements _$$GenerateFlowCreatedClientImplCopyWith<$Res> {
  __$$GenerateFlowCreatedClientImplCopyWithImpl(
    _$GenerateFlowCreatedClientImpl _value,
    $Res Function(_$GenerateFlowCreatedClientImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? inputedByUserLocale = null,
    Object? client = null,
  }) {
    return _then(
      _$GenerateFlowCreatedClientImpl(
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        inputedByUserLocale:
            null == inputedByUserLocale
                ? _value.inputedByUserLocale
                : inputedByUserLocale // ignore: cast_nullable_to_non_nullable
                    as BabelSupportedLocales,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
      ),
    );
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateFlowCreatedClientImpl extends GenerateFlowCreatedClient {
  _$GenerateFlowCreatedClientImpl({
    required this.accountApiKey,
    required this.directoryPath,
    @BabelSupportedLocalesJsonConverter() required this.inputedByUserLocale,
    required this.client,
    final String? $type,
  }) : $type = $type ?? 'createdClient',
       super._();

  factory _$GenerateFlowCreatedClientImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateFlowCreatedClientImplFromJson(json);

  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  final BabelSupportedLocales inputedByUserLocale;
  @override
  final ApiClientEntity client;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenerateFlowState.createdClient(accountApiKey: $accountApiKey, directoryPath: $directoryPath, inputedByUserLocale: $inputedByUserLocale, client: $client)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowCreatedClientImpl &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.inputedByUserLocale, inputedByUserLocale) ||
                other.inputedByUserLocale == inputedByUserLocale) &&
            (identical(other.client, client) || other.client == client));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accountApiKey,
    directoryPath,
    inputedByUserLocale,
    client,
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowCreatedClientImplCopyWith<_$GenerateFlowCreatedClientImpl>
  get copyWith => __$$GenerateFlowCreatedClientImplCopyWithImpl<
    _$GenerateFlowCreatedClientImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    gotAppLanguages,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )
    downloadReferenceArb,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )
    projectCacheMap,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    resolvedProjectCacheTranslation,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )
    gotTargetFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )
    gotL10nProjectConfig,
  }) {
    return createdClient(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
  }) {
    return createdClient?.call(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (createdClient != null) {
      return createdClient(
        accountApiKey,
        directoryPath,
        inputedByUserLocale,
        client,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
    required TResult Function(GenerateFlowGotAppLanguages value)
    gotAppLanguages,
    required TResult Function(GenerateFlowDownloadReferenceArb value)
    downloadReferenceArb,
    required TResult Function(GenerateFlowProjectCacheMap value)
    projectCacheMap,
    required TResult Function(GenerateFlowResolvedProjectCacheTranslation value)
    resolvedProjectCacheTranslation,
    required TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(GenerateFlowGotTargetFiles value) gotTargetFiles,
    required TResult Function(GenerateFlowGotL10nProjectConfig value)
    gotL10nProjectConfig,
  }) {
    return createdClient(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult? Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult? Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult? Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult? Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult? Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
  }) {
    return createdClient?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (createdClient != null) {
      return createdClient(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowCreatedClientImplToJson(this);
  }
}

abstract class GenerateFlowCreatedClient extends GenerateFlowState {
  factory GenerateFlowCreatedClient({
    required final String accountApiKey,
    required final String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required final BabelSupportedLocales inputedByUserLocale,
    required final ApiClientEntity client,
  }) = _$GenerateFlowCreatedClientImpl;
  GenerateFlowCreatedClient._() : super._();

  factory GenerateFlowCreatedClient.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowCreatedClientImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get inputedByUserLocale;
  ApiClientEntity get client;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowCreatedClientImplCopyWith<_$GenerateFlowCreatedClientImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowEnsureGitImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowEnsureGitImplCopyWith(
    _$GenerateFlowEnsureGitImpl value,
    $Res Function(_$GenerateFlowEnsureGitImpl) then,
  ) = __$$GenerateFlowEnsureGitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    BabelSupportedLocales inputedByUserLocale,
    ApiClientEntity client,
  });

  $ApiClientEntityCopyWith<$Res> get client;
}

/// @nodoc
class __$$GenerateFlowEnsureGitImplCopyWithImpl<$Res>
    extends _$GenerateFlowStateCopyWithImpl<$Res, _$GenerateFlowEnsureGitImpl>
    implements _$$GenerateFlowEnsureGitImplCopyWith<$Res> {
  __$$GenerateFlowEnsureGitImplCopyWithImpl(
    _$GenerateFlowEnsureGitImpl _value,
    $Res Function(_$GenerateFlowEnsureGitImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? inputedByUserLocale = null,
    Object? client = null,
  }) {
    return _then(
      _$GenerateFlowEnsureGitImpl(
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        inputedByUserLocale:
            null == inputedByUserLocale
                ? _value.inputedByUserLocale
                : inputedByUserLocale // ignore: cast_nullable_to_non_nullable
                    as BabelSupportedLocales,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
      ),
    );
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateFlowEnsureGitImpl extends GenerateFlowEnsureGit {
  _$GenerateFlowEnsureGitImpl({
    required this.accountApiKey,
    required this.directoryPath,
    @BabelSupportedLocalesJsonConverter() required this.inputedByUserLocale,
    required this.client,
    final String? $type,
  }) : $type = $type ?? 'ensuredGit',
       super._();

  factory _$GenerateFlowEnsureGitImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateFlowEnsureGitImplFromJson(json);

  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  final BabelSupportedLocales inputedByUserLocale;
  @override
  final ApiClientEntity client;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenerateFlowState.ensuredGit(accountApiKey: $accountApiKey, directoryPath: $directoryPath, inputedByUserLocale: $inputedByUserLocale, client: $client)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowEnsureGitImpl &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.inputedByUserLocale, inputedByUserLocale) ||
                other.inputedByUserLocale == inputedByUserLocale) &&
            (identical(other.client, client) || other.client == client));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accountApiKey,
    directoryPath,
    inputedByUserLocale,
    client,
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowEnsureGitImplCopyWith<_$GenerateFlowEnsureGitImpl>
  get copyWith =>
      __$$GenerateFlowEnsureGitImplCopyWithImpl<_$GenerateFlowEnsureGitImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    gotAppLanguages,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )
    downloadReferenceArb,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )
    projectCacheMap,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    resolvedProjectCacheTranslation,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )
    gotTargetFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )
    gotL10nProjectConfig,
  }) {
    return ensuredGit(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
  }) {
    return ensuredGit?.call(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (ensuredGit != null) {
      return ensuredGit(
        accountApiKey,
        directoryPath,
        inputedByUserLocale,
        client,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
    required TResult Function(GenerateFlowGotAppLanguages value)
    gotAppLanguages,
    required TResult Function(GenerateFlowDownloadReferenceArb value)
    downloadReferenceArb,
    required TResult Function(GenerateFlowProjectCacheMap value)
    projectCacheMap,
    required TResult Function(GenerateFlowResolvedProjectCacheTranslation value)
    resolvedProjectCacheTranslation,
    required TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(GenerateFlowGotTargetFiles value) gotTargetFiles,
    required TResult Function(GenerateFlowGotL10nProjectConfig value)
    gotL10nProjectConfig,
  }) {
    return ensuredGit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult? Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult? Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult? Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult? Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult? Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
  }) {
    return ensuredGit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (ensuredGit != null) {
      return ensuredGit(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowEnsureGitImplToJson(this);
  }
}

abstract class GenerateFlowEnsureGit extends GenerateFlowState {
  factory GenerateFlowEnsureGit({
    required final String accountApiKey,
    required final String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required final BabelSupportedLocales inputedByUserLocale,
    required final ApiClientEntity client,
  }) = _$GenerateFlowEnsureGitImpl;
  GenerateFlowEnsureGit._() : super._();

  factory GenerateFlowEnsureGit.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowEnsureGitImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get inputedByUserLocale;
  ApiClientEntity get client;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowEnsureGitImplCopyWith<_$GenerateFlowEnsureGitImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowGotCodeBaseYamlImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowGotCodeBaseYamlImplCopyWith(
    _$GenerateFlowGotCodeBaseYamlImpl value,
    $Res Function(_$GenerateFlowGotCodeBaseYamlImpl) then,
  ) = __$$GenerateFlowGotCodeBaseYamlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    BabelSupportedLocales inputedByUserLocale,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
}

/// @nodoc
class __$$GenerateFlowGotCodeBaseYamlImplCopyWithImpl<$Res>
    extends
        _$GenerateFlowStateCopyWithImpl<$Res, _$GenerateFlowGotCodeBaseYamlImpl>
    implements _$$GenerateFlowGotCodeBaseYamlImplCopyWith<$Res> {
  __$$GenerateFlowGotCodeBaseYamlImplCopyWithImpl(
    _$GenerateFlowGotCodeBaseYamlImpl _value,
    $Res Function(_$GenerateFlowGotCodeBaseYamlImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? inputedByUserLocale = null,
    Object? client = null,
    Object? yamlInfo = null,
  }) {
    return _then(
      _$GenerateFlowGotCodeBaseYamlImpl(
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        inputedByUserLocale:
            null == inputedByUserLocale
                ? _value.inputedByUserLocale
                : inputedByUserLocale // ignore: cast_nullable_to_non_nullable
                    as BabelSupportedLocales,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
      ),
    );
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateFlowGotCodeBaseYamlImpl extends GenerateFlowGotCodeBaseYaml {
  _$GenerateFlowGotCodeBaseYamlImpl({
    required this.accountApiKey,
    required this.directoryPath,
    @BabelSupportedLocalesJsonConverter() required this.inputedByUserLocale,
    required this.client,
    required this.yamlInfo,
    final String? $type,
  }) : $type = $type ?? 'gotCodeBaseYaml',
       super._();

  factory _$GenerateFlowGotCodeBaseYamlImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$GenerateFlowGotCodeBaseYamlImplFromJson(json);

  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  final BabelSupportedLocales inputedByUserLocale;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenerateFlowState.gotCodeBaseYaml(accountApiKey: $accountApiKey, directoryPath: $directoryPath, inputedByUserLocale: $inputedByUserLocale, client: $client, yamlInfo: $yamlInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowGotCodeBaseYamlImpl &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.inputedByUserLocale, inputedByUserLocale) ||
                other.inputedByUserLocale == inputedByUserLocale) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accountApiKey,
    directoryPath,
    inputedByUserLocale,
    client,
    yamlInfo,
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowGotCodeBaseYamlImplCopyWith<_$GenerateFlowGotCodeBaseYamlImpl>
  get copyWith => __$$GenerateFlowGotCodeBaseYamlImplCopyWithImpl<
    _$GenerateFlowGotCodeBaseYamlImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    gotAppLanguages,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )
    downloadReferenceArb,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )
    projectCacheMap,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    resolvedProjectCacheTranslation,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )
    gotTargetFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )
    gotL10nProjectConfig,
  }) {
    return gotCodeBaseYaml(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
  }) {
    return gotCodeBaseYaml?.call(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (gotCodeBaseYaml != null) {
      return gotCodeBaseYaml(
        accountApiKey,
        directoryPath,
        inputedByUserLocale,
        client,
        yamlInfo,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
    required TResult Function(GenerateFlowGotAppLanguages value)
    gotAppLanguages,
    required TResult Function(GenerateFlowDownloadReferenceArb value)
    downloadReferenceArb,
    required TResult Function(GenerateFlowProjectCacheMap value)
    projectCacheMap,
    required TResult Function(GenerateFlowResolvedProjectCacheTranslation value)
    resolvedProjectCacheTranslation,
    required TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(GenerateFlowGotTargetFiles value) gotTargetFiles,
    required TResult Function(GenerateFlowGotL10nProjectConfig value)
    gotL10nProjectConfig,
  }) {
    return gotCodeBaseYaml(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult? Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult? Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult? Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult? Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult? Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
  }) {
    return gotCodeBaseYaml?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (gotCodeBaseYaml != null) {
      return gotCodeBaseYaml(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowGotCodeBaseYamlImplToJson(this);
  }
}

abstract class GenerateFlowGotCodeBaseYaml extends GenerateFlowState {
  factory GenerateFlowGotCodeBaseYaml({
    required final String accountApiKey,
    required final String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required final BabelSupportedLocales inputedByUserLocale,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
  }) = _$GenerateFlowGotCodeBaseYamlImpl;
  GenerateFlowGotCodeBaseYaml._() : super._();

  factory GenerateFlowGotCodeBaseYaml.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowGotCodeBaseYamlImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get inputedByUserLocale;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowGotCodeBaseYamlImplCopyWith<_$GenerateFlowGotCodeBaseYamlImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowGotGitUserImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowGotGitUserImplCopyWith(
    _$GenerateFlowGotGitUserImpl value,
    $Res Function(_$GenerateFlowGotGitUserImpl) then,
  ) = __$$GenerateFlowGotGitUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    BabelSupportedLocales inputedByUserLocale,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitUser gitUser,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
}

/// @nodoc
class __$$GenerateFlowGotGitUserImplCopyWithImpl<$Res>
    extends _$GenerateFlowStateCopyWithImpl<$Res, _$GenerateFlowGotGitUserImpl>
    implements _$$GenerateFlowGotGitUserImplCopyWith<$Res> {
  __$$GenerateFlowGotGitUserImplCopyWithImpl(
    _$GenerateFlowGotGitUserImpl _value,
    $Res Function(_$GenerateFlowGotGitUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? inputedByUserLocale = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitUser = null,
  }) {
    return _then(
      _$GenerateFlowGotGitUserImpl(
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        inputedByUserLocale:
            null == inputedByUserLocale
                ? _value.inputedByUserLocale
                : inputedByUserLocale // ignore: cast_nullable_to_non_nullable
                    as BabelSupportedLocales,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitUser:
            null == gitUser
                ? _value.gitUser
                : gitUser // ignore: cast_nullable_to_non_nullable
                    as GitUser,
      ),
    );
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateFlowGotGitUserImpl extends GenerateFlowGotGitUser {
  _$GenerateFlowGotGitUserImpl({
    required this.accountApiKey,
    required this.directoryPath,
    @BabelSupportedLocalesJsonConverter() required this.inputedByUserLocale,
    required this.client,
    required this.yamlInfo,
    required this.gitUser,
    final String? $type,
  }) : $type = $type ?? 'gotGitUser',
       super._();

  factory _$GenerateFlowGotGitUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateFlowGotGitUserImplFromJson(json);

  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  final BabelSupportedLocales inputedByUserLocale;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;
  @override
  final GitUser gitUser;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenerateFlowState.gotGitUser(accountApiKey: $accountApiKey, directoryPath: $directoryPath, inputedByUserLocale: $inputedByUserLocale, client: $client, yamlInfo: $yamlInfo, gitUser: $gitUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowGotGitUserImpl &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.inputedByUserLocale, inputedByUserLocale) ||
                other.inputedByUserLocale == inputedByUserLocale) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo) &&
            (identical(other.gitUser, gitUser) || other.gitUser == gitUser));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accountApiKey,
    directoryPath,
    inputedByUserLocale,
    client,
    yamlInfo,
    gitUser,
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowGotGitUserImplCopyWith<_$GenerateFlowGotGitUserImpl>
  get copyWith =>
      __$$GenerateFlowGotGitUserImplCopyWithImpl<_$GenerateFlowGotGitUserImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    gotAppLanguages,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )
    downloadReferenceArb,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )
    projectCacheMap,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    resolvedProjectCacheTranslation,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )
    gotTargetFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )
    gotL10nProjectConfig,
  }) {
    return gotGitUser(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitUser,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
  }) {
    return gotGitUser?.call(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitUser,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (gotGitUser != null) {
      return gotGitUser(
        accountApiKey,
        directoryPath,
        inputedByUserLocale,
        client,
        yamlInfo,
        gitUser,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
    required TResult Function(GenerateFlowGotAppLanguages value)
    gotAppLanguages,
    required TResult Function(GenerateFlowDownloadReferenceArb value)
    downloadReferenceArb,
    required TResult Function(GenerateFlowProjectCacheMap value)
    projectCacheMap,
    required TResult Function(GenerateFlowResolvedProjectCacheTranslation value)
    resolvedProjectCacheTranslation,
    required TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(GenerateFlowGotTargetFiles value) gotTargetFiles,
    required TResult Function(GenerateFlowGotL10nProjectConfig value)
    gotL10nProjectConfig,
  }) {
    return gotGitUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult? Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult? Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult? Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult? Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult? Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
  }) {
    return gotGitUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (gotGitUser != null) {
      return gotGitUser(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowGotGitUserImplToJson(this);
  }
}

abstract class GenerateFlowGotGitUser extends GenerateFlowState {
  factory GenerateFlowGotGitUser({
    required final String accountApiKey,
    required final String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required final BabelSupportedLocales inputedByUserLocale,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitUser gitUser,
  }) = _$GenerateFlowGotGitUserImpl;
  GenerateFlowGotGitUser._() : super._();

  factory GenerateFlowGotGitUser.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowGotGitUserImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get inputedByUserLocale;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitUser get gitUser;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowGotGitUserImplCopyWith<_$GenerateFlowGotGitUserImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowGotLastLocalCommitImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowGotLastLocalCommitImplCopyWith(
    _$GenerateFlowGotLastLocalCommitImpl value,
    $Res Function(_$GenerateFlowGotLastLocalCommitImpl) then,
  ) = __$$GenerateFlowGotLastLocalCommitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    BabelSupportedLocales inputedByUserLocale,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitUser gitUser,
    GitCommit previousCommit,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
}

/// @nodoc
class __$$GenerateFlowGotLastLocalCommitImplCopyWithImpl<$Res>
    extends
        _$GenerateFlowStateCopyWithImpl<
          $Res,
          _$GenerateFlowGotLastLocalCommitImpl
        >
    implements _$$GenerateFlowGotLastLocalCommitImplCopyWith<$Res> {
  __$$GenerateFlowGotLastLocalCommitImplCopyWithImpl(
    _$GenerateFlowGotLastLocalCommitImpl _value,
    $Res Function(_$GenerateFlowGotLastLocalCommitImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? inputedByUserLocale = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitUser = null,
    Object? previousCommit = null,
  }) {
    return _then(
      _$GenerateFlowGotLastLocalCommitImpl(
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        inputedByUserLocale:
            null == inputedByUserLocale
                ? _value.inputedByUserLocale
                : inputedByUserLocale // ignore: cast_nullable_to_non_nullable
                    as BabelSupportedLocales,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitUser:
            null == gitUser
                ? _value.gitUser
                : gitUser // ignore: cast_nullable_to_non_nullable
                    as GitUser,
        previousCommit:
            null == previousCommit
                ? _value.previousCommit
                : previousCommit // ignore: cast_nullable_to_non_nullable
                    as GitCommit,
      ),
    );
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateFlowGotLastLocalCommitImpl
    extends GenerateFlowGotLastLocalCommit {
  _$GenerateFlowGotLastLocalCommitImpl({
    required this.accountApiKey,
    required this.directoryPath,
    @BabelSupportedLocalesJsonConverter() required this.inputedByUserLocale,
    required this.client,
    required this.yamlInfo,
    required this.gitUser,
    required this.previousCommit,
    final String? $type,
  }) : $type = $type ?? 'gotLastLocalCommit',
       super._();

  factory _$GenerateFlowGotLastLocalCommitImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$GenerateFlowGotLastLocalCommitImplFromJson(json);

  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  final BabelSupportedLocales inputedByUserLocale;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;
  @override
  final GitUser gitUser;
  @override
  final GitCommit previousCommit;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenerateFlowState.gotLastLocalCommit(accountApiKey: $accountApiKey, directoryPath: $directoryPath, inputedByUserLocale: $inputedByUserLocale, client: $client, yamlInfo: $yamlInfo, gitUser: $gitUser, previousCommit: $previousCommit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowGotLastLocalCommitImpl &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.inputedByUserLocale, inputedByUserLocale) ||
                other.inputedByUserLocale == inputedByUserLocale) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo) &&
            (identical(other.gitUser, gitUser) || other.gitUser == gitUser) &&
            (identical(other.previousCommit, previousCommit) ||
                other.previousCommit == previousCommit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accountApiKey,
    directoryPath,
    inputedByUserLocale,
    client,
    yamlInfo,
    gitUser,
    previousCommit,
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowGotLastLocalCommitImplCopyWith<
    _$GenerateFlowGotLastLocalCommitImpl
  >
  get copyWith => __$$GenerateFlowGotLastLocalCommitImplCopyWithImpl<
    _$GenerateFlowGotLastLocalCommitImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    gotAppLanguages,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )
    downloadReferenceArb,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )
    projectCacheMap,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    resolvedProjectCacheTranslation,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )
    gotTargetFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )
    gotL10nProjectConfig,
  }) {
    return gotLastLocalCommit(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitUser,
      previousCommit,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
  }) {
    return gotLastLocalCommit?.call(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitUser,
      previousCommit,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (gotLastLocalCommit != null) {
      return gotLastLocalCommit(
        accountApiKey,
        directoryPath,
        inputedByUserLocale,
        client,
        yamlInfo,
        gitUser,
        previousCommit,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
    required TResult Function(GenerateFlowGotAppLanguages value)
    gotAppLanguages,
    required TResult Function(GenerateFlowDownloadReferenceArb value)
    downloadReferenceArb,
    required TResult Function(GenerateFlowProjectCacheMap value)
    projectCacheMap,
    required TResult Function(GenerateFlowResolvedProjectCacheTranslation value)
    resolvedProjectCacheTranslation,
    required TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(GenerateFlowGotTargetFiles value) gotTargetFiles,
    required TResult Function(GenerateFlowGotL10nProjectConfig value)
    gotL10nProjectConfig,
  }) {
    return gotLastLocalCommit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult? Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult? Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult? Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult? Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult? Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
  }) {
    return gotLastLocalCommit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (gotLastLocalCommit != null) {
      return gotLastLocalCommit(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowGotLastLocalCommitImplToJson(this);
  }
}

abstract class GenerateFlowGotLastLocalCommit extends GenerateFlowState {
  factory GenerateFlowGotLastLocalCommit({
    required final String accountApiKey,
    required final String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required final BabelSupportedLocales inputedByUserLocale,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitUser gitUser,
    required final GitCommit previousCommit,
  }) = _$GenerateFlowGotLastLocalCommitImpl;
  GenerateFlowGotLastLocalCommit._() : super._();

  factory GenerateFlowGotLastLocalCommit.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowGotLastLocalCommitImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get inputedByUserLocale;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitUser get gitUser;
  GitCommit get previousCommit;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowGotLastLocalCommitImplCopyWith<
    _$GenerateFlowGotLastLocalCommitImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowGotProjectOriginUrlImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowGotProjectOriginUrlImplCopyWith(
    _$GenerateFlowGotProjectOriginUrlImpl value,
    $Res Function(_$GenerateFlowGotProjectOriginUrlImpl) then,
  ) = __$$GenerateFlowGotProjectOriginUrlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    BabelSupportedLocales inputedByUserLocale,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitUser gitUser,
    GitCommit previousCommit,
    String projectOriginUrl,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
}

/// @nodoc
class __$$GenerateFlowGotProjectOriginUrlImplCopyWithImpl<$Res>
    extends
        _$GenerateFlowStateCopyWithImpl<
          $Res,
          _$GenerateFlowGotProjectOriginUrlImpl
        >
    implements _$$GenerateFlowGotProjectOriginUrlImplCopyWith<$Res> {
  __$$GenerateFlowGotProjectOriginUrlImplCopyWithImpl(
    _$GenerateFlowGotProjectOriginUrlImpl _value,
    $Res Function(_$GenerateFlowGotProjectOriginUrlImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? inputedByUserLocale = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitUser = null,
    Object? previousCommit = null,
    Object? projectOriginUrl = null,
  }) {
    return _then(
      _$GenerateFlowGotProjectOriginUrlImpl(
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        inputedByUserLocale:
            null == inputedByUserLocale
                ? _value.inputedByUserLocale
                : inputedByUserLocale // ignore: cast_nullable_to_non_nullable
                    as BabelSupportedLocales,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitUser:
            null == gitUser
                ? _value.gitUser
                : gitUser // ignore: cast_nullable_to_non_nullable
                    as GitUser,
        previousCommit:
            null == previousCommit
                ? _value.previousCommit
                : previousCommit // ignore: cast_nullable_to_non_nullable
                    as GitCommit,
        projectOriginUrl:
            null == projectOriginUrl
                ? _value.projectOriginUrl
                : projectOriginUrl // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateFlowGotProjectOriginUrlImpl
    extends GenerateFlowGotProjectOriginUrl {
  _$GenerateFlowGotProjectOriginUrlImpl({
    required this.accountApiKey,
    required this.directoryPath,
    @BabelSupportedLocalesJsonConverter() required this.inputedByUserLocale,
    required this.client,
    required this.yamlInfo,
    required this.gitUser,
    required this.previousCommit,
    required this.projectOriginUrl,
    final String? $type,
  }) : $type = $type ?? 'gotProjectOriginUrl',
       super._();

  factory _$GenerateFlowGotProjectOriginUrlImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$GenerateFlowGotProjectOriginUrlImplFromJson(json);

  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  final BabelSupportedLocales inputedByUserLocale;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;
  @override
  final GitUser gitUser;
  @override
  final GitCommit previousCommit;
  @override
  final String projectOriginUrl;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenerateFlowState.gotProjectOriginUrl(accountApiKey: $accountApiKey, directoryPath: $directoryPath, inputedByUserLocale: $inputedByUserLocale, client: $client, yamlInfo: $yamlInfo, gitUser: $gitUser, previousCommit: $previousCommit, projectOriginUrl: $projectOriginUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowGotProjectOriginUrlImpl &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.inputedByUserLocale, inputedByUserLocale) ||
                other.inputedByUserLocale == inputedByUserLocale) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo) &&
            (identical(other.gitUser, gitUser) || other.gitUser == gitUser) &&
            (identical(other.previousCommit, previousCommit) ||
                other.previousCommit == previousCommit) &&
            (identical(other.projectOriginUrl, projectOriginUrl) ||
                other.projectOriginUrl == projectOriginUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accountApiKey,
    directoryPath,
    inputedByUserLocale,
    client,
    yamlInfo,
    gitUser,
    previousCommit,
    projectOriginUrl,
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowGotProjectOriginUrlImplCopyWith<
    _$GenerateFlowGotProjectOriginUrlImpl
  >
  get copyWith => __$$GenerateFlowGotProjectOriginUrlImplCopyWithImpl<
    _$GenerateFlowGotProjectOriginUrlImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    gotAppLanguages,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )
    downloadReferenceArb,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )
    projectCacheMap,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    resolvedProjectCacheTranslation,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )
    gotTargetFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )
    gotL10nProjectConfig,
  }) {
    return gotProjectOriginUrl(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitUser,
      previousCommit,
      projectOriginUrl,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
  }) {
    return gotProjectOriginUrl?.call(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitUser,
      previousCommit,
      projectOriginUrl,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (gotProjectOriginUrl != null) {
      return gotProjectOriginUrl(
        accountApiKey,
        directoryPath,
        inputedByUserLocale,
        client,
        yamlInfo,
        gitUser,
        previousCommit,
        projectOriginUrl,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
    required TResult Function(GenerateFlowGotAppLanguages value)
    gotAppLanguages,
    required TResult Function(GenerateFlowDownloadReferenceArb value)
    downloadReferenceArb,
    required TResult Function(GenerateFlowProjectCacheMap value)
    projectCacheMap,
    required TResult Function(GenerateFlowResolvedProjectCacheTranslation value)
    resolvedProjectCacheTranslation,
    required TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(GenerateFlowGotTargetFiles value) gotTargetFiles,
    required TResult Function(GenerateFlowGotL10nProjectConfig value)
    gotL10nProjectConfig,
  }) {
    return gotProjectOriginUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult? Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult? Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult? Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult? Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult? Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
  }) {
    return gotProjectOriginUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (gotProjectOriginUrl != null) {
      return gotProjectOriginUrl(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowGotProjectOriginUrlImplToJson(this);
  }
}

abstract class GenerateFlowGotProjectOriginUrl extends GenerateFlowState {
  factory GenerateFlowGotProjectOriginUrl({
    required final String accountApiKey,
    required final String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required final BabelSupportedLocales inputedByUserLocale,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitUser gitUser,
    required final GitCommit previousCommit,
    required final String projectOriginUrl,
  }) = _$GenerateFlowGotProjectOriginUrlImpl;
  GenerateFlowGotProjectOriginUrl._() : super._();

  factory GenerateFlowGotProjectOriginUrl.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowGotProjectOriginUrlImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get inputedByUserLocale;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitUser get gitUser;
  GitCommit get previousCommit;
  String get projectOriginUrl;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowGotProjectOriginUrlImplCopyWith<
    _$GenerateFlowGotProjectOriginUrlImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowGotGitVariablesImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowGotGitVariablesImplCopyWith(
    _$GenerateFlowGotGitVariablesImpl value,
    $Res Function(_$GenerateFlowGotGitVariablesImpl) then,
  ) = __$$GenerateFlowGotGitVariablesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    BabelSupportedLocales inputedByUserLocale,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitVariables gitVariables,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
  $GitVariablesCopyWith<$Res> get gitVariables;
}

/// @nodoc
class __$$GenerateFlowGotGitVariablesImplCopyWithImpl<$Res>
    extends
        _$GenerateFlowStateCopyWithImpl<$Res, _$GenerateFlowGotGitVariablesImpl>
    implements _$$GenerateFlowGotGitVariablesImplCopyWith<$Res> {
  __$$GenerateFlowGotGitVariablesImplCopyWithImpl(
    _$GenerateFlowGotGitVariablesImpl _value,
    $Res Function(_$GenerateFlowGotGitVariablesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? inputedByUserLocale = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitVariables = null,
  }) {
    return _then(
      _$GenerateFlowGotGitVariablesImpl(
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        inputedByUserLocale:
            null == inputedByUserLocale
                ? _value.inputedByUserLocale
                : inputedByUserLocale // ignore: cast_nullable_to_non_nullable
                    as BabelSupportedLocales,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitVariables:
            null == gitVariables
                ? _value.gitVariables
                : gitVariables // ignore: cast_nullable_to_non_nullable
                    as GitVariables,
      ),
    );
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GitVariablesCopyWith<$Res> get gitVariables {
    return $GitVariablesCopyWith<$Res>(_value.gitVariables, (value) {
      return _then(_value.copyWith(gitVariables: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateFlowGotGitVariablesImpl extends GenerateFlowGotGitVariables {
  _$GenerateFlowGotGitVariablesImpl({
    required this.accountApiKey,
    required this.directoryPath,
    @BabelSupportedLocalesJsonConverter() required this.inputedByUserLocale,
    required this.client,
    required this.yamlInfo,
    required this.gitVariables,
    final String? $type,
  }) : $type = $type ?? 'gotGitVariables',
       super._();

  factory _$GenerateFlowGotGitVariablesImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$GenerateFlowGotGitVariablesImplFromJson(json);

  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  final BabelSupportedLocales inputedByUserLocale;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;
  @override
  final GitVariables gitVariables;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenerateFlowState.gotGitVariables(accountApiKey: $accountApiKey, directoryPath: $directoryPath, inputedByUserLocale: $inputedByUserLocale, client: $client, yamlInfo: $yamlInfo, gitVariables: $gitVariables)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowGotGitVariablesImpl &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.inputedByUserLocale, inputedByUserLocale) ||
                other.inputedByUserLocale == inputedByUserLocale) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo) &&
            (identical(other.gitVariables, gitVariables) ||
                other.gitVariables == gitVariables));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accountApiKey,
    directoryPath,
    inputedByUserLocale,
    client,
    yamlInfo,
    gitVariables,
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowGotGitVariablesImplCopyWith<_$GenerateFlowGotGitVariablesImpl>
  get copyWith => __$$GenerateFlowGotGitVariablesImplCopyWithImpl<
    _$GenerateFlowGotGitVariablesImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    gotAppLanguages,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )
    downloadReferenceArb,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )
    projectCacheMap,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    resolvedProjectCacheTranslation,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )
    gotTargetFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )
    gotL10nProjectConfig,
  }) {
    return gotGitVariables(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitVariables,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
  }) {
    return gotGitVariables?.call(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitVariables,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (gotGitVariables != null) {
      return gotGitVariables(
        accountApiKey,
        directoryPath,
        inputedByUserLocale,
        client,
        yamlInfo,
        gitVariables,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
    required TResult Function(GenerateFlowGotAppLanguages value)
    gotAppLanguages,
    required TResult Function(GenerateFlowDownloadReferenceArb value)
    downloadReferenceArb,
    required TResult Function(GenerateFlowProjectCacheMap value)
    projectCacheMap,
    required TResult Function(GenerateFlowResolvedProjectCacheTranslation value)
    resolvedProjectCacheTranslation,
    required TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(GenerateFlowGotTargetFiles value) gotTargetFiles,
    required TResult Function(GenerateFlowGotL10nProjectConfig value)
    gotL10nProjectConfig,
  }) {
    return gotGitVariables(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult? Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult? Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult? Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult? Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult? Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
  }) {
    return gotGitVariables?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (gotGitVariables != null) {
      return gotGitVariables(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowGotGitVariablesImplToJson(this);
  }
}

abstract class GenerateFlowGotGitVariables extends GenerateFlowState {
  factory GenerateFlowGotGitVariables({
    required final String accountApiKey,
    required final String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required final BabelSupportedLocales inputedByUserLocale,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitVariables gitVariables,
  }) = _$GenerateFlowGotGitVariablesImpl;
  GenerateFlowGotGitVariables._() : super._();

  factory GenerateFlowGotGitVariables.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowGotGitVariablesImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get inputedByUserLocale;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitVariables get gitVariables;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowGotGitVariablesImplCopyWith<_$GenerateFlowGotGitVariablesImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowGotAppLanguagesImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowGotAppLanguagesImplCopyWith(
    _$GenerateFlowGotAppLanguagesImpl value,
    $Res Function(_$GenerateFlowGotAppLanguagesImpl) then,
  ) = __$$GenerateFlowGotAppLanguagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    BabelSupportedLocales inputedByUserLocale,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitVariables gitVariables,
    int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter() Set<BabelSupportedLocales> languages,
    String downloadLink,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
  $GitVariablesCopyWith<$Res> get gitVariables;
}

/// @nodoc
class __$$GenerateFlowGotAppLanguagesImplCopyWithImpl<$Res>
    extends
        _$GenerateFlowStateCopyWithImpl<$Res, _$GenerateFlowGotAppLanguagesImpl>
    implements _$$GenerateFlowGotAppLanguagesImplCopyWith<$Res> {
  __$$GenerateFlowGotAppLanguagesImplCopyWithImpl(
    _$GenerateFlowGotAppLanguagesImpl _value,
    $Res Function(_$GenerateFlowGotAppLanguagesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? inputedByUserLocale = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitVariables = null,
    Object? maxLanguageCount = null,
    Object? languages = null,
    Object? downloadLink = null,
  }) {
    return _then(
      _$GenerateFlowGotAppLanguagesImpl(
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        inputedByUserLocale:
            null == inputedByUserLocale
                ? _value.inputedByUserLocale
                : inputedByUserLocale // ignore: cast_nullable_to_non_nullable
                    as BabelSupportedLocales,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitVariables:
            null == gitVariables
                ? _value.gitVariables
                : gitVariables // ignore: cast_nullable_to_non_nullable
                    as GitVariables,
        maxLanguageCount:
            null == maxLanguageCount
                ? _value.maxLanguageCount
                : maxLanguageCount // ignore: cast_nullable_to_non_nullable
                    as int,
        languages:
            null == languages
                ? _value._languages
                : languages // ignore: cast_nullable_to_non_nullable
                    as Set<BabelSupportedLocales>,
        downloadLink:
            null == downloadLink
                ? _value.downloadLink
                : downloadLink // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GitVariablesCopyWith<$Res> get gitVariables {
    return $GitVariablesCopyWith<$Res>(_value.gitVariables, (value) {
      return _then(_value.copyWith(gitVariables: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateFlowGotAppLanguagesImpl extends GenerateFlowGotAppLanguages {
  _$GenerateFlowGotAppLanguagesImpl({
    required this.accountApiKey,
    required this.directoryPath,
    @BabelSupportedLocalesJsonConverter() required this.inputedByUserLocale,
    required this.client,
    required this.yamlInfo,
    required this.gitVariables,
    required this.maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required final Set<BabelSupportedLocales> languages,
    required this.downloadLink,
    final String? $type,
  }) : _languages = languages,
       $type = $type ?? 'gotAppLanguages',
       super._();

  factory _$GenerateFlowGotAppLanguagesImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$GenerateFlowGotAppLanguagesImplFromJson(json);

  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  final BabelSupportedLocales inputedByUserLocale;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;
  @override
  final GitVariables gitVariables;
  @override
  final int maxLanguageCount;
  final Set<BabelSupportedLocales> _languages;
  @override
  @BabelSupportedLocalesJsonConverter()
  Set<BabelSupportedLocales> get languages {
    if (_languages is EqualUnmodifiableSetView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_languages);
  }

  @override
  final String downloadLink;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenerateFlowState.gotAppLanguages(accountApiKey: $accountApiKey, directoryPath: $directoryPath, inputedByUserLocale: $inputedByUserLocale, client: $client, yamlInfo: $yamlInfo, gitVariables: $gitVariables, maxLanguageCount: $maxLanguageCount, languages: $languages, downloadLink: $downloadLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowGotAppLanguagesImpl &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.inputedByUserLocale, inputedByUserLocale) ||
                other.inputedByUserLocale == inputedByUserLocale) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo) &&
            (identical(other.gitVariables, gitVariables) ||
                other.gitVariables == gitVariables) &&
            (identical(other.maxLanguageCount, maxLanguageCount) ||
                other.maxLanguageCount == maxLanguageCount) &&
            const DeepCollectionEquality().equals(
              other._languages,
              _languages,
            ) &&
            (identical(other.downloadLink, downloadLink) ||
                other.downloadLink == downloadLink));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accountApiKey,
    directoryPath,
    inputedByUserLocale,
    client,
    yamlInfo,
    gitVariables,
    maxLanguageCount,
    const DeepCollectionEquality().hash(_languages),
    downloadLink,
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowGotAppLanguagesImplCopyWith<_$GenerateFlowGotAppLanguagesImpl>
  get copyWith => __$$GenerateFlowGotAppLanguagesImplCopyWithImpl<
    _$GenerateFlowGotAppLanguagesImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    gotAppLanguages,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )
    downloadReferenceArb,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )
    projectCacheMap,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    resolvedProjectCacheTranslation,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )
    gotTargetFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )
    gotL10nProjectConfig,
  }) {
    return gotAppLanguages(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitVariables,
      maxLanguageCount,
      languages,
      downloadLink,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
  }) {
    return gotAppLanguages?.call(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitVariables,
      maxLanguageCount,
      languages,
      downloadLink,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (gotAppLanguages != null) {
      return gotAppLanguages(
        accountApiKey,
        directoryPath,
        inputedByUserLocale,
        client,
        yamlInfo,
        gitVariables,
        maxLanguageCount,
        languages,
        downloadLink,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
    required TResult Function(GenerateFlowGotAppLanguages value)
    gotAppLanguages,
    required TResult Function(GenerateFlowDownloadReferenceArb value)
    downloadReferenceArb,
    required TResult Function(GenerateFlowProjectCacheMap value)
    projectCacheMap,
    required TResult Function(GenerateFlowResolvedProjectCacheTranslation value)
    resolvedProjectCacheTranslation,
    required TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(GenerateFlowGotTargetFiles value) gotTargetFiles,
    required TResult Function(GenerateFlowGotL10nProjectConfig value)
    gotL10nProjectConfig,
  }) {
    return gotAppLanguages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult? Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult? Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult? Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult? Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult? Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
  }) {
    return gotAppLanguages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (gotAppLanguages != null) {
      return gotAppLanguages(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowGotAppLanguagesImplToJson(this);
  }
}

abstract class GenerateFlowGotAppLanguages extends GenerateFlowState {
  factory GenerateFlowGotAppLanguages({
    required final String accountApiKey,
    required final String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required final BabelSupportedLocales inputedByUserLocale,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitVariables gitVariables,
    required final int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required final Set<BabelSupportedLocales> languages,
    required final String downloadLink,
  }) = _$GenerateFlowGotAppLanguagesImpl;
  GenerateFlowGotAppLanguages._() : super._();

  factory GenerateFlowGotAppLanguages.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowGotAppLanguagesImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get inputedByUserLocale;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitVariables get gitVariables;
  int get maxLanguageCount;
  @BabelSupportedLocalesJsonConverter()
  Set<BabelSupportedLocales> get languages;
  String get downloadLink;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowGotAppLanguagesImplCopyWith<_$GenerateFlowGotAppLanguagesImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowDownloadReferenceArbImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowDownloadReferenceArbImplCopyWith(
    _$GenerateFlowDownloadReferenceArbImpl value,
    $Res Function(_$GenerateFlowDownloadReferenceArbImpl) then,
  ) = __$$GenerateFlowDownloadReferenceArbImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    BabelSupportedLocales inputedByUserLocale,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitVariables gitVariables,
    int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter() Set<BabelSupportedLocales> languages,
    String downloadLink,
    Map<String, String> referenceArbMap,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
  $GitVariablesCopyWith<$Res> get gitVariables;
}

/// @nodoc
class __$$GenerateFlowDownloadReferenceArbImplCopyWithImpl<$Res>
    extends
        _$GenerateFlowStateCopyWithImpl<
          $Res,
          _$GenerateFlowDownloadReferenceArbImpl
        >
    implements _$$GenerateFlowDownloadReferenceArbImplCopyWith<$Res> {
  __$$GenerateFlowDownloadReferenceArbImplCopyWithImpl(
    _$GenerateFlowDownloadReferenceArbImpl _value,
    $Res Function(_$GenerateFlowDownloadReferenceArbImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? inputedByUserLocale = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitVariables = null,
    Object? maxLanguageCount = null,
    Object? languages = null,
    Object? downloadLink = null,
    Object? referenceArbMap = null,
  }) {
    return _then(
      _$GenerateFlowDownloadReferenceArbImpl(
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        inputedByUserLocale:
            null == inputedByUserLocale
                ? _value.inputedByUserLocale
                : inputedByUserLocale // ignore: cast_nullable_to_non_nullable
                    as BabelSupportedLocales,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitVariables:
            null == gitVariables
                ? _value.gitVariables
                : gitVariables // ignore: cast_nullable_to_non_nullable
                    as GitVariables,
        maxLanguageCount:
            null == maxLanguageCount
                ? _value.maxLanguageCount
                : maxLanguageCount // ignore: cast_nullable_to_non_nullable
                    as int,
        languages:
            null == languages
                ? _value._languages
                : languages // ignore: cast_nullable_to_non_nullable
                    as Set<BabelSupportedLocales>,
        downloadLink:
            null == downloadLink
                ? _value.downloadLink
                : downloadLink // ignore: cast_nullable_to_non_nullable
                    as String,
        referenceArbMap:
            null == referenceArbMap
                ? _value._referenceArbMap
                : referenceArbMap // ignore: cast_nullable_to_non_nullable
                    as Map<String, String>,
      ),
    );
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GitVariablesCopyWith<$Res> get gitVariables {
    return $GitVariablesCopyWith<$Res>(_value.gitVariables, (value) {
      return _then(_value.copyWith(gitVariables: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateFlowDownloadReferenceArbImpl
    extends GenerateFlowDownloadReferenceArb {
  _$GenerateFlowDownloadReferenceArbImpl({
    required this.accountApiKey,
    required this.directoryPath,
    @BabelSupportedLocalesJsonConverter() required this.inputedByUserLocale,
    required this.client,
    required this.yamlInfo,
    required this.gitVariables,
    required this.maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required final Set<BabelSupportedLocales> languages,
    required this.downloadLink,
    required final Map<String, String> referenceArbMap,
    final String? $type,
  }) : _languages = languages,
       _referenceArbMap = referenceArbMap,
       $type = $type ?? 'downloadReferenceArb',
       super._();

  factory _$GenerateFlowDownloadReferenceArbImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$GenerateFlowDownloadReferenceArbImplFromJson(json);

  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  final BabelSupportedLocales inputedByUserLocale;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;
  @override
  final GitVariables gitVariables;
  @override
  final int maxLanguageCount;
  final Set<BabelSupportedLocales> _languages;
  @override
  @BabelSupportedLocalesJsonConverter()
  Set<BabelSupportedLocales> get languages {
    if (_languages is EqualUnmodifiableSetView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_languages);
  }

  @override
  final String downloadLink;
  final Map<String, String> _referenceArbMap;
  @override
  Map<String, String> get referenceArbMap {
    if (_referenceArbMap is EqualUnmodifiableMapView) return _referenceArbMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_referenceArbMap);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenerateFlowState.downloadReferenceArb(accountApiKey: $accountApiKey, directoryPath: $directoryPath, inputedByUserLocale: $inputedByUserLocale, client: $client, yamlInfo: $yamlInfo, gitVariables: $gitVariables, maxLanguageCount: $maxLanguageCount, languages: $languages, downloadLink: $downloadLink, referenceArbMap: $referenceArbMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowDownloadReferenceArbImpl &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.inputedByUserLocale, inputedByUserLocale) ||
                other.inputedByUserLocale == inputedByUserLocale) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo) &&
            (identical(other.gitVariables, gitVariables) ||
                other.gitVariables == gitVariables) &&
            (identical(other.maxLanguageCount, maxLanguageCount) ||
                other.maxLanguageCount == maxLanguageCount) &&
            const DeepCollectionEquality().equals(
              other._languages,
              _languages,
            ) &&
            (identical(other.downloadLink, downloadLink) ||
                other.downloadLink == downloadLink) &&
            const DeepCollectionEquality().equals(
              other._referenceArbMap,
              _referenceArbMap,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accountApiKey,
    directoryPath,
    inputedByUserLocale,
    client,
    yamlInfo,
    gitVariables,
    maxLanguageCount,
    const DeepCollectionEquality().hash(_languages),
    downloadLink,
    const DeepCollectionEquality().hash(_referenceArbMap),
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowDownloadReferenceArbImplCopyWith<
    _$GenerateFlowDownloadReferenceArbImpl
  >
  get copyWith => __$$GenerateFlowDownloadReferenceArbImplCopyWithImpl<
    _$GenerateFlowDownloadReferenceArbImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    gotAppLanguages,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )
    downloadReferenceArb,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )
    projectCacheMap,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    resolvedProjectCacheTranslation,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )
    gotTargetFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )
    gotL10nProjectConfig,
  }) {
    return downloadReferenceArb(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitVariables,
      maxLanguageCount,
      languages,
      downloadLink,
      referenceArbMap,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
  }) {
    return downloadReferenceArb?.call(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitVariables,
      maxLanguageCount,
      languages,
      downloadLink,
      referenceArbMap,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (downloadReferenceArb != null) {
      return downloadReferenceArb(
        accountApiKey,
        directoryPath,
        inputedByUserLocale,
        client,
        yamlInfo,
        gitVariables,
        maxLanguageCount,
        languages,
        downloadLink,
        referenceArbMap,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
    required TResult Function(GenerateFlowGotAppLanguages value)
    gotAppLanguages,
    required TResult Function(GenerateFlowDownloadReferenceArb value)
    downloadReferenceArb,
    required TResult Function(GenerateFlowProjectCacheMap value)
    projectCacheMap,
    required TResult Function(GenerateFlowResolvedProjectCacheTranslation value)
    resolvedProjectCacheTranslation,
    required TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(GenerateFlowGotTargetFiles value) gotTargetFiles,
    required TResult Function(GenerateFlowGotL10nProjectConfig value)
    gotL10nProjectConfig,
  }) {
    return downloadReferenceArb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult? Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult? Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult? Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult? Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult? Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
  }) {
    return downloadReferenceArb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (downloadReferenceArb != null) {
      return downloadReferenceArb(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowDownloadReferenceArbImplToJson(this);
  }
}

abstract class GenerateFlowDownloadReferenceArb extends GenerateFlowState {
  factory GenerateFlowDownloadReferenceArb({
    required final String accountApiKey,
    required final String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required final BabelSupportedLocales inputedByUserLocale,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitVariables gitVariables,
    required final int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required final Set<BabelSupportedLocales> languages,
    required final String downloadLink,
    required final Map<String, String> referenceArbMap,
  }) = _$GenerateFlowDownloadReferenceArbImpl;
  GenerateFlowDownloadReferenceArb._() : super._();

  factory GenerateFlowDownloadReferenceArb.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowDownloadReferenceArbImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get inputedByUserLocale;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitVariables get gitVariables;
  int get maxLanguageCount;
  @BabelSupportedLocalesJsonConverter()
  Set<BabelSupportedLocales> get languages;
  String get downloadLink;
  Map<String, String> get referenceArbMap;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowDownloadReferenceArbImplCopyWith<
    _$GenerateFlowDownloadReferenceArbImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowProjectCacheMapImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowProjectCacheMapImplCopyWith(
    _$GenerateFlowProjectCacheMapImpl value,
    $Res Function(_$GenerateFlowProjectCacheMapImpl) then,
  ) = __$$GenerateFlowProjectCacheMapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    BabelSupportedLocales inputedByUserLocale,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitVariables gitVariables,
    int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter() Set<BabelSupportedLocales> languages,
    String downloadLink,
    Map<String, String> referenceArbMap,
    ProjectCacheMap projectCacheMap,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
  $GitVariablesCopyWith<$Res> get gitVariables;
}

/// @nodoc
class __$$GenerateFlowProjectCacheMapImplCopyWithImpl<$Res>
    extends
        _$GenerateFlowStateCopyWithImpl<$Res, _$GenerateFlowProjectCacheMapImpl>
    implements _$$GenerateFlowProjectCacheMapImplCopyWith<$Res> {
  __$$GenerateFlowProjectCacheMapImplCopyWithImpl(
    _$GenerateFlowProjectCacheMapImpl _value,
    $Res Function(_$GenerateFlowProjectCacheMapImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? inputedByUserLocale = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitVariables = null,
    Object? maxLanguageCount = null,
    Object? languages = null,
    Object? downloadLink = null,
    Object? referenceArbMap = null,
    Object? projectCacheMap = null,
  }) {
    return _then(
      _$GenerateFlowProjectCacheMapImpl(
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        inputedByUserLocale:
            null == inputedByUserLocale
                ? _value.inputedByUserLocale
                : inputedByUserLocale // ignore: cast_nullable_to_non_nullable
                    as BabelSupportedLocales,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitVariables:
            null == gitVariables
                ? _value.gitVariables
                : gitVariables // ignore: cast_nullable_to_non_nullable
                    as GitVariables,
        maxLanguageCount:
            null == maxLanguageCount
                ? _value.maxLanguageCount
                : maxLanguageCount // ignore: cast_nullable_to_non_nullable
                    as int,
        languages:
            null == languages
                ? _value._languages
                : languages // ignore: cast_nullable_to_non_nullable
                    as Set<BabelSupportedLocales>,
        downloadLink:
            null == downloadLink
                ? _value.downloadLink
                : downloadLink // ignore: cast_nullable_to_non_nullable
                    as String,
        referenceArbMap:
            null == referenceArbMap
                ? _value._referenceArbMap
                : referenceArbMap // ignore: cast_nullable_to_non_nullable
                    as Map<String, String>,
        projectCacheMap:
            null == projectCacheMap
                ? _value.projectCacheMap
                : projectCacheMap // ignore: cast_nullable_to_non_nullable
                    as ProjectCacheMap,
      ),
    );
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GitVariablesCopyWith<$Res> get gitVariables {
    return $GitVariablesCopyWith<$Res>(_value.gitVariables, (value) {
      return _then(_value.copyWith(gitVariables: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateFlowProjectCacheMapImpl extends GenerateFlowProjectCacheMap {
  _$GenerateFlowProjectCacheMapImpl({
    required this.accountApiKey,
    required this.directoryPath,
    @BabelSupportedLocalesJsonConverter() required this.inputedByUserLocale,
    required this.client,
    required this.yamlInfo,
    required this.gitVariables,
    required this.maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required final Set<BabelSupportedLocales> languages,
    required this.downloadLink,
    required final Map<String, String> referenceArbMap,
    required this.projectCacheMap,
    final String? $type,
  }) : _languages = languages,
       _referenceArbMap = referenceArbMap,
       $type = $type ?? 'projectCacheMap',
       super._();

  factory _$GenerateFlowProjectCacheMapImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$GenerateFlowProjectCacheMapImplFromJson(json);

  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  final BabelSupportedLocales inputedByUserLocale;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;
  @override
  final GitVariables gitVariables;
  @override
  final int maxLanguageCount;
  final Set<BabelSupportedLocales> _languages;
  @override
  @BabelSupportedLocalesJsonConverter()
  Set<BabelSupportedLocales> get languages {
    if (_languages is EqualUnmodifiableSetView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_languages);
  }

  @override
  final String downloadLink;
  final Map<String, String> _referenceArbMap;
  @override
  Map<String, String> get referenceArbMap {
    if (_referenceArbMap is EqualUnmodifiableMapView) return _referenceArbMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_referenceArbMap);
  }

  @override
  final ProjectCacheMap projectCacheMap;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenerateFlowState.projectCacheMap(accountApiKey: $accountApiKey, directoryPath: $directoryPath, inputedByUserLocale: $inputedByUserLocale, client: $client, yamlInfo: $yamlInfo, gitVariables: $gitVariables, maxLanguageCount: $maxLanguageCount, languages: $languages, downloadLink: $downloadLink, referenceArbMap: $referenceArbMap, projectCacheMap: $projectCacheMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowProjectCacheMapImpl &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.inputedByUserLocale, inputedByUserLocale) ||
                other.inputedByUserLocale == inputedByUserLocale) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo) &&
            (identical(other.gitVariables, gitVariables) ||
                other.gitVariables == gitVariables) &&
            (identical(other.maxLanguageCount, maxLanguageCount) ||
                other.maxLanguageCount == maxLanguageCount) &&
            const DeepCollectionEquality().equals(
              other._languages,
              _languages,
            ) &&
            (identical(other.downloadLink, downloadLink) ||
                other.downloadLink == downloadLink) &&
            const DeepCollectionEquality().equals(
              other._referenceArbMap,
              _referenceArbMap,
            ) &&
            (identical(other.projectCacheMap, projectCacheMap) ||
                other.projectCacheMap == projectCacheMap));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accountApiKey,
    directoryPath,
    inputedByUserLocale,
    client,
    yamlInfo,
    gitVariables,
    maxLanguageCount,
    const DeepCollectionEquality().hash(_languages),
    downloadLink,
    const DeepCollectionEquality().hash(_referenceArbMap),
    projectCacheMap,
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowProjectCacheMapImplCopyWith<_$GenerateFlowProjectCacheMapImpl>
  get copyWith => __$$GenerateFlowProjectCacheMapImplCopyWithImpl<
    _$GenerateFlowProjectCacheMapImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    gotAppLanguages,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )
    downloadReferenceArb,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )
    projectCacheMap,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    resolvedProjectCacheTranslation,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )
    gotTargetFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )
    gotL10nProjectConfig,
  }) {
    return projectCacheMap(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitVariables,
      maxLanguageCount,
      languages,
      downloadLink,
      referenceArbMap,
      this.projectCacheMap,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
  }) {
    return projectCacheMap?.call(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitVariables,
      maxLanguageCount,
      languages,
      downloadLink,
      referenceArbMap,
      this.projectCacheMap,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (projectCacheMap != null) {
      return projectCacheMap(
        accountApiKey,
        directoryPath,
        inputedByUserLocale,
        client,
        yamlInfo,
        gitVariables,
        maxLanguageCount,
        languages,
        downloadLink,
        referenceArbMap,
        this.projectCacheMap,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
    required TResult Function(GenerateFlowGotAppLanguages value)
    gotAppLanguages,
    required TResult Function(GenerateFlowDownloadReferenceArb value)
    downloadReferenceArb,
    required TResult Function(GenerateFlowProjectCacheMap value)
    projectCacheMap,
    required TResult Function(GenerateFlowResolvedProjectCacheTranslation value)
    resolvedProjectCacheTranslation,
    required TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(GenerateFlowGotTargetFiles value) gotTargetFiles,
    required TResult Function(GenerateFlowGotL10nProjectConfig value)
    gotL10nProjectConfig,
  }) {
    return projectCacheMap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult? Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult? Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult? Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult? Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult? Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
  }) {
    return projectCacheMap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (projectCacheMap != null) {
      return projectCacheMap(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowProjectCacheMapImplToJson(this);
  }
}

abstract class GenerateFlowProjectCacheMap extends GenerateFlowState {
  factory GenerateFlowProjectCacheMap({
    required final String accountApiKey,
    required final String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required final BabelSupportedLocales inputedByUserLocale,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitVariables gitVariables,
    required final int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required final Set<BabelSupportedLocales> languages,
    required final String downloadLink,
    required final Map<String, String> referenceArbMap,
    required final ProjectCacheMap projectCacheMap,
  }) = _$GenerateFlowProjectCacheMapImpl;
  GenerateFlowProjectCacheMap._() : super._();

  factory GenerateFlowProjectCacheMap.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowProjectCacheMapImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get inputedByUserLocale;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitVariables get gitVariables;
  int get maxLanguageCount;
  @BabelSupportedLocalesJsonConverter()
  Set<BabelSupportedLocales> get languages;
  String get downloadLink;
  Map<String, String> get referenceArbMap;
  ProjectCacheMap get projectCacheMap;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowProjectCacheMapImplCopyWith<_$GenerateFlowProjectCacheMapImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowResolvedProjectCacheTranslationImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowResolvedProjectCacheTranslationImplCopyWith(
    _$GenerateFlowResolvedProjectCacheTranslationImpl value,
    $Res Function(_$GenerateFlowResolvedProjectCacheTranslationImpl) then,
  ) = __$$GenerateFlowResolvedProjectCacheTranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    BabelSupportedLocales inputedByUserLocale,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitVariables gitVariables,
    int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter() Set<BabelSupportedLocales> languages,
    String downloadLink,
    Map<String, String> referenceArbMap,
    ProjectCacheMap projectCacheMap,
    TranslationPayloadInfo cacheMapTranslationPayloadInfo,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
  $GitVariablesCopyWith<$Res> get gitVariables;
  $TranslationPayloadInfoCopyWith<$Res> get cacheMapTranslationPayloadInfo;
}

/// @nodoc
class __$$GenerateFlowResolvedProjectCacheTranslationImplCopyWithImpl<$Res>
    extends
        _$GenerateFlowStateCopyWithImpl<
          $Res,
          _$GenerateFlowResolvedProjectCacheTranslationImpl
        >
    implements
        _$$GenerateFlowResolvedProjectCacheTranslationImplCopyWith<$Res> {
  __$$GenerateFlowResolvedProjectCacheTranslationImplCopyWithImpl(
    _$GenerateFlowResolvedProjectCacheTranslationImpl _value,
    $Res Function(_$GenerateFlowResolvedProjectCacheTranslationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? inputedByUserLocale = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitVariables = null,
    Object? maxLanguageCount = null,
    Object? languages = null,
    Object? downloadLink = null,
    Object? referenceArbMap = null,
    Object? projectCacheMap = null,
    Object? cacheMapTranslationPayloadInfo = null,
  }) {
    return _then(
      _$GenerateFlowResolvedProjectCacheTranslationImpl(
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        inputedByUserLocale:
            null == inputedByUserLocale
                ? _value.inputedByUserLocale
                : inputedByUserLocale // ignore: cast_nullable_to_non_nullable
                    as BabelSupportedLocales,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitVariables:
            null == gitVariables
                ? _value.gitVariables
                : gitVariables // ignore: cast_nullable_to_non_nullable
                    as GitVariables,
        maxLanguageCount:
            null == maxLanguageCount
                ? _value.maxLanguageCount
                : maxLanguageCount // ignore: cast_nullable_to_non_nullable
                    as int,
        languages:
            null == languages
                ? _value._languages
                : languages // ignore: cast_nullable_to_non_nullable
                    as Set<BabelSupportedLocales>,
        downloadLink:
            null == downloadLink
                ? _value.downloadLink
                : downloadLink // ignore: cast_nullable_to_non_nullable
                    as String,
        referenceArbMap:
            null == referenceArbMap
                ? _value._referenceArbMap
                : referenceArbMap // ignore: cast_nullable_to_non_nullable
                    as Map<String, String>,
        projectCacheMap:
            null == projectCacheMap
                ? _value.projectCacheMap
                : projectCacheMap // ignore: cast_nullable_to_non_nullable
                    as ProjectCacheMap,
        cacheMapTranslationPayloadInfo:
            null == cacheMapTranslationPayloadInfo
                ? _value.cacheMapTranslationPayloadInfo
                : cacheMapTranslationPayloadInfo // ignore: cast_nullable_to_non_nullable
                    as TranslationPayloadInfo,
      ),
    );
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GitVariablesCopyWith<$Res> get gitVariables {
    return $GitVariablesCopyWith<$Res>(_value.gitVariables, (value) {
      return _then(_value.copyWith(gitVariables: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TranslationPayloadInfoCopyWith<$Res> get cacheMapTranslationPayloadInfo {
    return $TranslationPayloadInfoCopyWith<$Res>(
      _value.cacheMapTranslationPayloadInfo,
      (value) {
        return _then(_value.copyWith(cacheMapTranslationPayloadInfo: value));
      },
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateFlowResolvedProjectCacheTranslationImpl
    extends GenerateFlowResolvedProjectCacheTranslation {
  _$GenerateFlowResolvedProjectCacheTranslationImpl({
    required this.accountApiKey,
    required this.directoryPath,
    @BabelSupportedLocalesJsonConverter() required this.inputedByUserLocale,
    required this.client,
    required this.yamlInfo,
    required this.gitVariables,
    required this.maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required final Set<BabelSupportedLocales> languages,
    required this.downloadLink,
    required final Map<String, String> referenceArbMap,
    required this.projectCacheMap,
    required this.cacheMapTranslationPayloadInfo,
    final String? $type,
  }) : _languages = languages,
       _referenceArbMap = referenceArbMap,
       $type = $type ?? 'resolvedProjectCacheTranslation',
       super._();

  factory _$GenerateFlowResolvedProjectCacheTranslationImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$GenerateFlowResolvedProjectCacheTranslationImplFromJson(json);

  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  final BabelSupportedLocales inputedByUserLocale;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;
  @override
  final GitVariables gitVariables;
  @override
  final int maxLanguageCount;
  final Set<BabelSupportedLocales> _languages;
  @override
  @BabelSupportedLocalesJsonConverter()
  Set<BabelSupportedLocales> get languages {
    if (_languages is EqualUnmodifiableSetView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_languages);
  }

  @override
  final String downloadLink;
  final Map<String, String> _referenceArbMap;
  @override
  Map<String, String> get referenceArbMap {
    if (_referenceArbMap is EqualUnmodifiableMapView) return _referenceArbMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_referenceArbMap);
  }

  @override
  final ProjectCacheMap projectCacheMap;
  @override
  final TranslationPayloadInfo cacheMapTranslationPayloadInfo;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenerateFlowState.resolvedProjectCacheTranslation(accountApiKey: $accountApiKey, directoryPath: $directoryPath, inputedByUserLocale: $inputedByUserLocale, client: $client, yamlInfo: $yamlInfo, gitVariables: $gitVariables, maxLanguageCount: $maxLanguageCount, languages: $languages, downloadLink: $downloadLink, referenceArbMap: $referenceArbMap, projectCacheMap: $projectCacheMap, cacheMapTranslationPayloadInfo: $cacheMapTranslationPayloadInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowResolvedProjectCacheTranslationImpl &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.inputedByUserLocale, inputedByUserLocale) ||
                other.inputedByUserLocale == inputedByUserLocale) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo) &&
            (identical(other.gitVariables, gitVariables) ||
                other.gitVariables == gitVariables) &&
            (identical(other.maxLanguageCount, maxLanguageCount) ||
                other.maxLanguageCount == maxLanguageCount) &&
            const DeepCollectionEquality().equals(
              other._languages,
              _languages,
            ) &&
            (identical(other.downloadLink, downloadLink) ||
                other.downloadLink == downloadLink) &&
            const DeepCollectionEquality().equals(
              other._referenceArbMap,
              _referenceArbMap,
            ) &&
            (identical(other.projectCacheMap, projectCacheMap) ||
                other.projectCacheMap == projectCacheMap) &&
            (identical(
                  other.cacheMapTranslationPayloadInfo,
                  cacheMapTranslationPayloadInfo,
                ) ||
                other.cacheMapTranslationPayloadInfo ==
                    cacheMapTranslationPayloadInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accountApiKey,
    directoryPath,
    inputedByUserLocale,
    client,
    yamlInfo,
    gitVariables,
    maxLanguageCount,
    const DeepCollectionEquality().hash(_languages),
    downloadLink,
    const DeepCollectionEquality().hash(_referenceArbMap),
    projectCacheMap,
    cacheMapTranslationPayloadInfo,
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowResolvedProjectCacheTranslationImplCopyWith<
    _$GenerateFlowResolvedProjectCacheTranslationImpl
  >
  get copyWith =>
      __$$GenerateFlowResolvedProjectCacheTranslationImplCopyWithImpl<
        _$GenerateFlowResolvedProjectCacheTranslationImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    gotAppLanguages,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )
    downloadReferenceArb,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )
    projectCacheMap,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    resolvedProjectCacheTranslation,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )
    gotTargetFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )
    gotL10nProjectConfig,
  }) {
    return resolvedProjectCacheTranslation(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitVariables,
      maxLanguageCount,
      languages,
      downloadLink,
      referenceArbMap,
      this.projectCacheMap,
      cacheMapTranslationPayloadInfo,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
  }) {
    return resolvedProjectCacheTranslation?.call(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitVariables,
      maxLanguageCount,
      languages,
      downloadLink,
      referenceArbMap,
      this.projectCacheMap,
      cacheMapTranslationPayloadInfo,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (resolvedProjectCacheTranslation != null) {
      return resolvedProjectCacheTranslation(
        accountApiKey,
        directoryPath,
        inputedByUserLocale,
        client,
        yamlInfo,
        gitVariables,
        maxLanguageCount,
        languages,
        downloadLink,
        referenceArbMap,
        this.projectCacheMap,
        cacheMapTranslationPayloadInfo,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
    required TResult Function(GenerateFlowGotAppLanguages value)
    gotAppLanguages,
    required TResult Function(GenerateFlowDownloadReferenceArb value)
    downloadReferenceArb,
    required TResult Function(GenerateFlowProjectCacheMap value)
    projectCacheMap,
    required TResult Function(GenerateFlowResolvedProjectCacheTranslation value)
    resolvedProjectCacheTranslation,
    required TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(GenerateFlowGotTargetFiles value) gotTargetFiles,
    required TResult Function(GenerateFlowGotL10nProjectConfig value)
    gotL10nProjectConfig,
  }) {
    return resolvedProjectCacheTranslation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult? Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult? Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult? Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult? Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult? Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
  }) {
    return resolvedProjectCacheTranslation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (resolvedProjectCacheTranslation != null) {
      return resolvedProjectCacheTranslation(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowResolvedProjectCacheTranslationImplToJson(this);
  }
}

abstract class GenerateFlowResolvedProjectCacheTranslation
    extends GenerateFlowState {
  factory GenerateFlowResolvedProjectCacheTranslation({
    required final String accountApiKey,
    required final String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required final BabelSupportedLocales inputedByUserLocale,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitVariables gitVariables,
    required final int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required final Set<BabelSupportedLocales> languages,
    required final String downloadLink,
    required final Map<String, String> referenceArbMap,
    required final ProjectCacheMap projectCacheMap,
    required final TranslationPayloadInfo cacheMapTranslationPayloadInfo,
  }) = _$GenerateFlowResolvedProjectCacheTranslationImpl;
  GenerateFlowResolvedProjectCacheTranslation._() : super._();

  factory GenerateFlowResolvedProjectCacheTranslation.fromJson(
    Map<String, dynamic> json,
  ) = _$GenerateFlowResolvedProjectCacheTranslationImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get inputedByUserLocale;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitVariables get gitVariables;
  int get maxLanguageCount;
  @BabelSupportedLocalesJsonConverter()
  Set<BabelSupportedLocales> get languages;
  String get downloadLink;
  Map<String, String> get referenceArbMap;
  ProjectCacheMap get projectCacheMap;
  TranslationPayloadInfo get cacheMapTranslationPayloadInfo;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowResolvedProjectCacheTranslationImplCopyWith<
    _$GenerateFlowResolvedProjectCacheTranslationImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowEnsuredNoStaticErrorOnDartFilesImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowEnsuredNoStaticErrorOnDartFilesImplCopyWith(
    _$GenerateFlowEnsuredNoStaticErrorOnDartFilesImpl value,
    $Res Function(_$GenerateFlowEnsuredNoStaticErrorOnDartFilesImpl) then,
  ) = __$$GenerateFlowEnsuredNoStaticErrorOnDartFilesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    BabelSupportedLocales inputedByUserLocale,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitVariables gitVariables,
    int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter() Set<BabelSupportedLocales> languages,
    String downloadLink,
    Map<String, String> referenceArbMap,
    ProjectCacheMap projectCacheMap,
    TranslationPayloadInfo cacheMapTranslationPayloadInfo,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
  $GitVariablesCopyWith<$Res> get gitVariables;
  $TranslationPayloadInfoCopyWith<$Res> get cacheMapTranslationPayloadInfo;
}

/// @nodoc
class __$$GenerateFlowEnsuredNoStaticErrorOnDartFilesImplCopyWithImpl<$Res>
    extends
        _$GenerateFlowStateCopyWithImpl<
          $Res,
          _$GenerateFlowEnsuredNoStaticErrorOnDartFilesImpl
        >
    implements
        _$$GenerateFlowEnsuredNoStaticErrorOnDartFilesImplCopyWith<$Res> {
  __$$GenerateFlowEnsuredNoStaticErrorOnDartFilesImplCopyWithImpl(
    _$GenerateFlowEnsuredNoStaticErrorOnDartFilesImpl _value,
    $Res Function(_$GenerateFlowEnsuredNoStaticErrorOnDartFilesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? inputedByUserLocale = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitVariables = null,
    Object? maxLanguageCount = null,
    Object? languages = null,
    Object? downloadLink = null,
    Object? referenceArbMap = null,
    Object? projectCacheMap = null,
    Object? cacheMapTranslationPayloadInfo = null,
  }) {
    return _then(
      _$GenerateFlowEnsuredNoStaticErrorOnDartFilesImpl(
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        inputedByUserLocale:
            null == inputedByUserLocale
                ? _value.inputedByUserLocale
                : inputedByUserLocale // ignore: cast_nullable_to_non_nullable
                    as BabelSupportedLocales,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitVariables:
            null == gitVariables
                ? _value.gitVariables
                : gitVariables // ignore: cast_nullable_to_non_nullable
                    as GitVariables,
        maxLanguageCount:
            null == maxLanguageCount
                ? _value.maxLanguageCount
                : maxLanguageCount // ignore: cast_nullable_to_non_nullable
                    as int,
        languages:
            null == languages
                ? _value._languages
                : languages // ignore: cast_nullable_to_non_nullable
                    as Set<BabelSupportedLocales>,
        downloadLink:
            null == downloadLink
                ? _value.downloadLink
                : downloadLink // ignore: cast_nullable_to_non_nullable
                    as String,
        referenceArbMap:
            null == referenceArbMap
                ? _value._referenceArbMap
                : referenceArbMap // ignore: cast_nullable_to_non_nullable
                    as Map<String, String>,
        projectCacheMap:
            null == projectCacheMap
                ? _value.projectCacheMap
                : projectCacheMap // ignore: cast_nullable_to_non_nullable
                    as ProjectCacheMap,
        cacheMapTranslationPayloadInfo:
            null == cacheMapTranslationPayloadInfo
                ? _value.cacheMapTranslationPayloadInfo
                : cacheMapTranslationPayloadInfo // ignore: cast_nullable_to_non_nullable
                    as TranslationPayloadInfo,
      ),
    );
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GitVariablesCopyWith<$Res> get gitVariables {
    return $GitVariablesCopyWith<$Res>(_value.gitVariables, (value) {
      return _then(_value.copyWith(gitVariables: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TranslationPayloadInfoCopyWith<$Res> get cacheMapTranslationPayloadInfo {
    return $TranslationPayloadInfoCopyWith<$Res>(
      _value.cacheMapTranslationPayloadInfo,
      (value) {
        return _then(_value.copyWith(cacheMapTranslationPayloadInfo: value));
      },
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateFlowEnsuredNoStaticErrorOnDartFilesImpl
    extends GenerateFlowEnsuredNoStaticErrorOnDartFiles {
  _$GenerateFlowEnsuredNoStaticErrorOnDartFilesImpl({
    required this.accountApiKey,
    required this.directoryPath,
    @BabelSupportedLocalesJsonConverter() required this.inputedByUserLocale,
    required this.client,
    required this.yamlInfo,
    required this.gitVariables,
    required this.maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required final Set<BabelSupportedLocales> languages,
    required this.downloadLink,
    required final Map<String, String> referenceArbMap,
    required this.projectCacheMap,
    required this.cacheMapTranslationPayloadInfo,
    final String? $type,
  }) : _languages = languages,
       _referenceArbMap = referenceArbMap,
       $type = $type ?? 'ensuredTheresNoStaticErrorOnDartFiles',
       super._();

  factory _$GenerateFlowEnsuredNoStaticErrorOnDartFilesImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$GenerateFlowEnsuredNoStaticErrorOnDartFilesImplFromJson(json);

  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  final BabelSupportedLocales inputedByUserLocale;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;
  @override
  final GitVariables gitVariables;
  @override
  final int maxLanguageCount;
  final Set<BabelSupportedLocales> _languages;
  @override
  @BabelSupportedLocalesJsonConverter()
  Set<BabelSupportedLocales> get languages {
    if (_languages is EqualUnmodifiableSetView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_languages);
  }

  @override
  final String downloadLink;
  final Map<String, String> _referenceArbMap;
  @override
  Map<String, String> get referenceArbMap {
    if (_referenceArbMap is EqualUnmodifiableMapView) return _referenceArbMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_referenceArbMap);
  }

  @override
  final ProjectCacheMap projectCacheMap;
  @override
  final TranslationPayloadInfo cacheMapTranslationPayloadInfo;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenerateFlowState.ensuredTheresNoStaticErrorOnDartFiles(accountApiKey: $accountApiKey, directoryPath: $directoryPath, inputedByUserLocale: $inputedByUserLocale, client: $client, yamlInfo: $yamlInfo, gitVariables: $gitVariables, maxLanguageCount: $maxLanguageCount, languages: $languages, downloadLink: $downloadLink, referenceArbMap: $referenceArbMap, projectCacheMap: $projectCacheMap, cacheMapTranslationPayloadInfo: $cacheMapTranslationPayloadInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowEnsuredNoStaticErrorOnDartFilesImpl &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.inputedByUserLocale, inputedByUserLocale) ||
                other.inputedByUserLocale == inputedByUserLocale) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo) &&
            (identical(other.gitVariables, gitVariables) ||
                other.gitVariables == gitVariables) &&
            (identical(other.maxLanguageCount, maxLanguageCount) ||
                other.maxLanguageCount == maxLanguageCount) &&
            const DeepCollectionEquality().equals(
              other._languages,
              _languages,
            ) &&
            (identical(other.downloadLink, downloadLink) ||
                other.downloadLink == downloadLink) &&
            const DeepCollectionEquality().equals(
              other._referenceArbMap,
              _referenceArbMap,
            ) &&
            (identical(other.projectCacheMap, projectCacheMap) ||
                other.projectCacheMap == projectCacheMap) &&
            (identical(
                  other.cacheMapTranslationPayloadInfo,
                  cacheMapTranslationPayloadInfo,
                ) ||
                other.cacheMapTranslationPayloadInfo ==
                    cacheMapTranslationPayloadInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accountApiKey,
    directoryPath,
    inputedByUserLocale,
    client,
    yamlInfo,
    gitVariables,
    maxLanguageCount,
    const DeepCollectionEquality().hash(_languages),
    downloadLink,
    const DeepCollectionEquality().hash(_referenceArbMap),
    projectCacheMap,
    cacheMapTranslationPayloadInfo,
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowEnsuredNoStaticErrorOnDartFilesImplCopyWith<
    _$GenerateFlowEnsuredNoStaticErrorOnDartFilesImpl
  >
  get copyWith =>
      __$$GenerateFlowEnsuredNoStaticErrorOnDartFilesImplCopyWithImpl<
        _$GenerateFlowEnsuredNoStaticErrorOnDartFilesImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    gotAppLanguages,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )
    downloadReferenceArb,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )
    projectCacheMap,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    resolvedProjectCacheTranslation,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )
    gotTargetFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )
    gotL10nProjectConfig,
  }) {
    return ensuredTheresNoStaticErrorOnDartFiles(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitVariables,
      maxLanguageCount,
      languages,
      downloadLink,
      referenceArbMap,
      this.projectCacheMap,
      cacheMapTranslationPayloadInfo,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
  }) {
    return ensuredTheresNoStaticErrorOnDartFiles?.call(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitVariables,
      maxLanguageCount,
      languages,
      downloadLink,
      referenceArbMap,
      this.projectCacheMap,
      cacheMapTranslationPayloadInfo,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (ensuredTheresNoStaticErrorOnDartFiles != null) {
      return ensuredTheresNoStaticErrorOnDartFiles(
        accountApiKey,
        directoryPath,
        inputedByUserLocale,
        client,
        yamlInfo,
        gitVariables,
        maxLanguageCount,
        languages,
        downloadLink,
        referenceArbMap,
        this.projectCacheMap,
        cacheMapTranslationPayloadInfo,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
    required TResult Function(GenerateFlowGotAppLanguages value)
    gotAppLanguages,
    required TResult Function(GenerateFlowDownloadReferenceArb value)
    downloadReferenceArb,
    required TResult Function(GenerateFlowProjectCacheMap value)
    projectCacheMap,
    required TResult Function(GenerateFlowResolvedProjectCacheTranslation value)
    resolvedProjectCacheTranslation,
    required TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(GenerateFlowGotTargetFiles value) gotTargetFiles,
    required TResult Function(GenerateFlowGotL10nProjectConfig value)
    gotL10nProjectConfig,
  }) {
    return ensuredTheresNoStaticErrorOnDartFiles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult? Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult? Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult? Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult? Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult? Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
  }) {
    return ensuredTheresNoStaticErrorOnDartFiles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (ensuredTheresNoStaticErrorOnDartFiles != null) {
      return ensuredTheresNoStaticErrorOnDartFiles(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowEnsuredNoStaticErrorOnDartFilesImplToJson(this);
  }
}

abstract class GenerateFlowEnsuredNoStaticErrorOnDartFiles
    extends GenerateFlowState {
  factory GenerateFlowEnsuredNoStaticErrorOnDartFiles({
    required final String accountApiKey,
    required final String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required final BabelSupportedLocales inputedByUserLocale,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitVariables gitVariables,
    required final int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required final Set<BabelSupportedLocales> languages,
    required final String downloadLink,
    required final Map<String, String> referenceArbMap,
    required final ProjectCacheMap projectCacheMap,
    required final TranslationPayloadInfo cacheMapTranslationPayloadInfo,
  }) = _$GenerateFlowEnsuredNoStaticErrorOnDartFilesImpl;
  GenerateFlowEnsuredNoStaticErrorOnDartFiles._() : super._();

  factory GenerateFlowEnsuredNoStaticErrorOnDartFiles.fromJson(
    Map<String, dynamic> json,
  ) = _$GenerateFlowEnsuredNoStaticErrorOnDartFilesImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get inputedByUserLocale;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitVariables get gitVariables;
  int get maxLanguageCount;
  @BabelSupportedLocalesJsonConverter()
  Set<BabelSupportedLocales> get languages;
  String get downloadLink;
  Map<String, String> get referenceArbMap;
  ProjectCacheMap get projectCacheMap;
  TranslationPayloadInfo get cacheMapTranslationPayloadInfo;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowEnsuredNoStaticErrorOnDartFilesImplCopyWith<
    _$GenerateFlowEnsuredNoStaticErrorOnDartFilesImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowGotTargetFilesImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowGotTargetFilesImplCopyWith(
    _$GenerateFlowGotTargetFilesImpl value,
    $Res Function(_$GenerateFlowGotTargetFilesImpl) then,
  ) = __$$GenerateFlowGotTargetFilesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    BabelSupportedLocales inputedByUserLocale,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitVariables gitVariables,
    int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter() Set<BabelSupportedLocales> languages,
    String downloadLink,
    Map<String, String> referenceArbMap,
    ProjectCacheMap projectCacheMap,
    TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    FilesVerification filesVerificationState,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
  $GitVariablesCopyWith<$Res> get gitVariables;
  $TranslationPayloadInfoCopyWith<$Res> get cacheMapTranslationPayloadInfo;
  $FilesVerificationCopyWith<$Res> get filesVerificationState;
}

/// @nodoc
class __$$GenerateFlowGotTargetFilesImplCopyWithImpl<$Res>
    extends
        _$GenerateFlowStateCopyWithImpl<$Res, _$GenerateFlowGotTargetFilesImpl>
    implements _$$GenerateFlowGotTargetFilesImplCopyWith<$Res> {
  __$$GenerateFlowGotTargetFilesImplCopyWithImpl(
    _$GenerateFlowGotTargetFilesImpl _value,
    $Res Function(_$GenerateFlowGotTargetFilesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? inputedByUserLocale = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitVariables = null,
    Object? maxLanguageCount = null,
    Object? languages = null,
    Object? downloadLink = null,
    Object? referenceArbMap = null,
    Object? projectCacheMap = null,
    Object? cacheMapTranslationPayloadInfo = null,
    Object? filesVerificationState = null,
  }) {
    return _then(
      _$GenerateFlowGotTargetFilesImpl(
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        inputedByUserLocale:
            null == inputedByUserLocale
                ? _value.inputedByUserLocale
                : inputedByUserLocale // ignore: cast_nullable_to_non_nullable
                    as BabelSupportedLocales,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitVariables:
            null == gitVariables
                ? _value.gitVariables
                : gitVariables // ignore: cast_nullable_to_non_nullable
                    as GitVariables,
        maxLanguageCount:
            null == maxLanguageCount
                ? _value.maxLanguageCount
                : maxLanguageCount // ignore: cast_nullable_to_non_nullable
                    as int,
        languages:
            null == languages
                ? _value._languages
                : languages // ignore: cast_nullable_to_non_nullable
                    as Set<BabelSupportedLocales>,
        downloadLink:
            null == downloadLink
                ? _value.downloadLink
                : downloadLink // ignore: cast_nullable_to_non_nullable
                    as String,
        referenceArbMap:
            null == referenceArbMap
                ? _value._referenceArbMap
                : referenceArbMap // ignore: cast_nullable_to_non_nullable
                    as Map<String, String>,
        projectCacheMap:
            null == projectCacheMap
                ? _value.projectCacheMap
                : projectCacheMap // ignore: cast_nullable_to_non_nullable
                    as ProjectCacheMap,
        cacheMapTranslationPayloadInfo:
            null == cacheMapTranslationPayloadInfo
                ? _value.cacheMapTranslationPayloadInfo
                : cacheMapTranslationPayloadInfo // ignore: cast_nullable_to_non_nullable
                    as TranslationPayloadInfo,
        filesVerificationState:
            null == filesVerificationState
                ? _value.filesVerificationState
                : filesVerificationState // ignore: cast_nullable_to_non_nullable
                    as FilesVerification,
      ),
    );
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GitVariablesCopyWith<$Res> get gitVariables {
    return $GitVariablesCopyWith<$Res>(_value.gitVariables, (value) {
      return _then(_value.copyWith(gitVariables: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TranslationPayloadInfoCopyWith<$Res> get cacheMapTranslationPayloadInfo {
    return $TranslationPayloadInfoCopyWith<$Res>(
      _value.cacheMapTranslationPayloadInfo,
      (value) {
        return _then(_value.copyWith(cacheMapTranslationPayloadInfo: value));
      },
    );
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FilesVerificationCopyWith<$Res> get filesVerificationState {
    return $FilesVerificationCopyWith<$Res>(_value.filesVerificationState, (
      value,
    ) {
      return _then(_value.copyWith(filesVerificationState: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateFlowGotTargetFilesImpl extends GenerateFlowGotTargetFiles {
  _$GenerateFlowGotTargetFilesImpl({
    required this.accountApiKey,
    required this.directoryPath,
    @BabelSupportedLocalesJsonConverter() required this.inputedByUserLocale,
    required this.client,
    required this.yamlInfo,
    required this.gitVariables,
    required this.maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required final Set<BabelSupportedLocales> languages,
    required this.downloadLink,
    required final Map<String, String> referenceArbMap,
    required this.projectCacheMap,
    required this.cacheMapTranslationPayloadInfo,
    required this.filesVerificationState,
    final String? $type,
  }) : _languages = languages,
       _referenceArbMap = referenceArbMap,
       $type = $type ?? 'gotTargetFiles',
       super._();

  factory _$GenerateFlowGotTargetFilesImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$GenerateFlowGotTargetFilesImplFromJson(json);

  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  final BabelSupportedLocales inputedByUserLocale;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;
  @override
  final GitVariables gitVariables;
  @override
  final int maxLanguageCount;
  final Set<BabelSupportedLocales> _languages;
  @override
  @BabelSupportedLocalesJsonConverter()
  Set<BabelSupportedLocales> get languages {
    if (_languages is EqualUnmodifiableSetView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_languages);
  }

  @override
  final String downloadLink;
  final Map<String, String> _referenceArbMap;
  @override
  Map<String, String> get referenceArbMap {
    if (_referenceArbMap is EqualUnmodifiableMapView) return _referenceArbMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_referenceArbMap);
  }

  @override
  final ProjectCacheMap projectCacheMap;
  @override
  final TranslationPayloadInfo cacheMapTranslationPayloadInfo;
  @override
  final FilesVerification filesVerificationState;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenerateFlowState.gotTargetFiles(accountApiKey: $accountApiKey, directoryPath: $directoryPath, inputedByUserLocale: $inputedByUserLocale, client: $client, yamlInfo: $yamlInfo, gitVariables: $gitVariables, maxLanguageCount: $maxLanguageCount, languages: $languages, downloadLink: $downloadLink, referenceArbMap: $referenceArbMap, projectCacheMap: $projectCacheMap, cacheMapTranslationPayloadInfo: $cacheMapTranslationPayloadInfo, filesVerificationState: $filesVerificationState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowGotTargetFilesImpl &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.inputedByUserLocale, inputedByUserLocale) ||
                other.inputedByUserLocale == inputedByUserLocale) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo) &&
            (identical(other.gitVariables, gitVariables) ||
                other.gitVariables == gitVariables) &&
            (identical(other.maxLanguageCount, maxLanguageCount) ||
                other.maxLanguageCount == maxLanguageCount) &&
            const DeepCollectionEquality().equals(
              other._languages,
              _languages,
            ) &&
            (identical(other.downloadLink, downloadLink) ||
                other.downloadLink == downloadLink) &&
            const DeepCollectionEquality().equals(
              other._referenceArbMap,
              _referenceArbMap,
            ) &&
            (identical(other.projectCacheMap, projectCacheMap) ||
                other.projectCacheMap == projectCacheMap) &&
            (identical(
                  other.cacheMapTranslationPayloadInfo,
                  cacheMapTranslationPayloadInfo,
                ) ||
                other.cacheMapTranslationPayloadInfo ==
                    cacheMapTranslationPayloadInfo) &&
            (identical(other.filesVerificationState, filesVerificationState) ||
                other.filesVerificationState == filesVerificationState));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accountApiKey,
    directoryPath,
    inputedByUserLocale,
    client,
    yamlInfo,
    gitVariables,
    maxLanguageCount,
    const DeepCollectionEquality().hash(_languages),
    downloadLink,
    const DeepCollectionEquality().hash(_referenceArbMap),
    projectCacheMap,
    cacheMapTranslationPayloadInfo,
    filesVerificationState,
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowGotTargetFilesImplCopyWith<_$GenerateFlowGotTargetFilesImpl>
  get copyWith => __$$GenerateFlowGotTargetFilesImplCopyWithImpl<
    _$GenerateFlowGotTargetFilesImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    gotAppLanguages,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )
    downloadReferenceArb,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )
    projectCacheMap,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    resolvedProjectCacheTranslation,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )
    gotTargetFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )
    gotL10nProjectConfig,
  }) {
    return gotTargetFiles(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitVariables,
      maxLanguageCount,
      languages,
      downloadLink,
      referenceArbMap,
      this.projectCacheMap,
      cacheMapTranslationPayloadInfo,
      filesVerificationState,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
  }) {
    return gotTargetFiles?.call(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitVariables,
      maxLanguageCount,
      languages,
      downloadLink,
      referenceArbMap,
      this.projectCacheMap,
      cacheMapTranslationPayloadInfo,
      filesVerificationState,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (gotTargetFiles != null) {
      return gotTargetFiles(
        accountApiKey,
        directoryPath,
        inputedByUserLocale,
        client,
        yamlInfo,
        gitVariables,
        maxLanguageCount,
        languages,
        downloadLink,
        referenceArbMap,
        this.projectCacheMap,
        cacheMapTranslationPayloadInfo,
        filesVerificationState,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
    required TResult Function(GenerateFlowGotAppLanguages value)
    gotAppLanguages,
    required TResult Function(GenerateFlowDownloadReferenceArb value)
    downloadReferenceArb,
    required TResult Function(GenerateFlowProjectCacheMap value)
    projectCacheMap,
    required TResult Function(GenerateFlowResolvedProjectCacheTranslation value)
    resolvedProjectCacheTranslation,
    required TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(GenerateFlowGotTargetFiles value) gotTargetFiles,
    required TResult Function(GenerateFlowGotL10nProjectConfig value)
    gotL10nProjectConfig,
  }) {
    return gotTargetFiles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult? Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult? Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult? Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult? Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult? Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
  }) {
    return gotTargetFiles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (gotTargetFiles != null) {
      return gotTargetFiles(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowGotTargetFilesImplToJson(this);
  }
}

abstract class GenerateFlowGotTargetFiles extends GenerateFlowState {
  factory GenerateFlowGotTargetFiles({
    required final String accountApiKey,
    required final String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required final BabelSupportedLocales inputedByUserLocale,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitVariables gitVariables,
    required final int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required final Set<BabelSupportedLocales> languages,
    required final String downloadLink,
    required final Map<String, String> referenceArbMap,
    required final ProjectCacheMap projectCacheMap,
    required final TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required final FilesVerification filesVerificationState,
  }) = _$GenerateFlowGotTargetFilesImpl;
  GenerateFlowGotTargetFiles._() : super._();

  factory GenerateFlowGotTargetFiles.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowGotTargetFilesImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get inputedByUserLocale;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitVariables get gitVariables;
  int get maxLanguageCount;
  @BabelSupportedLocalesJsonConverter()
  Set<BabelSupportedLocales> get languages;
  String get downloadLink;
  Map<String, String> get referenceArbMap;
  ProjectCacheMap get projectCacheMap;
  TranslationPayloadInfo get cacheMapTranslationPayloadInfo;
  FilesVerification get filesVerificationState;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowGotTargetFilesImplCopyWith<_$GenerateFlowGotTargetFilesImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowGotL10nProjectConfigImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowGotL10nProjectConfigImplCopyWith(
    _$GenerateFlowGotL10nProjectConfigImpl value,
    $Res Function(_$GenerateFlowGotL10nProjectConfigImpl) then,
  ) = __$$GenerateFlowGotL10nProjectConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    BabelSupportedLocales inputedByUserLocale,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitVariables gitVariables,
    int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter() Set<BabelSupportedLocales> languages,
    String downloadLink,
    Map<String, String> referenceArbMap,
    ProjectCacheMap projectCacheMap,
    TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    FilesVerification filesVerificationState,
    L10nProjectConfig l10nProjectConfig,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
  $GitVariablesCopyWith<$Res> get gitVariables;
  $TranslationPayloadInfoCopyWith<$Res> get cacheMapTranslationPayloadInfo;
  $FilesVerificationCopyWith<$Res> get filesVerificationState;
  $L10nProjectConfigCopyWith<$Res> get l10nProjectConfig;
}

/// @nodoc
class __$$GenerateFlowGotL10nProjectConfigImplCopyWithImpl<$Res>
    extends
        _$GenerateFlowStateCopyWithImpl<
          $Res,
          _$GenerateFlowGotL10nProjectConfigImpl
        >
    implements _$$GenerateFlowGotL10nProjectConfigImplCopyWith<$Res> {
  __$$GenerateFlowGotL10nProjectConfigImplCopyWithImpl(
    _$GenerateFlowGotL10nProjectConfigImpl _value,
    $Res Function(_$GenerateFlowGotL10nProjectConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? inputedByUserLocale = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitVariables = null,
    Object? maxLanguageCount = null,
    Object? languages = null,
    Object? downloadLink = null,
    Object? referenceArbMap = null,
    Object? projectCacheMap = null,
    Object? cacheMapTranslationPayloadInfo = null,
    Object? filesVerificationState = null,
    Object? l10nProjectConfig = null,
  }) {
    return _then(
      _$GenerateFlowGotL10nProjectConfigImpl(
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        inputedByUserLocale:
            null == inputedByUserLocale
                ? _value.inputedByUserLocale
                : inputedByUserLocale // ignore: cast_nullable_to_non_nullable
                    as BabelSupportedLocales,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitVariables:
            null == gitVariables
                ? _value.gitVariables
                : gitVariables // ignore: cast_nullable_to_non_nullable
                    as GitVariables,
        maxLanguageCount:
            null == maxLanguageCount
                ? _value.maxLanguageCount
                : maxLanguageCount // ignore: cast_nullable_to_non_nullable
                    as int,
        languages:
            null == languages
                ? _value._languages
                : languages // ignore: cast_nullable_to_non_nullable
                    as Set<BabelSupportedLocales>,
        downloadLink:
            null == downloadLink
                ? _value.downloadLink
                : downloadLink // ignore: cast_nullable_to_non_nullable
                    as String,
        referenceArbMap:
            null == referenceArbMap
                ? _value._referenceArbMap
                : referenceArbMap // ignore: cast_nullable_to_non_nullable
                    as Map<String, String>,
        projectCacheMap:
            null == projectCacheMap
                ? _value.projectCacheMap
                : projectCacheMap // ignore: cast_nullable_to_non_nullable
                    as ProjectCacheMap,
        cacheMapTranslationPayloadInfo:
            null == cacheMapTranslationPayloadInfo
                ? _value.cacheMapTranslationPayloadInfo
                : cacheMapTranslationPayloadInfo // ignore: cast_nullable_to_non_nullable
                    as TranslationPayloadInfo,
        filesVerificationState:
            null == filesVerificationState
                ? _value.filesVerificationState
                : filesVerificationState // ignore: cast_nullable_to_non_nullable
                    as FilesVerification,
        l10nProjectConfig:
            null == l10nProjectConfig
                ? _value.l10nProjectConfig
                : l10nProjectConfig // ignore: cast_nullable_to_non_nullable
                    as L10nProjectConfig,
      ),
    );
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GitVariablesCopyWith<$Res> get gitVariables {
    return $GitVariablesCopyWith<$Res>(_value.gitVariables, (value) {
      return _then(_value.copyWith(gitVariables: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TranslationPayloadInfoCopyWith<$Res> get cacheMapTranslationPayloadInfo {
    return $TranslationPayloadInfoCopyWith<$Res>(
      _value.cacheMapTranslationPayloadInfo,
      (value) {
        return _then(_value.copyWith(cacheMapTranslationPayloadInfo: value));
      },
    );
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FilesVerificationCopyWith<$Res> get filesVerificationState {
    return $FilesVerificationCopyWith<$Res>(_value.filesVerificationState, (
      value,
    ) {
      return _then(_value.copyWith(filesVerificationState: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $L10nProjectConfigCopyWith<$Res> get l10nProjectConfig {
    return $L10nProjectConfigCopyWith<$Res>(_value.l10nProjectConfig, (value) {
      return _then(_value.copyWith(l10nProjectConfig: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateFlowGotL10nProjectConfigImpl
    extends GenerateFlowGotL10nProjectConfig {
  _$GenerateFlowGotL10nProjectConfigImpl({
    required this.accountApiKey,
    required this.directoryPath,
    @BabelSupportedLocalesJsonConverter() required this.inputedByUserLocale,
    required this.client,
    required this.yamlInfo,
    required this.gitVariables,
    required this.maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required final Set<BabelSupportedLocales> languages,
    required this.downloadLink,
    required final Map<String, String> referenceArbMap,
    required this.projectCacheMap,
    required this.cacheMapTranslationPayloadInfo,
    required this.filesVerificationState,
    required this.l10nProjectConfig,
    final String? $type,
  }) : _languages = languages,
       _referenceArbMap = referenceArbMap,
       $type = $type ?? 'gotL10nProjectConfig',
       super._();

  factory _$GenerateFlowGotL10nProjectConfigImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$GenerateFlowGotL10nProjectConfigImplFromJson(json);

  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  final BabelSupportedLocales inputedByUserLocale;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;
  @override
  final GitVariables gitVariables;
  @override
  final int maxLanguageCount;
  final Set<BabelSupportedLocales> _languages;
  @override
  @BabelSupportedLocalesJsonConverter()
  Set<BabelSupportedLocales> get languages {
    if (_languages is EqualUnmodifiableSetView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_languages);
  }

  @override
  final String downloadLink;
  final Map<String, String> _referenceArbMap;
  @override
  Map<String, String> get referenceArbMap {
    if (_referenceArbMap is EqualUnmodifiableMapView) return _referenceArbMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_referenceArbMap);
  }

  @override
  final ProjectCacheMap projectCacheMap;
  @override
  final TranslationPayloadInfo cacheMapTranslationPayloadInfo;
  @override
  final FilesVerification filesVerificationState;
  @override
  final L10nProjectConfig l10nProjectConfig;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenerateFlowState.gotL10nProjectConfig(accountApiKey: $accountApiKey, directoryPath: $directoryPath, inputedByUserLocale: $inputedByUserLocale, client: $client, yamlInfo: $yamlInfo, gitVariables: $gitVariables, maxLanguageCount: $maxLanguageCount, languages: $languages, downloadLink: $downloadLink, referenceArbMap: $referenceArbMap, projectCacheMap: $projectCacheMap, cacheMapTranslationPayloadInfo: $cacheMapTranslationPayloadInfo, filesVerificationState: $filesVerificationState, l10nProjectConfig: $l10nProjectConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowGotL10nProjectConfigImpl &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.inputedByUserLocale, inputedByUserLocale) ||
                other.inputedByUserLocale == inputedByUserLocale) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo) &&
            (identical(other.gitVariables, gitVariables) ||
                other.gitVariables == gitVariables) &&
            (identical(other.maxLanguageCount, maxLanguageCount) ||
                other.maxLanguageCount == maxLanguageCount) &&
            const DeepCollectionEquality().equals(
              other._languages,
              _languages,
            ) &&
            (identical(other.downloadLink, downloadLink) ||
                other.downloadLink == downloadLink) &&
            const DeepCollectionEquality().equals(
              other._referenceArbMap,
              _referenceArbMap,
            ) &&
            (identical(other.projectCacheMap, projectCacheMap) ||
                other.projectCacheMap == projectCacheMap) &&
            (identical(
                  other.cacheMapTranslationPayloadInfo,
                  cacheMapTranslationPayloadInfo,
                ) ||
                other.cacheMapTranslationPayloadInfo ==
                    cacheMapTranslationPayloadInfo) &&
            (identical(other.filesVerificationState, filesVerificationState) ||
                other.filesVerificationState == filesVerificationState) &&
            (identical(other.l10nProjectConfig, l10nProjectConfig) ||
                other.l10nProjectConfig == l10nProjectConfig));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accountApiKey,
    directoryPath,
    inputedByUserLocale,
    client,
    yamlInfo,
    gitVariables,
    maxLanguageCount,
    const DeepCollectionEquality().hash(_languages),
    downloadLink,
    const DeepCollectionEquality().hash(_referenceArbMap),
    projectCacheMap,
    cacheMapTranslationPayloadInfo,
    filesVerificationState,
    l10nProjectConfig,
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowGotL10nProjectConfigImplCopyWith<
    _$GenerateFlowGotL10nProjectConfigImpl
  >
  get copyWith => __$$GenerateFlowGotL10nProjectConfigImplCopyWithImpl<
    _$GenerateFlowGotL10nProjectConfigImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    gotAppLanguages,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )
    downloadReferenceArb,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )
    projectCacheMap,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    resolvedProjectCacheTranslation,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )
    gotTargetFiles,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )
    gotL10nProjectConfig,
  }) {
    return gotL10nProjectConfig(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitVariables,
      maxLanguageCount,
      languages,
      downloadLink,
      referenceArbMap,
      this.projectCacheMap,
      cacheMapTranslationPayloadInfo,
      filesVerificationState,
      l10nProjectConfig,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
  }) {
    return gotL10nProjectConfig?.call(
      accountApiKey,
      directoryPath,
      inputedByUserLocale,
      client,
      yamlInfo,
      gitVariables,
      maxLanguageCount,
      languages,
      downloadLink,
      referenceArbMap,
      this.projectCacheMap,
      cacheMapTranslationPayloadInfo,
      filesVerificationState,
      l10nProjectConfig,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
    )?
    initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    gotAppLanguages,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
    )?
    downloadReferenceArb,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
    )?
    projectCacheMap,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    resolvedProjectCacheTranslation,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    )?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
    )?
    gotTargetFiles,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      @BabelSupportedLocalesJsonConverter()
      BabelSupportedLocales inputedByUserLocale,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      int maxLanguageCount,
      @BabelSupportedLocalesJsonConverter()
      Set<BabelSupportedLocales> languages,
      String downloadLink,
      Map<String, String> referenceArbMap,
      ProjectCacheMap projectCacheMap,
      TranslationPayloadInfo cacheMapTranslationPayloadInfo,
      FilesVerification filesVerificationState,
      L10nProjectConfig l10nProjectConfig,
    )?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (gotL10nProjectConfig != null) {
      return gotL10nProjectConfig(
        accountApiKey,
        directoryPath,
        inputedByUserLocale,
        client,
        yamlInfo,
        gitVariables,
        maxLanguageCount,
        languages,
        downloadLink,
        referenceArbMap,
        this.projectCacheMap,
        cacheMapTranslationPayloadInfo,
        filesVerificationState,
        l10nProjectConfig,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
    required TResult Function(GenerateFlowGotAppLanguages value)
    gotAppLanguages,
    required TResult Function(GenerateFlowDownloadReferenceArb value)
    downloadReferenceArb,
    required TResult Function(GenerateFlowProjectCacheMap value)
    projectCacheMap,
    required TResult Function(GenerateFlowResolvedProjectCacheTranslation value)
    resolvedProjectCacheTranslation,
    required TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)
    ensuredTheresNoStaticErrorOnDartFiles,
    required TResult Function(GenerateFlowGotTargetFiles value) gotTargetFiles,
    required TResult Function(GenerateFlowGotL10nProjectConfig value)
    gotL10nProjectConfig,
  }) {
    return gotL10nProjectConfig(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult? Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult? Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult? Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult? Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult? Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult? Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
  }) {
    return gotL10nProjectConfig?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(GenerateFlowGotAppLanguages value)? gotAppLanguages,
    TResult Function(GenerateFlowDownloadReferenceArb value)?
    downloadReferenceArb,
    TResult Function(GenerateFlowProjectCacheMap value)? projectCacheMap,
    TResult Function(GenerateFlowResolvedProjectCacheTranslation value)?
    resolvedProjectCacheTranslation,
    TResult Function(GenerateFlowEnsuredNoStaticErrorOnDartFiles value)?
    ensuredTheresNoStaticErrorOnDartFiles,
    TResult Function(GenerateFlowGotTargetFiles value)? gotTargetFiles,
    TResult Function(GenerateFlowGotL10nProjectConfig value)?
    gotL10nProjectConfig,
    required TResult orElse(),
  }) {
    if (gotL10nProjectConfig != null) {
      return gotL10nProjectConfig(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowGotL10nProjectConfigImplToJson(this);
  }
}

abstract class GenerateFlowGotL10nProjectConfig extends GenerateFlowState {
  factory GenerateFlowGotL10nProjectConfig({
    required final String accountApiKey,
    required final String directoryPath,
    @BabelSupportedLocalesJsonConverter()
    required final BabelSupportedLocales inputedByUserLocale,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitVariables gitVariables,
    required final int maxLanguageCount,
    @BabelSupportedLocalesJsonConverter()
    required final Set<BabelSupportedLocales> languages,
    required final String downloadLink,
    required final Map<String, String> referenceArbMap,
    required final ProjectCacheMap projectCacheMap,
    required final TranslationPayloadInfo cacheMapTranslationPayloadInfo,
    required final FilesVerification filesVerificationState,
    required final L10nProjectConfig l10nProjectConfig,
  }) = _$GenerateFlowGotL10nProjectConfigImpl;
  GenerateFlowGotL10nProjectConfig._() : super._();

  factory GenerateFlowGotL10nProjectConfig.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowGotL10nProjectConfigImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  @override
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get inputedByUserLocale;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitVariables get gitVariables;
  int get maxLanguageCount;
  @BabelSupportedLocalesJsonConverter()
  Set<BabelSupportedLocales> get languages;
  String get downloadLink;
  Map<String, String> get referenceArbMap;
  ProjectCacheMap get projectCacheMap;
  TranslationPayloadInfo get cacheMapTranslationPayloadInfo;
  FilesVerification get filesVerificationState;
  L10nProjectConfig get l10nProjectConfig;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowGotL10nProjectConfigImplCopyWith<
    _$GenerateFlowGotL10nProjectConfigImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
