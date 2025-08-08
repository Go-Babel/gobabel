import 'package:gobabel/src/usecases/hardcoded_string/validate_candidate_string.dart';
import 'package:test/test.dart';

void main() {
  test('Should not accept one letter and "a!"', () {
    final result = validateCandidateHardcodedString(content: 'a!');
    expect(result, isFalse);
  });
}
