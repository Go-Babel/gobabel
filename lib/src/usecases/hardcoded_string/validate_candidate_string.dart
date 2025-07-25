// Will see if a string is a displayable text for the final user or if
// is just a configuration string. Such as a key of a map, a fromJson string,
// a toString() string, etc. Mainly, anything that is cammelCase.
// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel_core/gobabel_core.dart';

bool validateCandidateHardcodedString({required String content}) {
  return content.length != 1 &&
      content.length <= MAX_SENTENCE_LENGTH &&
      hasNoWords(content) == false &&
      CaseIdentifyRegex.isAnyCase(content) == false &&
      isUrl(content) == false;
}

const MAX_SENTENCE_LENGTH = 1000;

@visibleForTesting
bool hasNoWords(String input) {
  return input.isEmpty || RegExp(r'^[^a-zA-Z]+$').hasMatch(input);
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
