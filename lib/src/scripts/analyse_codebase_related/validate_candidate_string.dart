// Will see if a string is a displayable text for the final user or if
// is just a configuration string. Such as a key of a map, a fromJson string,
// a toString() string, etc. Mainly, anything that is cammelCase.
import 'package:gobabel/src/core/extensions/string_extensions.dart';
import 'package:gobabel/src/core/utils/case_identify.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ValidateCandidateStringUsecase {
  /// Returns true if the string is a displayable text for the final user.
  bool call({
    required String content,
    required String last50CharsBeforeContent,
  }) {
    return hasNoWords(content) == false &&
        CaseIdentifyRegex.isAnyCase(content) == false &&
        validateOtherMappedSenarios(last50CharsBeforeContent);
  }

  @visibleForTesting
  bool hasNoWords(String input) {
    return RegExp(r'^[^a-zA-Z0-9]+$').hasMatch(input) || input.isEmpty;
  }

  /// Common patters that dart developers write using string that we know
  /// are not a string for the final user.
  @visibleForTesting
  bool validateOtherMappedSenarios(String last50CharsBeforeContent) {
    if (last50CharsBeforeContent.isEmpty) return true;

    final clean = last50CharsBeforeContent.removeSpacesAndLineBreaks;

    return doLastCharsIndicateAToStringMethod(clean) == false &&
        doLastCharsIndicateAMapKey(last50CharsBeforeContent) == false;
  }

  @visibleForTesting
  bool doLastCharsIndicateAToStringMethod(String lastChars) {
    return lastChars.endsWith('@overrideStringtoString(){') ||
        lastChars.endsWith('@overrideStringtoString()=>');
  }

  @visibleForTesting
  bool doLastCharsIndicateAMapKey(String lastChars) {
    return RegExp(r'\w+\[$').hasMatch(lastChars);
  }
}
