import 'dart:convert';

class JsonKeyWithLineInfo {
  final String key;
  final dynamic value;
  final int lineNumber;

  const JsonKeyWithLineInfo({
    required this.key,
    required this.value,
    required this.lineNumber,
  });
}

class JsonParserWithLineTracking {
  static Map<String, JsonKeyWithLineInfo> parse(String jsonContent) {
    final Map<String, JsonKeyWithLineInfo> result = {};
    
    // First, validate that it's valid JSON
    final dynamic decoded = jsonDecode(jsonContent);
    if (decoded is! Map<String, dynamic>) {
      throw FormatException('JSON content must be an object');
    }
    
    // Now parse line by line to track positions
    final lines = jsonContent.split('\n');
    final keyPattern = RegExp(r'^\s*"([^"]*)"\s*:\s*(.+?)\s*(?:,\s*)?$');
    
    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];
      final match = keyPattern.firstMatch(line);
      
      if (match != null) {
        final key = match.group(1)!;
        // Line numbers are 1-based for user display
        final lineNumber = i + 1;
        
        // Get the actual value from the decoded JSON
        if (decoded.containsKey(key)) {
          result[key] = JsonKeyWithLineInfo(
            key: key,
            value: decoded[key],
            lineNumber: lineNumber,
          );
        }
      }
    }
    
    return result;
  }
}