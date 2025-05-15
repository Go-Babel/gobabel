// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/constants.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/type_defs.dart';
import 'package:collection/collection.dart';
import 'package:gobabel/src/core/extensions/string_extensions.dart';
import 'package:gobabel/src/models/hard_coded_string_source.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/get_dynamic_values_in_string.dart';
import 'package:gobabel_core/gobabel_core.dart';

class MapStringsUsecase {
  final GetDynamicValuesInStringUsecase getDynamicValuesInStringUsecase;
  const MapStringsUsecase({required this.getDynamicValuesInStringUsecase});

  MappedString call({
    required HardCodedStringSource hardCodedString,
    required ContextPath filePath,
  }) {
    final bool shouldPrint = !hardCodedString.child.contains('Privacy');
    final children =
        hardCodedString.children
            .map((e) => call(hardCodedString: e, filePath: filePath))
            .toList()
          ..sort((a, b) => b.startIndex.compareTo(a.startIndex));
    String l10nValue = hardCodedString.child;
    for (final child in children) {
      l10nValue = l10nValue.replaceRange(
        child.startIndex - 1,
        child.endIndex + 1,
        child.aibabelFunctionImplementationString,
      );
    }

    final List<DynamicValueSection> dynamicValues =
        getDynamicValuesInStringUsecase(l10nValue);
    print('${dynamicValues.length} dynamicValues: $dynamicValues'.red);
    dynamicValues.sort((a, b) => b.startIndex.compareTo(a.startIndex));

    final Set<VariableName> variableNames = {};
    final Set<VariableName> implementationParameters = {};

    if (shouldPrint) print(hardCodedString.child.skyBlue);
    for (final DynamicValueSection dynamicValue in dynamicValues) {
      final VariableName variableName = dynamicValue.variableName;
      final VariableContent variableContent =
          dynamicValue.variableContent.rawDynamicValue;
      variableNames.add(variableName);
      implementationParameters.add(variableContent);
      if (shouldPrint) {
        print('variableContent: ${dynamicValue.variableContent}'.red);
        print('variableName: $variableName'.red);
      }
      l10nValue = l10nValue.replaceRange(
        dynamicValue.startIndex,
        dynamicValue.endIndex,
        '{$variableName}',
      );
    }

    final String l10nKey = l10nValue.toArbCase(variableNames);

    VariableContent gobabelFunctionDeclarationString =
        '''${l10nValue.formatToComment}
  static String $l10nKey(${variableNames.map((e) => 'Object? $e').join(', ')}) {
    return _getByKey('$l10nKey')${variableNames.map((e) => '.replaceAll(\'{$e}\', $e.toString())').join()};
  }''';
    VariableName gobabelFunctionImplementationString =
        '$kBabelClass.$l10nKey(${implementationParameters.map((e) => e).join(', ')})';

    final int startIndex = hardCodedString.start;
    final int endIndex = hardCodedString.end;
    return MappedString(
      l10nKey: l10nKey,
      l10nValue: l10nValue,
      aibabelFunctionDeclarationString: gobabelFunctionDeclarationString,
      aibabelFunctionImplementationString: gobabelFunctionImplementationString,
      startIndex: startIndex,
      endIndex: endIndex,
      children: children,
      path: filePath,
    );
  }
}

// The camelCase of the name of an variable
typedef VariableName = String;
typedef VariableContent = String;

class DynamicFiels {
  final VariableName variableName;
  final VariableContent variableContent;
  final int startIndex;
  final int endIndex;

  const DynamicFiels({
    required this.variableName,
    required this.variableContent,
    required this.startIndex,
    required this.endIndex,
  });
}

class MappedString {
  final L10nKey l10nUniqueKey;
  final L10nValue l10nValue;
  final ContextPath path;
  final BabelFunctionDeclaration aibabelFunctionDeclarationString;
  final BabelFunctionImplementation aibabelFunctionImplementationString;
  final int startIndex;
  final int endIndex;
  String get id {
    return l10nUniqueKey.substring(l10nUniqueKey.lastIndexOf('_') + 1);
  }

