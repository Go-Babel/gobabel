import 'package:gobabel/src/core/constants.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel/src/scripts/extract_strings_related/get_harcoded_strings.dart';
import 'package:gobabel/src/scripts/extract_strings_related/map_strings.dart';
import 'package:gobabel/src/scripts/extract_strings_related/retrive_all_aibabel_consts_from_file.dart';

class UpdateDartFileContentStringsUsecase {
  final GetHarcodedStringsUsecase _getHarcodedStringsUsecase;
  final MapStringsUsecase _mapStringsUsecase;
  final RetriveAllAibabelConstsFromFile _retriveAllAibabelConstsFromFile;
  const UpdateDartFileContentStringsUsecase({
    required GetHarcodedStringsUsecase getHarcodedStringsUsecase,
    required MapStringsUsecase mapStringsUsecase,
    required RetriveAllAibabelConstsFromFile retriveAllAibabelConstsFromFile,
  }) : _getHarcodedStringsUsecase = getHarcodedStringsUsecase,
       _mapStringsUsecase = mapStringsUsecase,
       _retriveAllAibabelConstsFromFile = retriveAllAibabelConstsFromFile;

  String call({required ContextPath fileAsString, required String filePath}) {
    String content = fileAsString;
    final List<String> alreadyExistingLabelsBeforeOperation =
        _retriveAllAibabelConstsFromFile(content);
    for (final alreadyExistingLabel in alreadyExistingLabelsBeforeOperation) {
      if (Dependencies.alreadyExistingLabels.containsKey(
        alreadyExistingLabel,
      )) {
        Dependencies.alreadyExistingLabels[alreadyExistingLabel]!.add(filePath);
      } else {
        Dependencies.alreadyExistingLabels[alreadyExistingLabel] = [filePath];
      }
    }

    final strings = _getHarcodedStringsUsecase(fileAsString);
    // final Map<L10nKey, L10nValue> values = {};
    final Map<L10nKey, ({L10nValue key, List<ContextPath> contextPaths})>
    values = {};

    Set<BabelFunctionDeclaration> allDeclarationFunctions = {};
    for (final HardCodedStringSource string in strings) {
      final MappedString result = _mapStringsUsecase(
        hardCodedString: string,
        filePath: filePath,
        isRoot: true,
      );
      content = content.replaceRange(
        result.startIndex,
        result.endIndex,
        result.aibabelFunctionImplementationString,
      );

      values[result.l10nUniqueKey] = (
        key: result.l10nValue,
        contextPaths: [filePath],
      );
      allDeclarationFunctions.addAll(result.aibabelFunctionDeclaration);
    }

    Dependencies.newLabels.addAll(values);
    Dependencies.allDeclarationFunctions.addAll(allDeclarationFunctions);

    final String projectName = Dependencies.codeBaseYamlInfo.projectName;
    final String importText = "import 'package:$projectName/$kBabelFileName';";
    // Add import to the top of the file
    content = '$importText\n$content';

    return content;
  }
}

extension on MappedString {
  Set<BabelFunctionDeclaration> get aibabelFunctionDeclaration {
    final result = <BabelFunctionDeclaration>{};

    result.add(aibabelFunctionDeclarationString);
    for (final child in children) {
      result.addAll(child.aibabelFunctionDeclaration);
    }
    return result;
  }
}
