// Will see if a string is a displayable text for the final user or if
// is just a configuration string. Such as a key of a map, a fromJson string,
// a toString() string, etc. Mainly, anything that is cammelCase.
import 'package:gobabel/src/core/extensions/string_extensions.dart';
import 'package:gobabel/src/core/utils/case_identify.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/get_dynamic_values_in_string.dart';

class ValidateCandidateStringUsecase {
  final GetDynamicValuesInStringUsecase getDynamicValuesInStringUsecase;
  const ValidateCandidateStringUsecase({
    required this.getDynamicValuesInStringUsecase,
  });

  /// Returns true if the string is a displayable text for the final user.
  bool call({
    required String content,
    required String last50CharsBeforeContent,
  }) {
    return hasNoWords(content) == false &&
        CaseIdentifyRegex.isAnyCase(content) == false &&
        validateOtherMappedSenarios(last50CharsBeforeContent) &&
        isUrl(content) == false;
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
    return RegExp(r'\w+\[$', multiLine: true).hasMatch(lastChars);
  }

  @visibleForTesting
  bool isUrl(String source) {
    const pattern =
        r'^(?:[a-zA-Z-\/\\:.]{1,7}?:?\/?\/?)?-?(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z]{1,}(?::\d{1,5})?(?:\/[^\s#?]*)?(?:\?[^#\s]*)?(?:#[^\s]*)?[-\/\\:.]*$';
    // const pattern = r'^(?:https?://)?'            // optional http or https scheme
    //                      r'(?:[A-Za-z0-9]'        // domain labels: start with alphanumeric
    //                      r'(?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+' // optional hyphens inside, then dot
    //                      r'[A-Za-z]{2,}'          // top-level domain (min. 2 letters)
    //                      r'(?::\d{1,5})?'        // optional port
    //                      r'(?:/[^\s#?]*)?'       // optional path
    //                      r'(?:\?[^#\s]*)?'      // optional query
    //                      r'(?:#[^\s]*)?'         // optional fragment
    //                      r'\$';                   // end of string

    final regex = RegExp(pattern, caseSensitive: false);
    final result = regex.hasMatch(source);
    return result;
  }
}
