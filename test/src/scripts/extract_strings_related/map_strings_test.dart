import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel_core/src/constants.dart';
import 'package:gobabel/src/models/hard_coded_string_source.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/get_dynamic_values_in_string.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/get_harcoded_strings.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/map_strings.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/validate_candidate_string.dart';
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
      );
      print(resp.toString());
      // expect(resp.toString(), expectedResult.toString());
    });

    test('Should map hard coded file mock as expected 3', () {
      final stringsUsecase = MapStringsUsecase(
        getDynamicValuesInStringUsecase: GetDynamicValuesInStringUsecase(),
      );
      /*
MappedString(
  l10nKey: "workspaces_1d0d0",
  path: "/example/lets_build_something_great.dart",
  l10nValue: "Workspaces: {userDataWorkspacesMapWorkspaceReturnTheWorkspaceWorkspaceNameHaveWorkspaceMembersLengthMembersThoseAreWorkspaceMembersAsMapMapIndexNameMapEntryKeyNumIndexAtNameName1d0d0ValuesJoin1d0d0}",
  startIndex: 957,
  endIndex: 1252,
  aibabelFunctionImplementationString: "BabelText.workspaces(userData.workspaces.map((workspace) {
                  return 'the_workspace_workspace_name_have_workspace_members_length_members_those_are_workspace_members_as_map_map_index_name_map_entry_key_num_index_at_name_name1d0d0_values_join_1d0d0';
                }))",
  aibabelFunctionDeclarationString: '''  /// Workspaces: {userDataWorkspacesMapWorkspaceReturnTheWorkspaceWorkspaceNameHaveWorkspaceMembersLengthMembersThoseAreWorkspaceMembersAsMapMapIndexNameMapEntryKeyNumIndexAtNameName1d0d0ValuesJoin1d0d0}
  static String workspaces(Object? userDataWorkspacesMapWorkspaceReturnTheWorkspaceWorkspaceNameHaveWorkspaceMembersLengthMembersThoseAreWorkspaceMembersAsMapMapIndexNameMapEntryKeyNumIndexAtNameName1d0d0ValuesJoin1d0d0) {
    return _getByKey('workspaces').replaceAll('{userDataWorkspacesMapWorkspaceReturnTheWorkspaceWorkspaceNameHaveWorkspaceMembersLengthMembersThoseAreWorkspaceMembersAsMapMapIndexNameMapEntryKeyNumIndexAtNameName1d0d0ValuesJoin1d0d0}', userDataWorkspacesMapWorkspaceReturnTheWorkspaceWorkspaceNameHaveWorkspaceMembersLengthMembersThoseAreWorkspaceMembersAsMapMapIndexNameMapEntryKeyNumIndexAtNameName1d0d0ValuesJoin1d0d0.toString());
  }''',
  children: [
    MappedString(
      l10nKey: "the_workspace_workspace_name_have_workspace_members_length_members_those_are_workspace_members_as_map_map_index_name_map_entry_key_num_index_at_name_name1d0d0_values_join_1d0d0",
      path: "/example/lets_build_something_great.dart",
      l10nValue: "The workspace {workspaceName} have {workspaceMembersLength} members. Those are: {workspaceMembersAsMapMapIndexNameMapEntryKeyNumIndexAtNameName1d0d0ValuesJoin}",
      startIndex: 78,
      endIndex: 273,
      aibabelFunctionImplementationString: "BabelText.the_workspace_workspace_name_have_workspace_members_length_members_those_are_workspace_members_as_map_map_index_name_map_entry_key_num_index_at_name_name1d0d0_values_join(workspace.name, workspace.members.length, workspace.members.asMap().map((index, name) => MapEntry(key, 'num_index_at_name_name_1d0d0')).values.join(', '))",
      aibabelFunctionDeclarationString: '''      /// The workspace {workspaceName} have {workspaceMembersLength} members. Those are: {workspaceMembersAsMapMapIndexNameMapEntryKeyNumIndexAtNameName1d0d0ValuesJoin}
      static String the_workspace_workspace_name_have_workspace_members_length_members_those_are_workspace_members_as_map_map_index_name_map_entry_key_num_index_at_name_name1d0d0_values_join(Object? workspaceName, Object? workspaceMembersLength, Object? workspaceMembersAsMapMapIndexNameMapEntryKeyNumIndexAtNameName1d0d0ValuesJoin) {
        return _getByKey('the_workspace_workspace_name_have_workspace_members_length_members_those_are_workspace_members_as_map_map_index_name_map_entry_key_num_index_at_name_name1d0d0_values_join').replaceAll('{workspaceName}', workspaceName.toString()).replaceAll('{workspaceMembersLength}', workspaceMembersLength.toString()).replaceAll('{workspaceMembersAsMapMapIndexNameMapEntryKeyNumIndexAtNameName1d0d0ValuesJoin}', workspaceMembersAsMapMapIndexNameMapEntryKeyNumIndexAtNameName1d0d0ValuesJoin.toString());
      }''',
      children: [
        MappedString(
          l10nKey: "num_index_at_name_name_1d0d0",
          path: "/example/lets_build_something_great.dart",
          l10nValue: "Num {index} at name {name}",
          startIndex: 149,
          endIndex: 173,
          aibabelFunctionImplementationString: "BabelText.num_index_at_name_name(index, name)",
          aibabelFunctionDeclarationString: '''          /// Num {index} at name {name}
          static String num_index_at_name_name(Object? index, Object? name) {
            return _getByKey('num_index_at_name_name').replaceAll('{index}', index.toString()).replaceAll('{name}', name.toString());
          }''',
          children: [

          ],
        ),
      ],
    ),
  ],
),*/

      /*MappedString(
  l10nKey: "theWorkspaceHaveMembersThoseAre1d0d01d0d0",
  path: "/example/lets_build_something_great.dart",
  l10nValue: "The workspace {workspaceName} have {workspaceMembersLength} members. Those are: {workspaceMembersAsMapMapIndexNameMapEntryKeyBabelTextNumAtName1d0d0NameIndexValuesJoin}",
  startIndex: 78,
  endIndex: 273,
  aibabelFunctionImplementationString: "BabelText.theWorkspaceHaveMembersThoseAre1d0d0('${workspace.members.asMap().map((index, name) => MapEntry(key, BabelText.numAtName1d0d0(name, index))).values.join(', ')}', '${workspace.members.length}', '${workspace.name}')",
  aibabelFunctionDeclarationString: '''  /// The workspace {workspaceName} have {workspaceMembersLength} members. Those are: {workspaceMembersAsMapMapIndexNameMapEntryKeyBabelTextNumAtName1d0d0NameIndexValuesJoin}
  static String theWorkspaceHaveMembersThoseAre1d0d0(Object? workspaceMembersAsMapMapIndexNameMapEntryKeyBabelTextNumAtName1d0d0NameIndexValuesJoin, Object? workspaceMembersLength, Object? workspaceName) {
    return _getByKey('theWorkspaceHaveMembersThoseAre1d0d0').replaceAll('{workspaceMembersAsMapMapIndexNameMapEntryKeyBabelTextNumAtName1d0d0NameIndexValuesJoin}', workspaceMembersAsMapMapIndexNameMapEntryKeyBabelTextNumAtName1d0d0NameIndexValuesJoin.toString()).replaceAll('{workspaceMembersLength}', workspaceMembersLength.toString()).replaceAll('{workspaceName}', workspaceName.toString());
  }''',
  children: [
    MappedString(
      l10nKey: "numAtName1d0d01d0d0",
      path: "/example/lets_build_something_great.dart",
      l10nValue: "Num {index} at name {name}",
      startIndex: 149,
      endIndex: 173,
      aibabelFunctionImplementationString: "BabelText.numAtName1d0d0(name, index)",
      aibabelFunctionDeclarationString: '''      /// Num {index} at name {name}
      static String numAtName1d0d0(Object? name, Object? index) {
        return _getByKey('numAtName1d0d0').replaceAll('{name}', name.toString()).replaceAll('{index}', index.toString());
      }''',
      children: [

      ],
    ),
  ],
),
*/
      final resp = stringsUsecase(
        // hardCodedString: HardCodedStringSource(
        //   start: 78,
        //   end: 273,
        //   child:
        //       r"""The workspace ${workspace.name} have ${workspace.members.length} members. Those are: ${workspace.members.asMap().map((index, name) => MapEntry(key, 'Num $index at name $name')).values.join(', ')}""",
        //   children: [
        //     HardCodedStringSource(
        //       start: 149,
        //       end: 173,
        //       child: r"""Num $index at name $name""",
        //       children: [],
        //     ),
        //   ],
        // ),
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
      );
      print(resp.toString());
      // expect(resp.toString(), expectedResult.toString());
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
      validateCandidateStringUsecase: ValidateCandidateStringUsecase(
        getDynamicValuesInStringUsecase: GetDynamicValuesInStringUsecase(),
      ),
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
