import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/models/hard_coded_string_source.dart';

import 'package:gobabel/src/scripts/analyse_codebase_related/validate_candidate_string.dart';

class GetHarcodedStringsUsecase {
  final ValidateCandidateStringUsecase validateCandidateStringUsecase;
  const GetHarcodedStringsUsecase({
    required this.validateCandidateStringUsecase,
  });

  List<HardCodedStringSource> call(String text, {bool isRoot = true}) {
    final List<HardCodedStringSource> hardcodedStrings = [];
    const String charStart1 = "'";
    const String charStart2 = '"';

    String penultimateChar = '';
    String lastChar = '';

    // That is, "${" string. Anything inside here should be ignored because we can habe another string inside it.
    int quantityOfOpenGroupInString = 0;

    /// If null, meens that we are not inside a hardcoded string.
    /// If yes, we are inside and need to write each char inside the
    /// [buffer] until we find the end of the string and then add them
    /// into [hardcodedStrings] list before settings this value to null
    /// and clearing the buffer before start seeking for another hardcoded string.
    String? stringChartSelectec;

    int bufferStartIndex = 0;

    // If is inside comment, we should ignore the hardcoded strings and string indicators.
    bool isInsideCommentLine = false;
    int comentBlocIndex = 0;

    int index = -1;
    for (final String currChar in text.split('')) {
      final recent = '$penultimateChar$lastChar$currChar';
      index++;
      final alreadyHaveOpenDelimiter = stringChartSelectec != null;

      final isCommentBlocStart =
          currChar == '/' &&
          lastChar == '*' &&
          !alreadyHaveOpenDelimiter &&
          isRoot;
      if (isCommentBlocStart) {
        comentBlocIndex++;
      }
      final isCommentBlocEnd =
          currChar == '*' &&
          lastChar == '/' &&
          !alreadyHaveOpenDelimiter &&
          isRoot;
      if (isCommentBlocEnd) {
        comentBlocIndex--;
      }

      final isCurrCharLineBreak = currChar == '\n';
      if (isCurrCharLineBreak) {
        isInsideCommentLine = false;
      }

      final isStartComment =
          currChar == '/' &&
          lastChar == '/' &&
          !alreadyHaveOpenDelimiter &&
          isRoot;
      if (isStartComment) {
        isInsideCommentLine = true;
        continue;
      }

      final isInCommentArea =
          (isInsideCommentLine || comentBlocIndex > 0) && isRoot;

      final isOpenBraketChar =
          (currChar == '{' && lastChar == r'$' && penultimateChar != r'\') ||
          (currChar == '{' && lastChar == r' ' && penultimateChar == r')');
      final willIncreseOpenGroupQuantity =
          isOpenBraketChar && !isInCommentArea && alreadyHaveOpenDelimiter;
      if (willIncreseOpenGroupQuantity) {
        quantityOfOpenGroupInString++;
      }
      // if (isOpenBraketChar) {
      //   print(
      //       '${'OPEN  ($quantityOfOpenGroupInString) >>> $willIncreseOpenGroupQuantity = $isOpenBraketChar && ${!isInCommentArea} && $alreadyHaveOpenDelimiter'.padRight(45)}(${text.substring(index - 5, index + 1)})');
      // }
      final isCloseBraketChar = currChar == '}' && lastChar != r'\';
      final willDecreseOpenGroupQuantity =
          isCloseBraketChar && !isInCommentArea && alreadyHaveOpenDelimiter;
      if (willDecreseOpenGroupQuantity) {
        quantityOfOpenGroupInString--;
      }
      // if (isCloseBraketChar) {
      //   print(
      //       '${'CLOSE ($quantityOfOpenGroupInString) >>> $willDecreseOpenGroupQuantity = $isCloseBraketChar && ${!isInCommentArea} && $alreadyHaveOpenDelimiter'.padRight(45)}(${text.substring(index - 5, index + 1)})');
      // }
      final isPrevCancelChar = lastChar == r'\';

      final isCurrCharStringDelimiter =
          currChar == charStart1 || currChar == charStart2;
      final isNotInsideOrMapArrayLoop = quantityOfOpenGroupInString == 0;
      final noOpenDelimiterSettedYet = stringChartSelectec == null;
      final isCurrCharOpenString =
          noOpenDelimiterSettedYet &&
          isCurrCharStringDelimiter &&
          isNotInsideOrMapArrayLoop &&
          !isInCommentArea &&
          !isPrevCancelChar;

      /// If open is ', close needs to be the same. Same thing for strings with double quotes.
      final isSameCharAsOpen = currChar == stringChartSelectec;
      final isCurrCharCloseString =
          isCurrCharStringDelimiter &&
          alreadyHaveOpenDelimiter &&
          isNotInsideOrMapArrayLoop &&
          isSameCharAsOpen &&
          !isInCommentArea &&
          !isPrevCancelChar;

      if (isCurrCharOpenString) {
        stringChartSelectec = currChar;
        bufferStartIndex = index + 1;
      }
      if (currChar == "'") {
        print('entered at $index, $recent'.hotPink);
      }

      if (isCurrCharCloseString) {
        final content = text.substring(bufferStartIndex, index);
        final startIndex = index - 51;
        final bool isValidString = validateCandidateStringUsecase(
          content: content,
          last50CharsBeforeContent: text.substring(
            startIndex < 0 ? 0 : startIndex,
            index - 1,
          ),
        );
        if (isValidString) {
          hardcodedStrings.add(
            HardCodedStringSource(
              start: bufferStartIndex,
              end: index,
              child: content,
              children: call(content, isRoot: false),
            ),
          );
        }
        stringChartSelectec = null;
        bufferStartIndex = index;
      }

      penultimateChar = lastChar;
      lastChar = currChar;
    }

    return hardcodedStrings;
  }
}
