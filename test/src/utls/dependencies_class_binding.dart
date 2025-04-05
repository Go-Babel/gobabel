import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';

void setDependenciesMock() {
  resetAllDependencies();
  Dependencies.codeBaseYamlInfo = mockCodeBaseYamlInfo;
}

void resetAllDependencies() {
  Dependencies.resetAll();
}

final mockCodeBaseYamlInfo = CodeBaseYamlInfo(
  projectName: 'projectName',
  projectDescription: 'projectDescription',
  version: '1.0.0',
  type: ProjectType.flutter,
);
