import 'dart:io';

import 'package:gobabel/src/models/hard_coded_string_source.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/get_dynamic_values_in_string.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/get_harcoded_strings.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/validate_candidate_string.dart';
import 'package:test/test.dart';

void main() {
  final getHarcodedStringsUsecase = GetHarcodedStringsUsecase(
    validateCandidateStringUsecase: ValidateCandidateStringUsecase(
      getDynamicValuesInStringUsecase: GetDynamicValuesInStringUsecase(),
    ),
  );

  test('Should get hardcoded Strings as expected for layer 1', () {
    final hardCodedString = getHarcodedStringsUsecase(_textLayer1);
    print(hardCodedString);
  });

  test('Should get hardcoded Strings as expected for layer 2', () {
    final hardCodedString = getHarcodedStringsUsecase(_textLayer3);
    print('Lets see:\n${hardCodedString.join('\n')}\n');
  });

  test('Should map correctly the target file', () async {
    final targetPath =
        '${Directory.current.path}/test/src/scripts/extract_strings_related/test_hardcoded_file.dart';
    // '/Users/igormidev/Documents/work/dsf-player-getter/dsf_commum_data_source/lib/src/repositories/fetch_championship_average/auxiliar_functions/evaluate_season_match_info.dart';

    final File file = File(targetPath);
    final String content = await file.readAsString();
    final res = GetHarcodedStringsUsecase(
      validateCandidateStringUsecase: ValidateCandidateStringUsecase(
        getDynamicValuesInStringUsecase: GetDynamicValuesInStringUsecase(),
      ),
    ).call(content);

    final expectedResult = [
      HardCodedStringSource(
        start: 495,
        end: 512,
        child: r"""Hello, $userName!""",
        children: [],
      ),
      HardCodedStringSource(
        start: 717,
        end: 769,
        child: r"""Total members summary: ${workSpace.members.join('')}""",
        children: [],
      ),
      HardCodedStringSource(
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
      HardCodedStringSource(
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
    ];
    expect(res, expectedResult);

    // print('${res.length} & ${expectedResult.length}');
    // print(res.join('\n'));
    // expect('$res', '$expectedResult');
    // for (final HardCodedStringSource string in res) {
    //   print(string);
    // }
  });
}

const String _textLayer1 = r'''final String personsListage6 =
      'Lets see:\n${persons.map((p) => 'Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) {
            return "Name: ${e.name}";
          })}').toList()}';''';
// const String _textLayer2 =
//     r'''Lets see:\n${persons.map((p) => 'Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) {
//             return e.name;
//           })}';
// }).toList()}''';
const String _textLayer3 = r'''Lets see:\n${persons.map((p) {
    return 'Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) {
      return "Name: ${e.name}";
    })}';
  }).toList()}''';
// const String _textLayer4 = r'''persons.map((p) {
//     return 'Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) {
//       return e.name;
//     })}';
//   }).toList()''';


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