import 'package:test/test.dart';

void main() {
  group('String Regex Tests', () {
    final stringRegex = RegExp(
        r"""(r?"(?:[^"\\]|\\.)*?"|r?'(?:[^'\\]|\\.)*?')""",
        multiLine: true); // Modified to include raw strings (r"..." or r'...')

    test('Simple String', () {
      final text = 'String a = "Hello";';
      final match = stringRegex.firstMatch(text);
      expect(match?.group(0), equals('"Hello"'));
    });

    test('String with Escaped Characters', () {
      final text = 'String b = "Hello \\"World\\"!";';
      final match = stringRegex.firstMatch(text);
      expect(match?.group(0), equals('"Hello \\"World\\"!"'));
    });

    test('String with Newline', () {
      final text = 'String c = "Hello\nWorld!";';
      final match = stringRegex.firstMatch(text);
      expect(match?.group(0), equals('"Hello\nWorld!"'));
    });

    test('Single Quoted String', () {
      final text = 'String d = \'Hello\';';
      final match = stringRegex.firstMatch(text);
      expect(match?.group(0), equals('\'Hello\''));
    });

    test('Single Quoted String with Escaped Quote', () {
      final text = 'String e = \'Hello \\\'World\\\'!\';';
      final match = stringRegex.firstMatch(text);
      expect(match?.group(0), equals('\'Hello \\\'World\\\'!\''));
    });

    test('String with Interpolation (requires additional processing)', () {
      final text = 'String f = "Hello \$name!";';
      final match = stringRegex.firstMatch(text);
      expect(
          match?.group(0),
          equals(
              '"Hello \$name!"')); //Correctly matches the whole string literal

      final text2 = 'String g = "Hello \${name.toUpperCase()}!";';
      final match2 = stringRegex.firstMatch(text2);
      expect(
          match2?.group(0),
          equals(
              '"Hello \${name.toUpperCase()}!"')); //Correctly matches the whole string literal

      final text3 = 'String h = \'Hello \${name.toUpperCase()}!\';';
      final match3 = stringRegex.firstMatch(text3);
      expect(
          match3?.group(0),
          equals(
              '\'Hello \${name.toUpperCase()}!\'')); //Correctly matches the whole string literal
    });

    test('Raw String (Double Quotes)', () {
      final text = 'String i = r"Hello \$name!";';
      final match = stringRegex.firstMatch(text);
      expect(match?.group(0), equals('r"Hello \$name!"'));
    });

    test('Raw String (Single Quotes)', () {
      final text = 'String j = r\'Hello \$name!\';';
      final match = stringRegex.firstMatch(text);
      expect(match?.group(0), equals('r\'Hello \$name!\''));
    });

    test('String with Multiple Strings', () {
      final text = 'String k = "Hello"; String l = \'World\'; String m = "!";';
      final matches = stringRegex.allMatches(text);
      expect(matches.map((e) => e.group(0)).toList(),
          equals(['"Hello"', '\'World\'', '"!"']));
    });

    test('Multiline String', () {
      final text = '''
        String n = """
        Hello
        World!
        """;
      ''';
      final match = stringRegex.firstMatch(text);
      // This will match only up to the first quote in a multiline string.
      expect(
          match?.group(0),
          equals(
              '"""')); //This is because Dart only truly has single-line string literals identified with single and double quotes.  Multiline strings are string literals that span across multiple lines of code.
    });

    test('String with Comments', () {
      final text = '''
        String o = "Hello"; // This is a string
        String p = 'World'; /* Another string */
      ''';
      final matches = stringRegex.allMatches(text);
      expect(matches.map((e) => e.group(0)).toList(),
          equals(['"Hello"', '\'World\'']));
    });

    test('String in Complex Code', () {
      final text = '''
        class MyClass {
          String name = "Default Name";
          void sayHello() {
            print('Hello, \$name!');
            print(r"Raw String");
            print("Another string");
          }
        }
      ''';
      final matches = stringRegex.allMatches(text);
      expect(
          matches.map((e) => e.group(0)).toList(),
          equals([
            '"Default Name"',
            "'Hello, \$name!'",
            'r"Raw String"',
            '"Another string"'
          ]));
    });

    test('Empty String', () {
      final text = 'String q = "";';
      final match = stringRegex.firstMatch(text);
      expect(match?.group(0), equals('""'));
    });

    test('Empty Single Quoted String', () {
      final text = 'String r = \'\';';
      final match = stringRegex.firstMatch(text);
      expect(match?.group(0), equals('\'\''));
    });

    test('String with Backslash at the End', () {
      final text = 'String s = "Hello\\";';
      final match = stringRegex.firstMatch(text);
      expect(match?.group(0), equals('"Hello\\\\"')); //Escaped backslash
    });

    test('String with Backslash and Quote', () {
      final text = 'String t = "Hello\\"";';
      final match = stringRegex.firstMatch(text);
      expect(match?.group(0), equals('"Hello\\""')); //Escaped quote
    });

    test('String followed by another string without space', () {
      final text = 'String u = "Hello""World";';
      final matches = stringRegex.allMatches(text);
      expect(matches.map((e) => e.group(0)).toList(),
          equals(['"Hello"', '"World"']));
    });

    test('Escaped Dollar Sign', () {
      final text = 'String v = "The price is \\\$10";';
      final match = stringRegex.firstMatch(text);
      expect(match?.group(0), equals('"The price is \\\$10"'));
    });

    test('Raw String containing a quote character that matches outer quotes',
        () {
      final text = 'String w = r"This contains a quote "";';
      final match = stringRegex.firstMatch(text);
      expect(match?.group(0), equals('r"This contains a quote \\""'));

      final text2 = 'String x = r\'This contains a quote \\\'\';';
      final match2 = stringRegex.firstMatch(text2);
      expect(match2?.group(0), equals('r\'This contains a quote \\\'\''));
    });

    test('String with triple quotes', () {
      final text = 'String triple = """Hello""";';
      final match = stringRegex.firstMatch(text);
      expect(match?.group(0),
          equals('"""')); // Matches the opening triple quotes only
    });

    test('String with triple single quotes', () {
      final text = "String tripleSingle = '''Hello''';";
      final match = stringRegex.firstMatch(text);
      expect(match?.group(0),
          equals("'''")); // Matches the opening triple quotes only
    });
  });
}
