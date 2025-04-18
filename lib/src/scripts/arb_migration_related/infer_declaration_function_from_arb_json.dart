import 'package:gobabel/src/core/extensions/string_extensions.dart';
import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel_core/go_babel_core.dart';

class InferDeclarationFunctionFromArbJsonUsecase {
  Map<L10nKey, BabelFunctionDeclaration> call(
    Map<L10nKey, L10nValue> allKeyValues,
  ) {
    final RegExp regex = RegExp(r'{(?:\w|\s)+}', multiLine: true);
    final Map<L10nKey, BabelFunctionDeclaration> allDeclarationFunctions = {};

    allKeyValues.forEach((L10nKey key, L10nValue l10nValue) {
      final String funcName = l10nValue.toSnakeCase;
      final List<String> dynamicFields = [];

      final Iterable<RegExpMatch> matches = regex.allMatches(l10nValue);
      for (final RegExpMatch match in matches) {
        final String dynamicField = match.group(1)!;
        dynamicFields.add(dynamicField);
      }

      BabelFunctionDeclaration aibabelFunctionDeclarationString =
          '''${l10nValue.formatToComment}
  static String $funcName(${dynamicFields.map((e) => 'Object? $e').join(', ')}) {
    return i._getByKey('$funcName')${dynamicFields.map((e) => '.replaceAll(\'{$e}\', $e.toString())').join()};
  }''';

      allDeclarationFunctions[key] = aibabelFunctionDeclarationString;
    });

    return allDeclarationFunctions;
  }
}
