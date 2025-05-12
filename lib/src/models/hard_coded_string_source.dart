import 'package:chalkdart/chalkstrings.dart';
import 'package:collection/collection.dart';
import 'package:gobabel/src/core/extensions/string_extensions.dart';

class HardCodedStringSource {
  final int start;
  final int end;

  /// The hardcoded string.
  final String child;

  /// The sub-strings contained in the [child] string.
  final List<HardCodedStringSource> children;

  // String get arbKey {
  //   String key = child;
  //   for (final child in children) {
  //     final start = child.start;
  //     final end = child.end;
  //     key = key.replaceRange(start, end, '');
  //   }
  //   print('before: $child\nafter: $key\n\n'.purple);
  //   return key.toSnakeCase;
  // }

  const HardCodedStringSource({
    required this.start,
    required this.end,
    required this.child,
    required this.children,
  });

  @override
  String toString({int recursiveIndex = 0}) {
    final indent = '  ' * recursiveIndex;
    final childrenString = children
        .map((child) => child.toString(recursiveIndex: recursiveIndex + 2))
        .join('\n');
    return '''${indent}HardCodedStringSource(
$indent  start: $start,
$indent  end: $end,
$indent  child: r"""$child""",
$indent  children: [
$childrenString
$indent  ],
$indent),''';
  }

  @override
  bool operator ==(covariant HardCodedStringSource other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.start == start &&
        other.end == end &&
        other.child == child &&
        listEquals(other.children, children);
  }

  @override
  int get hashCode {
    return start.hashCode ^ end.hashCode ^ child.hashCode ^ children.hashCode;
  }
}
