import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/gobabel_controller.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';

void setDependenciesMock() {
  isInTest = true;
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
