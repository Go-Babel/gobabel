class HardcodedStringDynamicValue {
  final String value;
  final int parentStartIndex;
  final int parentEndIndex;
  final int fileStartIndex;
  final int fileEndIndex;

  const HardcodedStringDynamicValue({
    required this.value,
    required this.parentStartIndex,
    required this.parentEndIndex,
    required this.fileStartIndex,
    required this.fileEndIndex,
  });

  Map<String, dynamic> toMap() => {
    'value': value,
    'parentStartIndex': parentStartIndex,
    'parentEndIndex': parentEndIndex,
    'fileStartIndex': fileStartIndex,
    'fileEndIndex': fileEndIndex,
  };

  factory HardcodedStringDynamicValue.fromMap(Map<String, dynamic> map) {
    return HardcodedStringDynamicValue(
      value: map['value'] as String,
      parentStartIndex: map['parentStartIndex'] as int,
      parentEndIndex: map['parentEndIndex'] as int,
      fileStartIndex: map['fileStartIndex'] as int,
      fileEndIndex: map['fileEndIndex'] as int,
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory HardcodedStringDynamicValue.fromJson(Map<String, dynamic> json) =>
      HardcodedStringDynamicValue.fromMap(json);
}
