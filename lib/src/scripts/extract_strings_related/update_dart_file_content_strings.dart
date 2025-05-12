import 'package:gobabel/src/core/constants.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel/src/models/hard_coded_string_source.dart';
import 'package:gobabel/src/scripts/extract_strings_related/get_harcoded_strings.dart';
import 'package:gobabel/src/scripts/extract_strings_related/map_strings.dart';
import 'package:gobabel/src/scripts/extract_strings_related/retrive_all_aibabel_consts_from_file.dart';
import 'package:gobabel_core/gobabel_core.dart';

class ReplaceHardCodedStringsForBabelTextUsecase {
  final GetHarcodedStringsUsecase _getHarcodedStringsUsecase;
  final MapStringsUsecase _mapStringsUsecase;
  final RetriveAllAibabelConstsFromFile _retriveAllAibabelConstsFromFile;
  const ReplaceHardCodedStringsForBabelTextUsecase({
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
      Dependencies.addLabelContextPath(alreadyExistingLabel, filePath);
    }

    final strings = _getHarcodedStringsUsecase(fileAsString);
    final Map<L10nKey, L10nValue> newLabelsKeys = {};

    Set<BabelFunctionDeclaration> allDeclarationFunctions = {};
    for (final HardCodedStringSource string in strings.reversed) {
      final MappedString result = _mapStringsUsecase(
        hardCodedString: string,
        filePath: filePath,
        isRoot: true,
      );
      content = content.replaceRange(
        result.startIndex - 1,
        result.endIndex + 1,
        result.aibabelFunctionImplementationString,
      );
      // print('$result\n\n-------------------------------\n\n');
      newLabelsKeys[result.l10nUniqueKey] = result.l10nValue;
      Dependencies.addLabelContextPath(result.l10nUniqueKey, filePath);
      allDeclarationFunctions.addAll(result.aibabelFunctionDeclaration);
    }

    Dependencies.newLabelsKeys.addAll(newLabelsKeys);
    Dependencies.allDeclarationFunctions.addAll(allDeclarationFunctions);

    final String projectName = Dependencies.codeBaseYamlInfo.projectName;
    final String importText =
        newLabelsKeys.isEmpty
            ? ""
            : "import 'package:$projectName/$kBabelFileName';\n";

    if (!content.contains(importText)) {
      final importGroup =
          RegExp(
            '^import (\'|").+(\\1);\$',
            multiLine: true,
          ).allMatches(content).lastOrNull;
      if (importGroup != null) {
        final int start = importGroup.start;
        final int end = importGroup.end;

        content = content.replaceRange(
          start,
          end,
          '${content.substring(start, end)}\n$importText',
        );
        return content;
      }

      final ignoreRef =
          RegExp(
            r'ignore_for_file: .*$',
            multiLine: true,
          ).allMatches(content).lastOrNull;

      if (ignoreRef != null) {
        final int start = ignoreRef.start;
        final int end = ignoreRef.end;

        content = content.replaceRange(
          start,
          end,
          '${content.substring(start, end)}\n$importText',
        );
        return content;
      }

      content = '$importText$content';
      return content;
    } else {
      return content;
    }
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
