// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_flow_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerateFlowInitialImpl _$$GenerateFlowInitialImplFromJson(
  Map<String, dynamic> json,
) => _$GenerateFlowInitialImpl(
  accountApiKey: json['accountApiKey'] as String,
  directoryPath: json['directoryPath'] as String,
  inputedByUserLocale: const BabelSupportedLocalesJsonConverter().fromJson(
    json['inputedByUserLocale'] as Map<String, dynamic>,
  ),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$GenerateFlowInitialImplToJson(
  _$GenerateFlowInitialImpl instance,
) => <String, dynamic>{
  'accountApiKey': instance.accountApiKey,
  'directoryPath': instance.directoryPath,
  'inputedByUserLocale': const BabelSupportedLocalesJsonConverter().toJson(
    instance.inputedByUserLocale,
  ),
  'runtimeType': instance.$type,
};

_$GenerateFlowCreatedClientImpl _$$GenerateFlowCreatedClientImplFromJson(
  Map<String, dynamic> json,
) => _$GenerateFlowCreatedClientImpl(
  accountApiKey: json['accountApiKey'] as String,
  directoryPath: json['directoryPath'] as String,
  inputedByUserLocale: const BabelSupportedLocalesJsonConverter().fromJson(
    json['inputedByUserLocale'] as Map<String, dynamic>,
  ),
  client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$GenerateFlowCreatedClientImplToJson(
  _$GenerateFlowCreatedClientImpl instance,
) => <String, dynamic>{
  'accountApiKey': instance.accountApiKey,
  'directoryPath': instance.directoryPath,
  'inputedByUserLocale': const BabelSupportedLocalesJsonConverter().toJson(
    instance.inputedByUserLocale,
  ),
  'client': instance.client,
  'runtimeType': instance.$type,
};

_$GenerateFlowEnsureGitImpl _$$GenerateFlowEnsureGitImplFromJson(
  Map<String, dynamic> json,
) => _$GenerateFlowEnsureGitImpl(
  accountApiKey: json['accountApiKey'] as String,
  directoryPath: json['directoryPath'] as String,
  inputedByUserLocale: const BabelSupportedLocalesJsonConverter().fromJson(
    json['inputedByUserLocale'] as Map<String, dynamic>,
  ),
  client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$GenerateFlowEnsureGitImplToJson(
  _$GenerateFlowEnsureGitImpl instance,
) => <String, dynamic>{
  'accountApiKey': instance.accountApiKey,
  'directoryPath': instance.directoryPath,
  'inputedByUserLocale': const BabelSupportedLocalesJsonConverter().toJson(
    instance.inputedByUserLocale,
  ),
  'client': instance.client,
  'runtimeType': instance.$type,
};

_$GenerateFlowGotCodeBaseYamlImpl _$$GenerateFlowGotCodeBaseYamlImplFromJson(
  Map<String, dynamic> json,
) => _$GenerateFlowGotCodeBaseYamlImpl(
  accountApiKey: json['accountApiKey'] as String,
  directoryPath: json['directoryPath'] as String,
  inputedByUserLocale: const BabelSupportedLocalesJsonConverter().fromJson(
    json['inputedByUserLocale'] as Map<String, dynamic>,
  ),
  client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
  yamlInfo: CodeBaseYamlInfo.fromJson(json['yamlInfo'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$GenerateFlowGotCodeBaseYamlImplToJson(
  _$GenerateFlowGotCodeBaseYamlImpl instance,
) => <String, dynamic>{
  'accountApiKey': instance.accountApiKey,
  'directoryPath': instance.directoryPath,
  'inputedByUserLocale': const BabelSupportedLocalesJsonConverter().toJson(
    instance.inputedByUserLocale,
  ),
  'client': instance.client,
  'yamlInfo': instance.yamlInfo,
  'runtimeType': instance.$type,
};

_$GenerateFlowGotGitUserImpl _$$GenerateFlowGotGitUserImplFromJson(
  Map<String, dynamic> json,
) => _$GenerateFlowGotGitUserImpl(
  accountApiKey: json['accountApiKey'] as String,
  directoryPath: json['directoryPath'] as String,
  inputedByUserLocale: const BabelSupportedLocalesJsonConverter().fromJson(
    json['inputedByUserLocale'] as Map<String, dynamic>,
  ),
  client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
  yamlInfo: CodeBaseYamlInfo.fromJson(json['yamlInfo'] as Map<String, dynamic>),
  gitUser: GitUser.fromJson(json['gitUser'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$GenerateFlowGotGitUserImplToJson(
  _$GenerateFlowGotGitUserImpl instance,
) => <String, dynamic>{
  'accountApiKey': instance.accountApiKey,
  'directoryPath': instance.directoryPath,
  'inputedByUserLocale': const BabelSupportedLocalesJsonConverter().toJson(
    instance.inputedByUserLocale,
  ),
  'client': instance.client,
  'yamlInfo': instance.yamlInfo,
  'gitUser': instance.gitUser,
  'runtimeType': instance.$type,
};

_$GenerateFlowGotLastLocalCommitImpl
_$$GenerateFlowGotLastLocalCommitImplFromJson(Map<String, dynamic> json) =>
    _$GenerateFlowGotLastLocalCommitImpl(
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      inputedByUserLocale: const BabelSupportedLocalesJsonConverter().fromJson(
        json['inputedByUserLocale'] as Map<String, dynamic>,
      ),
      client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
      yamlInfo: CodeBaseYamlInfo.fromJson(
        json['yamlInfo'] as Map<String, dynamic>,
      ),
      gitUser: GitUser.fromJson(json['gitUser'] as Map<String, dynamic>),
      previousCommit: GitCommit.fromJson(
        json['previousCommit'] as Map<String, dynamic>,
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GenerateFlowGotLastLocalCommitImplToJson(
  _$GenerateFlowGotLastLocalCommitImpl instance,
) => <String, dynamic>{
  'accountApiKey': instance.accountApiKey,
  'directoryPath': instance.directoryPath,
  'inputedByUserLocale': const BabelSupportedLocalesJsonConverter().toJson(
    instance.inputedByUserLocale,
  ),
  'client': instance.client,
  'yamlInfo': instance.yamlInfo,
  'gitUser': instance.gitUser,
  'previousCommit': instance.previousCommit,
  'runtimeType': instance.$type,
};

_$GenerateFlowGotProjectOriginUrlImpl
_$$GenerateFlowGotProjectOriginUrlImplFromJson(Map<String, dynamic> json) =>
    _$GenerateFlowGotProjectOriginUrlImpl(
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      inputedByUserLocale: const BabelSupportedLocalesJsonConverter().fromJson(
        json['inputedByUserLocale'] as Map<String, dynamic>,
      ),
      client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
      yamlInfo: CodeBaseYamlInfo.fromJson(
        json['yamlInfo'] as Map<String, dynamic>,
      ),
      gitUser: GitUser.fromJson(json['gitUser'] as Map<String, dynamic>),
      previousCommit: GitCommit.fromJson(
        json['previousCommit'] as Map<String, dynamic>,
      ),
      projectOriginUrl: json['projectOriginUrl'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GenerateFlowGotProjectOriginUrlImplToJson(
  _$GenerateFlowGotProjectOriginUrlImpl instance,
) => <String, dynamic>{
  'accountApiKey': instance.accountApiKey,
  'directoryPath': instance.directoryPath,
  'inputedByUserLocale': const BabelSupportedLocalesJsonConverter().toJson(
    instance.inputedByUserLocale,
  ),
  'client': instance.client,
  'yamlInfo': instance.yamlInfo,
  'gitUser': instance.gitUser,
  'previousCommit': instance.previousCommit,
  'projectOriginUrl': instance.projectOriginUrl,
  'runtimeType': instance.$type,
};

_$GenerateFlowGotGitVariablesImpl _$$GenerateFlowGotGitVariablesImplFromJson(
  Map<String, dynamic> json,
) => _$GenerateFlowGotGitVariablesImpl(
  accountApiKey: json['accountApiKey'] as String,
  directoryPath: json['directoryPath'] as String,
  inputedByUserLocale: const BabelSupportedLocalesJsonConverter().fromJson(
    json['inputedByUserLocale'] as Map<String, dynamic>,
  ),
  client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
  yamlInfo: CodeBaseYamlInfo.fromJson(json['yamlInfo'] as Map<String, dynamic>),
  gitVariables: GitVariables.fromJson(
    json['gitVariables'] as Map<String, dynamic>,
  ),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$GenerateFlowGotGitVariablesImplToJson(
  _$GenerateFlowGotGitVariablesImpl instance,
) => <String, dynamic>{
  'accountApiKey': instance.accountApiKey,
  'directoryPath': instance.directoryPath,
  'inputedByUserLocale': const BabelSupportedLocalesJsonConverter().toJson(
    instance.inputedByUserLocale,
  ),
  'client': instance.client,
  'yamlInfo': instance.yamlInfo,
  'gitVariables': instance.gitVariables,
  'runtimeType': instance.$type,
};

_$GenerateFlowGotAppLanguagesImpl _$$GenerateFlowGotAppLanguagesImplFromJson(
  Map<String, dynamic> json,
) => _$GenerateFlowGotAppLanguagesImpl(
  accountApiKey: json['accountApiKey'] as String,
  directoryPath: json['directoryPath'] as String,
  inputedByUserLocale: const BabelSupportedLocalesJsonConverter().fromJson(
    json['inputedByUserLocale'] as Map<String, dynamic>,
  ),
  client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
  yamlInfo: CodeBaseYamlInfo.fromJson(json['yamlInfo'] as Map<String, dynamic>),
  gitVariables: GitVariables.fromJson(
    json['gitVariables'] as Map<String, dynamic>,
  ),
  maxLanguageCount: (json['maxLanguageCount'] as num).toInt(),
  languages:
      (json['languages'] as List<dynamic>)
          .map(
            (e) => const BabelSupportedLocalesJsonConverter().fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toSet(),
  downloadLink: json['downloadLink'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$GenerateFlowGotAppLanguagesImplToJson(
  _$GenerateFlowGotAppLanguagesImpl instance,
) => <String, dynamic>{
  'accountApiKey': instance.accountApiKey,
  'directoryPath': instance.directoryPath,
  'inputedByUserLocale': const BabelSupportedLocalesJsonConverter().toJson(
    instance.inputedByUserLocale,
  ),
  'client': instance.client,
  'yamlInfo': instance.yamlInfo,
  'gitVariables': instance.gitVariables,
  'maxLanguageCount': instance.maxLanguageCount,
  'languages':
      instance.languages
          .map(const BabelSupportedLocalesJsonConverter().toJson)
          .toList(),
  'downloadLink': instance.downloadLink,
  'runtimeType': instance.$type,
};

_$GenerateFlowDownloadReferenceArbImpl
_$$GenerateFlowDownloadReferenceArbImplFromJson(Map<String, dynamic> json) =>
    _$GenerateFlowDownloadReferenceArbImpl(
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      inputedByUserLocale: const BabelSupportedLocalesJsonConverter().fromJson(
        json['inputedByUserLocale'] as Map<String, dynamic>,
      ),
      client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
      yamlInfo: CodeBaseYamlInfo.fromJson(
        json['yamlInfo'] as Map<String, dynamic>,
      ),
      gitVariables: GitVariables.fromJson(
        json['gitVariables'] as Map<String, dynamic>,
      ),
      maxLanguageCount: (json['maxLanguageCount'] as num).toInt(),
      languages:
          (json['languages'] as List<dynamic>)
              .map(
                (e) => const BabelSupportedLocalesJsonConverter().fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toSet(),
      downloadLink: json['downloadLink'] as String,
      referenceArbMap: Map<String, String>.from(json['referenceArbMap'] as Map),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GenerateFlowDownloadReferenceArbImplToJson(
  _$GenerateFlowDownloadReferenceArbImpl instance,
) => <String, dynamic>{
  'accountApiKey': instance.accountApiKey,
  'directoryPath': instance.directoryPath,
  'inputedByUserLocale': const BabelSupportedLocalesJsonConverter().toJson(
    instance.inputedByUserLocale,
  ),
  'client': instance.client,
  'yamlInfo': instance.yamlInfo,
  'gitVariables': instance.gitVariables,
  'maxLanguageCount': instance.maxLanguageCount,
  'languages':
      instance.languages
          .map(const BabelSupportedLocalesJsonConverter().toJson)
          .toList(),
  'downloadLink': instance.downloadLink,
  'referenceArbMap': instance.referenceArbMap,
  'runtimeType': instance.$type,
};

_$GenerateFlowProjectCacheMapImpl _$$GenerateFlowProjectCacheMapImplFromJson(
  Map<String, dynamic> json,
) => _$GenerateFlowProjectCacheMapImpl(
  accountApiKey: json['accountApiKey'] as String,
  directoryPath: json['directoryPath'] as String,
  inputedByUserLocale: const BabelSupportedLocalesJsonConverter().fromJson(
    json['inputedByUserLocale'] as Map<String, dynamic>,
  ),
  client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
  yamlInfo: CodeBaseYamlInfo.fromJson(json['yamlInfo'] as Map<String, dynamic>),
  gitVariables: GitVariables.fromJson(
    json['gitVariables'] as Map<String, dynamic>,
  ),
  maxLanguageCount: (json['maxLanguageCount'] as num).toInt(),
  languages:
      (json['languages'] as List<dynamic>)
          .map(
            (e) => const BabelSupportedLocalesJsonConverter().fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toSet(),
  downloadLink: json['downloadLink'] as String,
  referenceArbMap: Map<String, String>.from(json['referenceArbMap'] as Map),
  projectCacheMap: ProjectCacheMap.fromJson(
    json['projectCacheMap'] as Map<String, dynamic>,
  ),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$GenerateFlowProjectCacheMapImplToJson(
  _$GenerateFlowProjectCacheMapImpl instance,
) => <String, dynamic>{
  'accountApiKey': instance.accountApiKey,
  'directoryPath': instance.directoryPath,
  'inputedByUserLocale': const BabelSupportedLocalesJsonConverter().toJson(
    instance.inputedByUserLocale,
  ),
  'client': instance.client,
  'yamlInfo': instance.yamlInfo,
  'gitVariables': instance.gitVariables,
  'maxLanguageCount': instance.maxLanguageCount,
  'languages':
      instance.languages
          .map(const BabelSupportedLocalesJsonConverter().toJson)
          .toList(),
  'downloadLink': instance.downloadLink,
  'referenceArbMap': instance.referenceArbMap,
  'projectCacheMap': instance.projectCacheMap,
  'runtimeType': instance.$type,
};

_$GenerateFlowResolvedProjectCacheTranslationImpl
_$$GenerateFlowResolvedProjectCacheTranslationImplFromJson(
  Map<String, dynamic> json,
) => _$GenerateFlowResolvedProjectCacheTranslationImpl(
  accountApiKey: json['accountApiKey'] as String,
  directoryPath: json['directoryPath'] as String,
  inputedByUserLocale: const BabelSupportedLocalesJsonConverter().fromJson(
    json['inputedByUserLocale'] as Map<String, dynamic>,
  ),
  client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
  yamlInfo: CodeBaseYamlInfo.fromJson(json['yamlInfo'] as Map<String, dynamic>),
  gitVariables: GitVariables.fromJson(
    json['gitVariables'] as Map<String, dynamic>,
  ),
  maxLanguageCount: (json['maxLanguageCount'] as num).toInt(),
  languages:
      (json['languages'] as List<dynamic>)
          .map(
            (e) => const BabelSupportedLocalesJsonConverter().fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toSet(),
  downloadLink: json['downloadLink'] as String,
  referenceArbMap: Map<String, String>.from(json['referenceArbMap'] as Map),
  projectCacheMap: ProjectCacheMap.fromJson(
    json['projectCacheMap'] as Map<String, dynamic>,
  ),
  cacheMapTranslationPayloadInfo: TranslationPayloadInfo.fromJson(
    json['cacheMapTranslationPayloadInfo'] as Map<String, dynamic>,
  ),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$GenerateFlowResolvedProjectCacheTranslationImplToJson(
  _$GenerateFlowResolvedProjectCacheTranslationImpl instance,
) => <String, dynamic>{
  'accountApiKey': instance.accountApiKey,
  'directoryPath': instance.directoryPath,
  'inputedByUserLocale': const BabelSupportedLocalesJsonConverter().toJson(
    instance.inputedByUserLocale,
  ),
  'client': instance.client,
  'yamlInfo': instance.yamlInfo,
  'gitVariables': instance.gitVariables,
  'maxLanguageCount': instance.maxLanguageCount,
  'languages':
      instance.languages
          .map(const BabelSupportedLocalesJsonConverter().toJson)
          .toList(),
  'downloadLink': instance.downloadLink,
  'referenceArbMap': instance.referenceArbMap,
  'projectCacheMap': instance.projectCacheMap,
  'cacheMapTranslationPayloadInfo': instance.cacheMapTranslationPayloadInfo,
  'runtimeType': instance.$type,
};

_$GenerateFlowEnsuredNoStaticErrorOnDartFilesImpl
_$$GenerateFlowEnsuredNoStaticErrorOnDartFilesImplFromJson(
  Map<String, dynamic> json,
) => _$GenerateFlowEnsuredNoStaticErrorOnDartFilesImpl(
  accountApiKey: json['accountApiKey'] as String,
  directoryPath: json['directoryPath'] as String,
  inputedByUserLocale: const BabelSupportedLocalesJsonConverter().fromJson(
    json['inputedByUserLocale'] as Map<String, dynamic>,
  ),
  client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
  yamlInfo: CodeBaseYamlInfo.fromJson(json['yamlInfo'] as Map<String, dynamic>),
  gitVariables: GitVariables.fromJson(
    json['gitVariables'] as Map<String, dynamic>,
  ),
  maxLanguageCount: (json['maxLanguageCount'] as num).toInt(),
  languages:
      (json['languages'] as List<dynamic>)
          .map(
            (e) => const BabelSupportedLocalesJsonConverter().fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toSet(),
  downloadLink: json['downloadLink'] as String,
  referenceArbMap: Map<String, String>.from(json['referenceArbMap'] as Map),
  projectCacheMap: ProjectCacheMap.fromJson(
    json['projectCacheMap'] as Map<String, dynamic>,
  ),
  cacheMapTranslationPayloadInfo: TranslationPayloadInfo.fromJson(
    json['cacheMapTranslationPayloadInfo'] as Map<String, dynamic>,
  ),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$GenerateFlowEnsuredNoStaticErrorOnDartFilesImplToJson(
  _$GenerateFlowEnsuredNoStaticErrorOnDartFilesImpl instance,
) => <String, dynamic>{
  'accountApiKey': instance.accountApiKey,
  'directoryPath': instance.directoryPath,
  'inputedByUserLocale': const BabelSupportedLocalesJsonConverter().toJson(
    instance.inputedByUserLocale,
  ),
  'client': instance.client,
  'yamlInfo': instance.yamlInfo,
  'gitVariables': instance.gitVariables,
  'maxLanguageCount': instance.maxLanguageCount,
  'languages':
      instance.languages
          .map(const BabelSupportedLocalesJsonConverter().toJson)
          .toList(),
  'downloadLink': instance.downloadLink,
  'referenceArbMap': instance.referenceArbMap,
  'projectCacheMap': instance.projectCacheMap,
  'cacheMapTranslationPayloadInfo': instance.cacheMapTranslationPayloadInfo,
  'runtimeType': instance.$type,
};

_$GenerateFlowGotTargetFilesImpl _$$GenerateFlowGotTargetFilesImplFromJson(
  Map<String, dynamic> json,
) => _$GenerateFlowGotTargetFilesImpl(
  accountApiKey: json['accountApiKey'] as String,
  directoryPath: json['directoryPath'] as String,
  inputedByUserLocale: const BabelSupportedLocalesJsonConverter().fromJson(
    json['inputedByUserLocale'] as Map<String, dynamic>,
  ),
  client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
  yamlInfo: CodeBaseYamlInfo.fromJson(json['yamlInfo'] as Map<String, dynamic>),
  gitVariables: GitVariables.fromJson(
    json['gitVariables'] as Map<String, dynamic>,
  ),
  maxLanguageCount: (json['maxLanguageCount'] as num).toInt(),
  languages:
      (json['languages'] as List<dynamic>)
          .map(
            (e) => const BabelSupportedLocalesJsonConverter().fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toSet(),
  downloadLink: json['downloadLink'] as String,
  referenceArbMap: Map<String, String>.from(json['referenceArbMap'] as Map),
  projectCacheMap: ProjectCacheMap.fromJson(
    json['projectCacheMap'] as Map<String, dynamic>,
  ),
  cacheMapTranslationPayloadInfo: TranslationPayloadInfo.fromJson(
    json['cacheMapTranslationPayloadInfo'] as Map<String, dynamic>,
  ),
  filesVerificationState: FilesVerification.fromJson(
    json['filesVerificationState'] as Map<String, dynamic>,
  ),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$GenerateFlowGotTargetFilesImplToJson(
  _$GenerateFlowGotTargetFilesImpl instance,
) => <String, dynamic>{
  'accountApiKey': instance.accountApiKey,
  'directoryPath': instance.directoryPath,
  'inputedByUserLocale': const BabelSupportedLocalesJsonConverter().toJson(
    instance.inputedByUserLocale,
  ),
  'client': instance.client,
  'yamlInfo': instance.yamlInfo,
  'gitVariables': instance.gitVariables,
  'maxLanguageCount': instance.maxLanguageCount,
  'languages':
      instance.languages
          .map(const BabelSupportedLocalesJsonConverter().toJson)
          .toList(),
  'downloadLink': instance.downloadLink,
  'referenceArbMap': instance.referenceArbMap,
  'projectCacheMap': instance.projectCacheMap,
  'cacheMapTranslationPayloadInfo': instance.cacheMapTranslationPayloadInfo,
  'filesVerificationState': instance.filesVerificationState,
  'runtimeType': instance.$type,
};

_$GenerateFlowGotL10nProjectConfigImpl
_$$GenerateFlowGotL10nProjectConfigImplFromJson(Map<String, dynamic> json) =>
    _$GenerateFlowGotL10nProjectConfigImpl(
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      inputedByUserLocale: const BabelSupportedLocalesJsonConverter().fromJson(
        json['inputedByUserLocale'] as Map<String, dynamic>,
      ),
      client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
      yamlInfo: CodeBaseYamlInfo.fromJson(
        json['yamlInfo'] as Map<String, dynamic>,
      ),
      gitVariables: GitVariables.fromJson(
        json['gitVariables'] as Map<String, dynamic>,
      ),
      maxLanguageCount: (json['maxLanguageCount'] as num).toInt(),
      languages:
          (json['languages'] as List<dynamic>)
              .map(
                (e) => const BabelSupportedLocalesJsonConverter().fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toSet(),
      downloadLink: json['downloadLink'] as String,
      referenceArbMap: Map<String, String>.from(json['referenceArbMap'] as Map),
      projectCacheMap: ProjectCacheMap.fromJson(
        json['projectCacheMap'] as Map<String, dynamic>,
      ),
      cacheMapTranslationPayloadInfo: TranslationPayloadInfo.fromJson(
        json['cacheMapTranslationPayloadInfo'] as Map<String, dynamic>,
      ),
      filesVerificationState: FilesVerification.fromJson(
        json['filesVerificationState'] as Map<String, dynamic>,
      ),
      l10nProjectConfig: L10nProjectConfig.fromJson(
        json['l10nProjectConfig'] as Map<String, dynamic>,
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GenerateFlowGotL10nProjectConfigImplToJson(
  _$GenerateFlowGotL10nProjectConfigImpl instance,
) => <String, dynamic>{
  'accountApiKey': instance.accountApiKey,
  'directoryPath': instance.directoryPath,
  'inputedByUserLocale': const BabelSupportedLocalesJsonConverter().toJson(
    instance.inputedByUserLocale,
  ),
  'client': instance.client,
  'yamlInfo': instance.yamlInfo,
  'gitVariables': instance.gitVariables,
  'maxLanguageCount': instance.maxLanguageCount,
  'languages':
      instance.languages
          .map(const BabelSupportedLocalesJsonConverter().toJson)
          .toList(),
  'downloadLink': instance.downloadLink,
  'referenceArbMap': instance.referenceArbMap,
  'projectCacheMap': instance.projectCacheMap,
  'cacheMapTranslationPayloadInfo': instance.cacheMapTranslationPayloadInfo,
  'filesVerificationState': instance.filesVerificationState,
  'l10nProjectConfig': instance.l10nProjectConfig,
  'runtimeType': instance.$type,
};

_$GenerateFlowMappedProjectArbDataImpl
_$$GenerateFlowMappedProjectArbDataImplFromJson(Map<String, dynamic> json) =>
    _$GenerateFlowMappedProjectArbDataImpl(
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      inputedByUserLocale: const BabelSupportedLocalesJsonConverter().fromJson(
        json['inputedByUserLocale'] as Map<String, dynamic>,
      ),
      client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
      yamlInfo: CodeBaseYamlInfo.fromJson(
        json['yamlInfo'] as Map<String, dynamic>,
      ),
      gitVariables: GitVariables.fromJson(
        json['gitVariables'] as Map<String, dynamic>,
      ),
      maxLanguageCount: (json['maxLanguageCount'] as num).toInt(),
      languages:
          (json['languages'] as List<dynamic>)
              .map(
                (e) => const BabelSupportedLocalesJsonConverter().fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toSet(),
      downloadLink: json['downloadLink'] as String,
      referenceArbMap: Map<String, String>.from(json['referenceArbMap'] as Map),
      projectCacheMap: ProjectCacheMap.fromJson(
        json['projectCacheMap'] as Map<String, dynamic>,
      ),
      cacheMapTranslationPayloadInfo: TranslationPayloadInfo.fromJson(
        json['cacheMapTranslationPayloadInfo'] as Map<String, dynamic>,
      ),
      filesVerificationState: FilesVerification.fromJson(
        json['filesVerificationState'] as Map<String, dynamic>,
      ),
      projectArbData: ArbDataState.fromJson(
        json['projectArbData'] as Map<String, dynamic>,
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GenerateFlowMappedProjectArbDataImplToJson(
  _$GenerateFlowMappedProjectArbDataImpl instance,
) => <String, dynamic>{
  'accountApiKey': instance.accountApiKey,
  'directoryPath': instance.directoryPath,
  'inputedByUserLocale': const BabelSupportedLocalesJsonConverter().toJson(
    instance.inputedByUserLocale,
  ),
  'client': instance.client,
  'yamlInfo': instance.yamlInfo,
  'gitVariables': instance.gitVariables,
  'maxLanguageCount': instance.maxLanguageCount,
  'languages':
      instance.languages
          .map(const BabelSupportedLocalesJsonConverter().toJson)
          .toList(),
  'downloadLink': instance.downloadLink,
  'referenceArbMap': instance.referenceArbMap,
  'projectCacheMap': instance.projectCacheMap,
  'cacheMapTranslationPayloadInfo': instance.cacheMapTranslationPayloadInfo,
  'filesVerificationState': instance.filesVerificationState,
  'projectArbData': instance.projectArbData,
  'runtimeType': instance.$type,
};

_$GenerateFlowResolvedProjectArbTranslationPayloadImpl
_$$GenerateFlowResolvedProjectArbTranslationPayloadImplFromJson(
  Map<String, dynamic> json,
) => _$GenerateFlowResolvedProjectArbTranslationPayloadImpl(
  accountApiKey: json['accountApiKey'] as String,
  directoryPath: json['directoryPath'] as String,
  inputedByUserLocale: const BabelSupportedLocalesJsonConverter().fromJson(
    json['inputedByUserLocale'] as Map<String, dynamic>,
  ),
  client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
  yamlInfo: CodeBaseYamlInfo.fromJson(json['yamlInfo'] as Map<String, dynamic>),
  gitVariables: GitVariables.fromJson(
    json['gitVariables'] as Map<String, dynamic>,
  ),
  maxLanguageCount: (json['maxLanguageCount'] as num).toInt(),
  languages:
      (json['languages'] as List<dynamic>)
          .map(
            (e) => const BabelSupportedLocalesJsonConverter().fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toSet(),
  downloadLink: json['downloadLink'] as String,
  referenceArbMap: Map<String, String>.from(json['referenceArbMap'] as Map),
  projectCacheMap: ProjectCacheMap.fromJson(
    json['projectCacheMap'] as Map<String, dynamic>,
  ),
  cacheMapTranslationPayloadInfo: TranslationPayloadInfo.fromJson(
    json['cacheMapTranslationPayloadInfo'] as Map<String, dynamic>,
  ),
  filesVerificationState: FilesVerification.fromJson(
    json['filesVerificationState'] as Map<String, dynamic>,
  ),
  projectArbData: ArbDataState.fromJson(
    json['projectArbData'] as Map<String, dynamic>,
  ),
  codebaseArbTranslationPayloadInfo: TranslationPayloadInfo.fromJson(
    json['codebaseArbTranslationPayloadInfo'] as Map<String, dynamic>,
  ),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic>
_$$GenerateFlowResolvedProjectArbTranslationPayloadImplToJson(
  _$GenerateFlowResolvedProjectArbTranslationPayloadImpl instance,
) => <String, dynamic>{
  'accountApiKey': instance.accountApiKey,
  'directoryPath': instance.directoryPath,
  'inputedByUserLocale': const BabelSupportedLocalesJsonConverter().toJson(
    instance.inputedByUserLocale,
  ),
  'client': instance.client,
  'yamlInfo': instance.yamlInfo,
  'gitVariables': instance.gitVariables,
  'maxLanguageCount': instance.maxLanguageCount,
  'languages':
      instance.languages
          .map(const BabelSupportedLocalesJsonConverter().toJson)
          .toList(),
  'downloadLink': instance.downloadLink,
  'referenceArbMap': instance.referenceArbMap,
  'projectCacheMap': instance.projectCacheMap,
  'cacheMapTranslationPayloadInfo': instance.cacheMapTranslationPayloadInfo,
  'filesVerificationState': instance.filesVerificationState,
  'projectArbData': instance.projectArbData,
  'codebaseArbTranslationPayloadInfo':
      instance.codebaseArbTranslationPayloadInfo,
  'runtimeType': instance.$type,
};
