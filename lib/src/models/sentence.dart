import 'package:freezed_annotation/freezed_annotation.dart';

part 'sentence.freezed.dart';

@freezed
abstract class Sentence with _$Sentence {
  factory Sentence.regularLabel({
    required String text,
  }) = _SentenceLabel;

  factory Sentence.string({
    required String text,
  }) = _SentenceString;
}
