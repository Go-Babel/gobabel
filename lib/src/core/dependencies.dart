import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/scripts/arb_migration_related/find_arb_data.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/go_babel_core.dart';

class Dependencies {
  static String get versionId => codeBaseYamlInfo.version.toVersionId;
  static CodeBaseYamlInfo? _codeBaseYamlInfo;
  static CodeBaseYamlInfo get codeBaseYamlInfo => _codeBaseYamlInfo!;
  static set codeBaseYamlInfo(CodeBaseYamlInfo value) {
    _codeBaseYamlInfo = value;
  }

  static GitVariables? _gitVariables;
  static GitVariables get gitVariables => _gitVariables!;
  static set gitVariables(GitVariables value) {
    _gitVariables = value;
  }

  static ArbData? _arbData;
  static ArbData? get arbData => _arbData;
  static set arbData(ArbData? value) {
    _arbData = value;
    if (value != null) {
      final outputClass = value.config.outputClass;
      final String baseRegexIdentifier =
          '($outputClass)'
          // S\s*\.(?:[a-zA-Z0.9()!]|\s)+\.\s*duels
          r'\s*\.(?:[a-zA-Z0.9()!]|\s)+\.\s*';
      _arbKeyRegexIdentifier = baseRegexIdentifier;
    } else {
      _arbKeyRegexIdentifier = null;
    }
  }

  static String? _arbKeyRegexIdentifier;
  static String get arbKeyRegexIdentifier => _arbKeyRegexIdentifier!;
  static List<({String sha, DateTime updatedDate})> versionsShas = [];
  static final Set<ChangedPaths> changedPaths = {};
  static final List<BabelSupportedLocales> projectLanguages = [];
  static final Map<L10nKey, L10nValue> newLabelsKeys = {};
  static Map<L10nKey, Set<ContextPath>> get pathAppearancesPerKey =>
      _pathAppearancesPerKey;
  static final Map<L10nKey, Set<ContextPath>> _pathAppearancesPerKey = {};
  static final Set<BabelFunctionDeclaration> allDeclarationFunctions = {};
  static Map<
    LanguageCode,
    Map<CountryCode, Map<TranslationKey, TranslationContent>>
  >
  madeTranslations = {};

  static final Client client = Client('http://$ipAddress:8080/');

  static void addLabelContextPath(L10nKey key, ContextPath contextPaths) {
    if (_pathAppearancesPerKey.containsKey(key)) {
      _pathAppearancesPerKey[key]!.add(contextPaths);
    } else {
      _pathAppearancesPerKey[key] = {contextPaths};
    }
  }

  Dependencies.resetAll() {
    arbData = null;
    _codeBaseYamlInfo = null;
    projectLanguages.clear();
    changedPaths.clear();
    versionsShas.clear();
    newLabelsKeys.clear();
    _pathAppearancesPerKey.clear();
    allDeclarationFunctions.clear();
    madeTranslations.clear();
  }
}

const ipAddress = 'localhost';

extension on String {
  String get toVersionId {
    return replaceAll(' ', '')
        .replaceAll('.', 'd')
        .replaceAll('_', 'u')
        .replaceAll('+', 'b')
        .replaceAll(RegExp(r'\W'), 'l');
  }
}