  /// Sub-strings contained in the [l10nValue].
  final List<MappedString> children;

  MappedString({
    required String l10nKey,
    required this.path,
    required this.l10nValue,
    required this.aibabelFunctionDeclarationString,
    required this.aibabelFunctionImplementationString,
    required this.startIndex,
    required this.endIndex,
    required this.children,
  }) : l10nUniqueKey = l10nKey;
  // }) : l10nUniqueKey = garanteeIsNewKey(l10nKey);

  @override
  String toString({int recursiveIndex = 0}) {
    final indent = '  ' * recursiveIndex;
    final childrenString = children
        .map((child) => child.toString(recursiveIndex: recursiveIndex + 2))
        .join('\n');
    return '''${indent}MappedString(
$indent  l10nKey: "$l10nUniqueKey",
$indent  path: "$path",
$indent  l10nValue: "$l10nValue",
$indent  startIndex: $startIndex,
$indent  endIndex: $endIndex,
$indent  aibabelFunctionImplementationString: "${aibabelFunctionImplementationString.aqua}",
$indent  aibabelFunctionDeclarationString: \'\'\'${'$indent${aibabelFunctionDeclarationString.replaceAll('\n', '\n$indent')}'.aqua}\'\'\',
$indent  children: [
$childrenString
$indent  ],
$indent),'''.wheat;
  }

  @override
  bool operator ==(covariant MappedString other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.l10nUniqueKey == l10nUniqueKey &&
        listEquals(other.path, path) &&
        other.l10nValue == l10nValue &&
        other.aibabelFunctionDeclarationString ==
            aibabelFunctionDeclarationString &&
        other.aibabelFunctionImplementationString ==
            aibabelFunctionImplementationString &&
        other.startIndex == startIndex &&
        other.endIndex == endIndex &&
        listEquals(other.children, children);
  }

  @override
  int get hashCode {
    return l10nUniqueKey.hashCode ^
        path.hashCode ^
        l10nValue.hashCode ^
        aibabelFunctionDeclarationString.hashCode ^
        aibabelFunctionImplementationString.hashCode ^
        startIndex.hashCode ^
        endIndex.hashCode ^
        children.hashCode;
  }

  MappedString copyWith({
    String? l10nValue,
    String? aibabelFunctionDeclarationString,
    String? aibabelFunctionImplementationString,
    int? startIndex,
    int? endIndex,
    List<MappedString>? children,
  }) {
    return MappedString(
      l10nKey: l10nUniqueKey,
      path: path,
      l10nValue: l10nValue ?? this.l10nValue,
      aibabelFunctionDeclarationString:
          aibabelFunctionDeclarationString ??
          this.aibabelFunctionDeclarationString,
      aibabelFunctionImplementationString:
          aibabelFunctionImplementationString ??
          this.aibabelFunctionImplementationString,
      startIndex: startIndex ?? this.startIndex,
      endIndex: endIndex ?? this.endIndex,
      children: children ?? this.children,
    );
  }
}

String garanteeIsNewKey(String input) {
  int version = 0;
  String getUniqueInput() {
    return '$input${Dependencies.versionId}${version == 0 ? '' : 'v$version'}';
    // With underline:
    // return '${input}_${Dependencies.versionId}${version == 0 ? '' : 'v$version'}';
  }

  String uniqueInput = getUniqueInput();

  // Get a version that is not already calculated
  while (Dependencies.uniqueKeys.contains(uniqueInput)) {
    // while (Dependencies.newLabelsKeys.keys.contains(uniqueInput)) {
    version++;
    uniqueInput = getUniqueInput();
  }
  Dependencies.uniqueKeys.add(uniqueInput);

  return uniqueInput;
}
