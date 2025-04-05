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
}
