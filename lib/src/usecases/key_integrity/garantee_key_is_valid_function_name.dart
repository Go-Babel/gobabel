import 'package:gobabel/src/usecases/key_integrity/garantee_key_integrity.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

Result<ProcessedKeyIntegrity> garanteeKeyIsValidFunctionName({
  required TranslationKey key,
}) {
  // Thease parts will throw the error "expected_identifier_but_got_keyword" if used as a function name
  // so if funcName is exactly one of these parts, we will append "Func" to it.
  final List<String> invalidFuncNames = [
    'assert',
    'break',
    'case',
    'catch',
    'class',
    'const',
    'continue',
    'default',
    'do',
    'else',
    'enum',
    'extends',
    'false',
    'final',
    'finally',
    'for',
    'if',
    'in',
    'is',
    'new',
    'null',
    'rethrow',
    'return',
    'super',
    'switch',
    'this',
    'throw',
    'true',
    'try',
    'var',
    'void',
    'while',
    'with',
  ];

  if (invalidFuncNames.contains(key)) {
    key += '_';
  }

  return key.toSuccess();
}
