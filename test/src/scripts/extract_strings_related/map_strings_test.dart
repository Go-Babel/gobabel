import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/constants.dart';
import 'package:gobabel/src/models/hard_coded_string_source.dart';
import 'package:gobabel/src/scripts/extract_strings_related/get_dynamic_values_in_string.dart';
import 'package:gobabel/src/scripts/extract_strings_related/get_harcoded_strings.dart';
import 'package:gobabel/src/scripts/extract_strings_related/map_strings.dart';
import 'package:gobabel/src/scripts/extract_strings_related/validate_candidate_string.dart';
import 'package:test/test.dart';

import '../../utls/dependencies_class_binding.dart';

const _filePath = '/example/lets_build_something_great.dart';
void main() {
  setUp(() {
    resetAllDependencies();
    setDependenciesMock();
  });

  group('Test the hardcoded example string', () {
    test('Should map hard coded file mock as expected 1', () {
      final stringsUsecase = MapStringsUsecase(
        getDynamicValuesInStringUsecase: GetDynamicValuesInStringUsecase(),
      );

      final resp = stringsUsecase(
        hardCodedString: HardCodedStringSource(
          start: 149,
          end: 173,
          child: r"""Num $index at name $name""",
          children: [],
        ),
        filePath: _filePath,
        isRoot: false,
      );

      print(resp.toString());
    });
    test('Should map hard coded file mock as expected 2', () {
      final stringsUsecase = MapStringsUsecase(
        getDynamicValuesInStringUsecase: GetDynamicValuesInStringUsecase(),
      );

      final resp = stringsUsecase(
        hardCodedString: HardCodedStringSource(
          start: 836,
          end: 890,
          child: r"""Privacy: ${workSpace.isPrivate ? 'Private' : 'Public'}""",
          children: [
            HardCodedStringSource(
              start: 34,
              end: 41,
              child: r"""Private""",
              children: [],
            ),
            HardCodedStringSource(
              start: 46,
              end: 52,
              child: r"""Public""",
              children: [],
            ),
          ],
        ),
        filePath: _filePath,
        isRoot: true,
      );

      print(resp.toString());
    });
  });

  test('Should map hard coded file mock as expected', () {
    final stringsUsecase = MapStringsUsecase(
      getDynamicValuesInStringUsecase: GetDynamicValuesInStringUsecase(),
    );

    final resp = stringsUsecase(
      hardCodedString: HardCodedStringSource(
        start: 957,
        end: 1252,
        child: r"""Workspaces: ${userData.workspaces.map((workspace) {
                  return 'The workspace ${workspace.name} have ${workspace.members.length} members. Those are: ${workspace.members.asMap().map((index, name) => MapEntry(key, 'Num $index at name $name')).values.join(', ')}';
                })}""",
        children: [
          HardCodedStringSource(
            start: 78,
            end: 273,
            child:
                r"""The workspace ${workspace.name} have ${workspace.members.length} members. Those are: ${workspace.members.asMap().map((index, name) => MapEntry(key, 'Num $index at name $name')).values.join(', ')}""",
            children: [
              HardCodedStringSource(
                start: 149,
                end: 173,
                child: r"""Num $index at name $name""",
                children: [],
              ),
            ],
          ),
        ],
      ),
      filePath: _filePath,
      isRoot: true,
    );
    print(resp.toString().purple);
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
            '''  /// Your lessions are {lessonsMapLLName}.
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
