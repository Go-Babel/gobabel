import 'package:gobabel/src/core/constants.dart';
import 'package:gobabel/src/scripts/extract_strings_related/get_dynamic_values_in_string.dart';
import 'package:gobabel/src/scripts/extract_strings_related/get_harcoded_strings.dart';
import 'package:gobabel/src/scripts/extract_strings_related/map_strings.dart';
import 'package:gobabel/src/scripts/extract_strings_related/validate_candidate_string.dart';
import 'package:test/test.dart';

import '../../utls/dependencies_class_binding.dart';

const _filePath = '/example/lets_build_something_great.dart';
void main() {
  setUp(() {
    setDependenciesMock();
  });

  test('Should map strings as expected (without children)', () {
    final stringsUsecase = MapStringsUsecase(
      getDynamicValuesInStringUsecase: GetDynamicValuesInStringUsecase(),
    );
    final resp = stringsUsecase(
      hardCodedString: HardCodedStringSource(
        start: 9,
        end: 3,
        child: _textString1,
        children: [],
      ),
      filePath: _filePath,
      isRoot: true,
    );
    resetAllDependencies();
    print(resp);
    expect(
      resp,
      MappedString(
        l10nKey: "the_player_name_is_player_age_years_old",
        l10nValue: "The {playerName} is {playerAge} years old.",
        startIndex: 9,
        endIndex: 3,
        children: [],
        aibabelFunctionImplementationString:
            "$kBabelClass.the_player_name_is_player_age_years_old(player.name, player.age)",
        aibabelFunctionDeclarationString:
            '''  /// The {playerName} is {playerAge} years old.
  static String the_player_name_is_player_age_years_old(Object? playerName, Object? playerAge) {
    return i._getByKey('the_player_name_is_player_age_years_old').replaceAll('{playerName}', playerName.toString()).replaceAll('{playerAge}', playerAge.toString());
  }''',
        path: _filePath,
      ),
    );
  });

  test('Should map strings as expected 2', () {
    final stringsUsecase = MapStringsUsecase(
      getDynamicValuesInStringUsecase: GetDynamicValuesInStringUsecase(),
    );
    final resp = stringsUsecase(
      hardCodedString: HardCodedStringSource(
        start: 9,
        end: 3,
        child: _textString2,
        children: [],
      ),
      filePath: _filePath,
      isRoot: true,
    );
    resetAllDependencies();
    expect(
      resp,
      MappedString(
        l10nKey: "your_lessions_are_lessons_map_l_l_name",
        l10nValue: "Your lessions are {lessonsMapLLName}.",
        startIndex: 9,
        endIndex: 3,
        children: [],
        aibabelFunctionImplementationString:
            "$kBabelClass.your_lessions_are_lessons_map_l_l_name(lessons.map((l) => l.name))",
        aibabelFunctionDeclarationString:
            '''/// Your lessions are {lessonsMapLLName}.
  static String your_lessions_are_lessons_map_l_l_name(Object? lessonsMapLLName) {
    return i._getByKey('your_lessions_are_lessons_map_l_l_name').replaceAll('{lessonsMapLLName}', lessonsMapLLName.toString());
  }''',
        path: _filePath,
      ),
    );
  });

  test('Should map strings as expected 3', () {
    final getHarcodedStringsUsecase = GetHarcodedStringsUsecase(
      validateCandidateStringUsecase: ValidateCandidateStringUsecase(),
    );
    final hardCodedString = getHarcodedStringsUsecase(_textString3);
    // print(hardCodedString);
    final stringsUsecase = MapStringsUsecase(
      getDynamicValuesInStringUsecase: GetDynamicValuesInStringUsecase(),
    );
    assert(hardCodedString.length == 1);
    final resp = stringsUsecase(
      hardCodedString: hardCodedString.first,
      filePath: _filePath,
      isRoot: true,
    );
    print(resp);
    // print(resp);
  });
}

/*
Function impl:
BabelText.thePlayerNameIsPlayerAgeYearsOld('${player.name}', '${player.age}')

Function declaration: 

/// The $name is $age years old.
String thePlayerNameIsPlayerAgeYearsOld(Object? name, Object? age) {
  return 'The $name is $age years old.';
}
*/
const String _textString1 =
    r'''The ${player.name} is ${player.age} years old.''';

const String _textString2 =
    r'''Your lessions are ${lessons.map((l) => l.name)}.''';

/*
BabelText.letsSee(persons.map((p) {
  return BabelText.namePNameImPAgeYearsOldChildren(
    p.name,
    p.age,
    p.children.map((e) {
      return AiBabel.nameEName(e.name);
    }),
  );
}));

....

Root:
Lets see:\n{personsMap}

PersonMap:
Name: {pName}, im {pAge} years old.\nChildren: {pChildrenMapEEName}

ChildrenMap:
Name: {eName}
*/
const String _textString3 = r'''final String personsListage6 =
      'Lets see:\n${persons.map((p) => 'Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) {
            return "Name: ${e.name}";
          })}').toList()}';''';
/*
final String personsListage6 =
      'Lets see:\n${persons.map((p) => 'Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) {
            return e.name;
          })}
Lets see:\n {personMap}.
Children: [
  "Name: {pName}, im {pAge} years old.\nChildren: {pChildrenMapEEName}"
]
*/
