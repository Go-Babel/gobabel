import 'dart:io';

import 'package:gobabel/src/usecases/codebase_analyse_related/dart_fix_format_usecase.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/move_hardcoded_string_in_funtion_param.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/move_hardcoded_string_param_case.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/remove_adjacent_string_concatenation.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/remove_const_of_constructors_with_default_string_in_parameter.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/remove_const_of_lists_that_contain_hardcoded_strings.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/resolve_enum_hardcoded_string_variables.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<Unit> normalizeCodeBase({
  required String dirPath,
  required List<File> targetFiles,
}) async {
  //
  return multiRemoveAdjacentStringLiteralConcatenationUsecase(
        targetFiles: targetFiles,
      )
      .flatMap(
        (_) =>
            multiResolveEnumHardcodedStringsUsecase(targetFiles: targetFiles),
      )
      .flatMap(
        (_) => multiDartFixFormatUsecase(
          dirrPath: dirPath,
          targetFiles: targetFiles,
        ),
      )
      .flatMap(
        (_) => multiMoveHardcodedStringInFuntionParamUsecase(
          targetFiles: targetFiles,
        ),
      )
      .flatMap(
        (_) => multiMoveHardCodedStringParamUseCase(targetFiles: targetFiles),
      )
      .flatMap(
        (_) =>
            multiRemoveConstOfListsSetsAndMapThatContainHardcodedStringsInside(
              targetFiles: targetFiles,
            ),
      )
      .flatMap(
        (_) => multiFileRemoveConstOfConstructorsWithDefaultStringInParameter(
          targetFiles: targetFiles,
        ),
      );
}
