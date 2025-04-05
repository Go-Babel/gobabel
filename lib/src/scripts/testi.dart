import 'dart:io';
import 'package:gobabel/src/scripts/extract_strings_related/get_dynamic_values_in_string.dart';
import 'package:gobabel/src/scripts/extract_strings_related/get_harcoded_strings.dart';
import 'package:gobabel/src/scripts/extract_strings_related/map_strings.dart';
import 'package:gobabel/src/scripts/extract_strings_related/validate_candidate_string.dart';
import 'package:path/path.dart' as path;

void main(List<String> args) {
  final File file = File('lib/src/scripts/test_multiple_texts.dart');
  final element = file.readAsStringSync();
  // final sourceFile = SourceFile.fromString(contents, url: file.uri);
  // final spans = _parseFile(contents, sourceFile);
  // for (final SourceSpan span in spans) {
  //   print('[${span.start.line + 1}:${span.start.column + 1}] | ${span.text}');
  // }
  const List<String> skipWords = ['dart:ui', 'dart:io'];
  final List<HardCodedStringSource> allMessages = [];

  final shouldSkip = skipWords.contains(path.basename(file.path));

  if (path.extension(file.path) == ".dart" && !shouldSkip) {
    allMessages.addAll(
      GetHarcodedStringsUsecase(
        validateCandidateStringUsecase: ValidateCandidateStringUsecase(),
      )(element),
    );
  }
  final List<String> items = [];

  for (final HardCodedStringSource message in allMessages) {
    final res = MapStringsUsecase(
      getDynamicValuesInStringUsecase: GetDynamicValuesInStringUsecase(),
    )(
      hardCodedString: message,
      filePath: '/example/lets_build_something_great.dart',
      isRoot: true,
    );

    assert(res.children.isEmpty);
    items.add(res.toString());
  }
  print(items.join('\n'));
  // print(allMessages.map((e) => e).join('\n'));
}

/*
HardStringSource(start: 14, end: 28, child: Order there is)
HardStringSource(start: 227, end: 250, child: My name is \"John Doe\")
HardStringSource(start: 306, end: 329, child: My name is \'John Doe\')
HardStringSource(start: 356, end: 364, child: John Doe)
HardStringSource(start: 388, end: 408, child: My name is "${name}")
HardStringSource(start: 432, end: 452, child: My name is '${name}')
HardStringSource(start: 476, end: 498, child: My name is \'${name}\')
HardStringSource(start: 522, end: 544, child: My name is \"${name}\")
HardStringSource(start: 568, end: 590, child: My name is \"${name}\")
HardStringSource(start: 614, end: 636, child: My name is \'${name}\')
HardStringSource(start: 660, end: 682, child: My name is \"${name}\")
HardStringSource(start: 706, end: 728, child: My name is \"${name}\')
HardStringSource(start: 753, end: 771, child: My name is "$name")
HardStringSource(start: 795, end: 813, child: My name is '$name')
HardStringSource(start: 837, end: 857, child: My name is \'$name\')
HardStringSource(start: 881, end: 901, child: My name is \"$name\")
HardStringSource(start: 925, end: 945, child: My name is \"$name\")
HardStringSource(start: 969, end: 989, child: My name is \'$name\')
HardStringSource(start: 1013, end: 1033, child: My name is \"$name\")
HardStringSource(start: 1057, end: 1077, child: My name is \"$name\')
HardStringSource(start: 1102, end: 1129, child: My name is "${name.length}")
HardStringSource(start: 1153, end: 1180, child: My name is '${name.length}')
HardStringSource(start: 1204, end: 1233, child: My name is \'${name.length}\')
HardStringSource(start: 1257, end: 1286, child: My name is \"${name.length}\")
HardStringSource(start: 1310, end: 1339, child: My name is \"${name.length}\")
HardStringSource(start: 1363, end: 1392, child: My name is \'${name.length}\')
HardStringSource(start: 1416, end: 1445, child: My name is \"${name.length}\")
HardStringSource(start: 1469, end: 1498, child: My name is \"${name.length}\')
HardStringSource(start: 1553, end: 1561, child: John Doe)
HardStringSource(start: 1583, end: 1591, child: New York)
HardStringSource(start: 1628, end: 1633, child: Alice)
HardStringSource(start: 1667, end: 1670, child: Bob)
HardStringSource(start: 1709, end: 1717, child: Jane Doe)
HardStringSource(start: 1739, end: 1750, child: Los Angeles)
HardStringSource(start: 1787, end: 1794, child: Charlie)
HardStringSource(start: 1828, end: 1833, child: David)
HardStringSource(start: 1880, end: 1911, child: My name is "${persons[0].name}")
HardStringSource(start: 1935, end: 1969, child: My name is '${persons[0].address}')
HardStringSource(start: 2013, end: 2061, child: Lets see: ${persons.map((p) => p.name).toList()})
HardStringSource(start: 2104, end: 2154, child: Lets see:${persons.map((p) => p.address).toList()})
HardStringSource(start: 2197, end: 2258, child: Lets see golfi:${persons.map((p) => '${p.address}').toList()})
HardStringSource(start: 2301, end: 2361, child: Lets see:\n${persons.map((p) => 'Name: ${p.name}').toList()})
HardStringSource(start: 2404, end: 2487, child: Lets see:\n${persons.map((p) => 'Name: ${p.name}, im ${p.age} years old').toList()})
HardStringSource(start: 2530, end: 2677, child: Lets see:\n${persons.map((p) => 'Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) {
            return e.name;
          })})
HardStringSource(start: 2963, end: 2986, child: ${e.name} with ${e.age})
HardStringSource(start: 3119, end: 3142, child: ${e.name} with ${e.age})
*/
