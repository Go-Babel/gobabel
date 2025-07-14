import 'package:gobabel/src/models/extract_hardcode_string/hardcoded_string_dynamic_value_entity.dart';

class HardcodedStringEntity {
  final String value;
  final String filePath;
  final int? parentStartIndex;
  final int? parentEndIndex;
  final int fileStartIndex;
  final int fileEndIndex;
  final List<HardcodedStringDynamicValue> dynamicFields;

  const HardcodedStringEntity({
    required this.value,
    required this.filePath,
    this.parentStartIndex,
    this.parentEndIndex,
    required this.fileStartIndex,
    required this.fileEndIndex,
    required this.dynamicFields,
  });

  Map<String, dynamic> toMap() => {
    'value': value,
    'filePath': filePath,
    'parentStartIndex': parentStartIndex,
    'parentEndIndex': parentEndIndex,
    'fileStartIndex': fileStartIndex,
    'fileEndIndex': fileEndIndex,
    'dynamicFields': dynamicFields.map((d) => d.toMap()).toList(),
  };

  factory HardcodedStringEntity.fromMap(Map<String, dynamic> map) {
    return HardcodedStringEntity(
      value: map['value'] as String,
      filePath: map['filePath'] as String,
      parentStartIndex: map['parentStartIndex'] as int?,
      parentEndIndex: map['parentEndIndex'] as int?,
      fileStartIndex: map['fileStartIndex'] as int,
      fileEndIndex: map['fileEndIndex'] as int,
      dynamicFields:
          (map['dynamicFields'] as List<dynamic>)
              .map(
                (e) => HardcodedStringDynamicValue.fromMap(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory HardcodedStringEntity.fromJson(Map<String, dynamic> json) =>
      HardcodedStringEntity.fromMap(json);
}
