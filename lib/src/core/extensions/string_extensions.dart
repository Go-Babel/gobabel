import 'package:recase/recase.dart';

extension StringExtensions on String {
  String get removeSpacesAndLineBreaks {
    return replaceAll(RegExp(r'\s+'), '');
  }

  String get toCamelCase {
    return
    // Replace all not digits (only a-z, and digits) by space
    replaceAll(r'\n', ' ')
        .replaceAll(RegExp(r'\W'), ' ')
        .replaceAll(RegExp(r'\s{2,}'), ' ')
        .camelCase;
  }

  String get toSnakeCase {
    return
    // Replace all not digits (only a-z, and digits) by space
    replaceAll(r'\n', ' ')
        .replaceAll(RegExp(r'\W'), ' ')
        .replaceAll(RegExp(r'\s{2,}'), ' ')
        .snakeCase;
  }

  String get rawDynamicValue {
    String newS = endsWith('}') ? substring(0, length - 1) : this;
    newS = newS.startsWith(r'$') ? newS.substring(1) : newS;

    return newS.startsWith('{') ? newS.substring(1) : newS;
  }

  String get formatToComment {
    return '  /// ${replaceAll(RegExp('\n'), '<p>\n/// ')}';
  }

  /// Remove everything vefore "/lib"
  /// For example:
  /// /Users/igormidev/gobabel/gobabel/lib/src/scripts/git_related/get_project_git_dependencies.dart
  /// becomes
  /// lib/src/scripts/git_related/get_project_git_dependencies.dart
  String get castToCleanPath {
    final int index = indexOf('/lib');
    if (index == -1) {
      return this;
    }
    return substring(index);
  }
}
