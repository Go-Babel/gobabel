import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';
import 'package:gobabel_client/gobabel_client.dart';

import 'package:result_dart/result_dart.dart';

class NotifyAibabelApiAboutNewVersionUseCase {
  const NotifyAibabelApiAboutNewVersionUseCase();

  AsyncBabelResult<Unit> call({
    required String token,
    required LabelLocale labelLocale,
    required GitVariables gitVariables,
  }) async {
    final List<LabelSetMapping> inputs = [
      ...Dependencies.alreadyExistingLabels.entries.map((entry) {
        final L10nKey key = entry.key;
        final List<ContextPath> contextPaths = entry.value;

        return LabelSetMapping(
          newLabel: null,
          alreadyExistingLabel: key,
          pathsThatLabelIsUsedIn: contextPaths,
        );
      }),
      ...Dependencies.newLabels.entries.map((entry) {
        final L10nKey key = entry.key;
        final ({L10nValue key, List<ContextPath> contextPaths}) value =
            entry.value;

        return LabelSetMapping(
          alreadyExistingLabel: null,
          newLabel: NewLabel(key: key, value: value.key),
          pathsThatLabelIsUsedIn: value.contextPaths,
        );
      }),
    ];

    await Dependencies.client.labelMapping.createNewVersion(
      inputs: inputs,
      countryCode: labelLocale.countryCode,
      languageCode: labelLocale.languageCode,
      projectName: Dependencies.codeBaseYamlInfo.projectName,
      projectDescription:
          Dependencies.codeBaseYamlInfo.projectDescription ?? '',
      projectShaIdentifier: gitVariables.projectShaIdentifier,
      token: token,
      versionName: Dependencies.codeBaseYamlInfo.version,
    );

    return Success(unit);
  }
}
