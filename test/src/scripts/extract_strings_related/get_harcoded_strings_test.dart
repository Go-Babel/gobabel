import 'package:gobabel/src/scripts/extract_strings_related/get_harcoded_strings.dart';
import 'package:gobabel/src/scripts/extract_strings_related/validate_candidate_string.dart';
import 'package:test/test.dart';

void main() {
  final getHarcodedStringsUsecase = GetHarcodedStringsUsecase(
    validateCandidateStringUsecase: ValidateCandidateStringUsecase(),
  );

  test('Should get hardcoded Strings as expected for layer 1', () {
    final hardCodedString = getHarcodedStringsUsecase(_textLayer1);
    print(hardCodedString);
  });

  test('Should get hardcoded Strings as expected for layer 2', () {
    final hardCodedString = getHarcodedStringsUsecase(_textLayer3);
    print('Lets see:\n${hardCodedString.join('\n')}\n');
  });
}

const String _textLayer1 = r'''final String personsListage6 =
      'Lets see:\n${persons.map((p) => 'Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) {
            return "Name: ${e.name}";
          })}').toList()}';''';
const String _textLayer2 =
    r'''Lets see:\n${persons.map((p) => 'Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) {
            return e.name;
          })}';
}).toList()}''';
const String _textLayer3 = r'''Lets see:\n${persons.map((p) {
    return 'Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) {
      return "Name: ${e.name}";
    })}';
  }).toList()}''';

const String _textLayer4 = r'''persons.map((p) {
    return 'Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) {
      return e.name;
    })}';
  }).toList()''';


/*
final String personsListage6 =
      'Lets see:\n${persons.map((p) => 'Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) {
            return "Name: ${e.name}";
          })}').toList()}';


Lets see:\n${persons.map((p) => 'Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) {
            return "Name: ${e.name}";
          })}').toList()}

Children: [
  Item(
    child: Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) {
    return "Name: ${e.name}";
  })},
    children: [
      Item(
        child: Name: ${e.name},
        children: []
      )
    ]
  )
]
*/