import 'package:gobabel/src/scripts/extract_strings_related/retrive_all_aibabel_consts_from_file.dart';
import 'package:test/test.dart';

void main() {
  test('Should find 10 constants files in test string', () {
    final retriveAllAibabelConstsFromFile = RetriveAllAibabelConstsFromFile();
    final resp = retriveAllAibabelConstsFromFile(_testString);
    expect(resp.length, 10);
  });
}

final _testString = '''
fkd
fjdfk
BabelText.your_lessions_are_lessons_map_l_l_name(lessons.map((l) => l.name))

Kfsfflf

kfi8ajf {BabelText.your_lessions_are_lessons_map_l_l_name(lessons.map((l) => l.name))}

kf ysfja
isf BabelText.your_lessions_are_lessons_map_l_l_name(BabelText.your_lessions_are_lessons_map_l_l_name(lessons.map((l) => l.name)))
sfksfi

uga uga

BabelText.
your_lessions_are_lessons_map_l_l_name(lessons.map((l) => l.name))
manf

BabelText
.your_lessions_are_lessons_map_l_l_name(lessons.map((l) => l.name))

BabelText . 
 your_lessions_are_lessons_map_l_l_name(
BabelText
   .  your_lessions_are_lessons_map_l_l_name(lessons.map((l) => l.name))
)

BabelText
.your_lessions_are_lessons_map_l_l_name(
BabelText.
your_lessions_are_lessons_map_l_l_name(lessons.map((l) => l.name))
)
yksfnfk''';
