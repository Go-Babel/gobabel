import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel_client/gobabel_client.dart';

class Dependencies {
  static String _versionId = '';
  static String get versionId => _versionId;
  static late CodeBaseYamlInfo _codeBaseYamlInfo;
  static CodeBaseYamlInfo get codeBaseYamlInfo => _codeBaseYamlInfo;
  static set codeBaseYamlInfo(CodeBaseYamlInfo value) {
    _codeBaseYamlInfo = value;
    _versionId = value.version.toVersionId;
  }

  static Map<L10nKey, ({L10nValue key, List<ContextPath> contextPaths})>
  newLabels = {};
  static Map<L10nKey, List<ContextPath>> alreadyExistingLabels = {};
  static Set<BabelFunctionDeclaration> allDeclarationFunctions = {};

  static final Client client = Client('http://$ipAddress:8080/');

  Dependencies.resetAll() {
    newLabels = {};
    alreadyExistingLabels = {};
    allDeclarationFunctions = {};
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
