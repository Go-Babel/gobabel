// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:gobabel/src/core/extensions/string_extensions.dart';

class GetDynamicValuesInStringUsecase {
  List<DynamicValueSection> call(String text) {
    final List<DynamicValueSection> dynamicValues = [];
    String penultimateChar = '';
    String lastChar = '';

    // That is, "${" string. Anything inside here should be ignored because we can habe another string inside it.
    int quantityOfOpenGroupInString = 0;

    int bufferStartIndex = 0;
    // final StringBuffer buffer = StringBuffer();

    int index = -1;

    // If is inside comment, we should ignore the hardcoded strings and string indicators.
    bool isInsideCommentLine = false;
    int comentBlocIndex = 0;

    // bool isInsideDynamicValue = false;
    DynamicValueSectionType? type;

    final isEndOfUniqueDynamicValueRegex = RegExp(r'\W');

    final chars = text.split('');
    for (final String currChar in chars) {
      index++;

      final isCommentBlocStart = currChar == '/' && lastChar == '*';
      if (isCommentBlocStart) {
        comentBlocIndex++;
      }
      final isCommentBlocEnd = currChar == '*' && lastChar == '/';
      if (isCommentBlocEnd) {
        comentBlocIndex--;
      }
      final isCurrCharLineBreak = currChar == '\n';
      if (isCurrCharLineBreak) {
        isInsideCommentLine = false;
      }

      final isStartComment = currChar == '/' && lastChar == '/';
      if (isStartComment) {
        isInsideCommentLine = true;
        continue;
      }

      final isInCommentArea = isInsideCommentLine || comentBlocIndex > 0;

      final isOpenSingleDynamicVariable =
          currChar != '{' && lastChar == r'$' && penultimateChar != r'\';
      final didNotSetTypeYet = type == null;
      final shouldSetSimpleVariable =
          isOpenSingleDynamicVariable && didNotSetTypeYet && !isInCommentArea;
      if (shouldSetSimpleVariable) {
        bufferStartIndex = index - 1;
        type = DynamicValueSectionType.singleVariable;
      }

      final isOpenDynamicFieldBraket =
          currChar == '{' && lastChar == r'$' && penultimateChar != r'\';
      if (isOpenDynamicFieldBraket && !isInCommentArea) {
        quantityOfOpenGroupInString++;
      }
      final isCloseBraket = currChar == '}' && lastChar != r'\';
      if (isCloseBraket && !isInCommentArea) {
        quantityOfOpenGroupInString--;
      }

      final isInsideComplexDynamicValue = quantityOfOpenGroupInString > 0;
      final isOpenDefaultBreaketInsideOpen =
          isInsideComplexDynamicValue &&
          !isOpenDynamicFieldBraket &&
          !isInCommentArea &&
          currChar == '{' &&
          lastChar != r'\';
      if (isOpenDefaultBreaketInsideOpen) {
        quantityOfOpenGroupInString++;
      }
      final shouldSetComposVariable =
          isInsideComplexDynamicValue && didNotSetTypeYet && !isInCommentArea;
      if (shouldSetComposVariable) {
        bufferStartIndex = index - 1;
        type = DynamicValueSectionType.compostVariable;
      }

      final isCompost = type == DynamicValueSectionType.compostVariable;
      final isLastChar = index == chars.length - 1;
      final haveType = type != null;
      final isBorder =
          isLastChar ||
          (isEndOfUniqueDynamicValueRegex.hasMatch(currChar) &&
              !isInsideComplexDynamicValue);
      final didEndDynamicValueDellimiter =
          !shouldSetSimpleVariable &&
          !shouldSetComposVariable &&
          haveType &&
          isBorder &&
          (!isCompost || (isCompost && !isInsideComplexDynamicValue));

      if (didEndDynamicValueDellimiter) {
        final targetIndex = (isCompost || isLastChar) ? index + 1 : index;
        final matchStringWithoutBuffer = text.substring(
          bufferStartIndex,
          targetIndex,
        );
        dynamicValues.add(
          DynamicValueSection(
            startIndex: bufferStartIndex,
            endIndex: targetIndex,
            variableName: matchStringWithoutBuffer.toCamelCase,
            variableContent: matchStringWithoutBuffer,
            type: type,
          ),
        );
        type = null;
        // buffer.clear();
        bufferStartIndex = index;
      }

      penultimateChar = lastChar;
      lastChar = currChar;

      // if (!isInCommentArea && type != null) {
      //   buffer.write(currChar);
      // }
    }

    return dynamicValues;
  }
}

class DynamicValueSection {
  final int startIndex;
  final int endIndex;
  final String variableName;
  final String variableContent;
  final DynamicValueSectionType type;
  const DynamicValueSection({
    required this.startIndex,
    required this.endIndex,
    required this.variableName,
    required this.variableContent,
    required this.type,
  });

  @override
  String toString() {
    return '${'(${type.name})'.padRight(18)} startIndex: ${startIndex.toString().padRight(4)}, endIndex: ${endIndex.toString().padRight(4)}, variableName: "${'$variableName"'.padRight(36)}, variableContent: "$variableContent"';
  }
}

enum DynamicValueSectionType {
  // Example: 'Welcome, $name'
  singleVariable,

  // Example: 'Welcome, ${user.name}'
  compostVariable,
}
