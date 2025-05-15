import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/get_dynamic_values_in_string.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/get_harcoded_strings.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/map_strings.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/retrive_all_aibabel_consts_from_file.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/update_dart_file_content_strings.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/validate_candidate_string.dart';
import 'package:test/test.dart';

import '../../utls/dependencies_class_binding.dart';

void main() {
  setUp(() {
    setDependenciesMock();
  });

  test('update dart file content strings ...', () async {
    final targetPath =
        '${Directory.current.path}/test/src/scripts/extract_strings_related/test_hardcoded_file.dart';
    // '/Users/igormidev/Documents/work/dsf-player-getter/dsf_commum_data_source/lib/src/repositories/fetch_championship_average/auxiliar_functions/evaluate_season_match_info.dart';

    final File file = File(targetPath);
    final String content = await file.readAsString();
    final res = ReplaceHardCodedStringsForBabelTextUsecase(
      getHarcodedStringsUsecase: GetHarcodedStringsUsecase(
        validateCandidateStringUsecase: ValidateCandidateStringUsecase(),
      ),
      mapStringsUsecase: MapStringsUsecase(
        getDynamicValuesInStringUsecase: GetDynamicValuesInStringUsecase(),
      ),
      retriveAllAibabelConstsFromFile: RetriveAllAibabelConstsFromFile(),
    ).call(
      fileAsString: content,
      filePath:
          'src/scripts/extract_strings_related/update_dart_file_content_strings_test.dart',
    );

    final route = '''class BabelText {

    static String _getByKey(String key) {
      return '';
    }

${Dependencies.allDeclarationFunctions.join('\n\n').orange}
}''';

    print(
      (res.green + route.skyBlue).replaceAll(
        'depend_on_referenced_packages',
        'depend_on_referenced_packages, non_constant_identifier_names',
      ),
    );
  });
}
