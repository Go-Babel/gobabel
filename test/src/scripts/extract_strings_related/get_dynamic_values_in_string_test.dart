import 'package:gobabel/src/scripts/extract_strings_related/get_dynamic_values_in_string.dart';
import 'package:test/test.dart';

void main() {
  final GetDynamicValuesInStringUsecase getDynamicValuesInStringUsecase =
      GetDynamicValuesInStringUsecase();

  test('Should return all variables of test text', () {
    final result = getDynamicValuesInStringUsecase(_testString);
    for (final dynamicValue in result) {
      print(dynamicValue);
    }
  });
}

final _testString =
    r'''The $accountId  of ${e.full_name} with ${e.age} father ${name} of ${e.children.map((c) => c.name)}  the maniac $uga_player that ${made_that_work} btw, lets try with more ordenary strings like ${p.children.map(e) => e.friends.map((f) => f.name} lets next

Children: ${p.children.map((e) {
            return e.name;
          })}

69, (69), (69''';

/*
(singleVariable)   startIndex: 5   , endIndex: 14  , variableName: "accountId"                          , variableContent: "accountId "
(compostVariable)  startIndex: 20  , endIndex: 32  , variableName: "eFullName"                          , variableContent: "{e.full_name}"
(compostVariable)  startIndex: 40  , endIndex: 46  , variableName: "eAge"                               , variableContent: "{e.age}"
(compostVariable)  startIndex: 56  , endIndex: 61  , variableName: "name"                               , variableContent: "{name}"
(compostVariable)  startIndex: 67  , endIndex: 97  , variableName: "eChildrenMapCCName"                 , variableContent: "{e.children.map((c) => c.name)}"
(singleVariable)   startIndex: 112 , endIndex: 122 , variableName: "ugaPlayer"                          , variableContent: "uga_player "
(compostVariable)  startIndex: 129 , endIndex: 144 , variableName: "madeThatWork"                       , variableContent: "{made_that_work}"
(compostVariable)  startIndex: 193 , endIndex: 242 , variableName: "pChildrenMapEEFriendsMapFFName"     , variableContent: "{p.children.map(e) => e.friends.map((f) => f.name}"
(compostVariable)  startIndex: 266 , endIndex: 327 , variableName: "pChildrenMapEReturnEName"           , variableContent: "{p.children.map((e) {
            return e.name;
          })}"
*/
