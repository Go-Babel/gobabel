import 'package:gobabel/src/usecases/codebase_analyse_related/move_hardcoded_string_param_case.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:test/test.dart';

void main() {
  group('should handle as optional positional parameters expected', () {
    test('Should handle constructor with Positional Optional Parameters', () {
      final target = '''class Person {
  final String name;
  const Person([this.name = 'Unknown']);
}''';
      final expected = '''class Person {
  final String name;
  const Person([String? name]) : name = name ?? 'Unknown';
}''';
      final result = singleMoveHardCodedStringParamUseCase(target);
      expect(result, expected);
    });
  });
  group('singleMoveHardCodedStringParamUseCase', () {
    group('Basic single parameter transformations', () {
      test('transforms simple constructor with default string parameter', () {
        final target = '''class MyTestWidget extends StatelessWidget {
  final String title;
  MyTestWidget({Key? key, this.title = 'Default Title'}) : super(key: key);
}''';
        final expected = '''class MyTestWidget extends StatelessWidget {
  final String title;
  MyTestWidget({Key? key, String? title}) : title = title ?? 'Default Title', super(key: key);
}''';
        final result = singleMoveHardCodedStringParamUseCase(target);
        expect(result, expected);
      });

      test('transforms constructor with SimpleFormalParameter', () {
        final target = '''class MyWidget {
  final String name;
  MyWidget({String name = 'Default Name'}) : name = name;
}''';
        final expected = '''class MyWidget {
  final String name;
  MyWidget({String? name}) : name = name ?? 'Default Name';
}''';
        final result = singleMoveHardCodedStringParamUseCase(target);
        expect(result, expected);
      });

      test('transforms constructor with empty string default', () {
        final target = '''class MyWidget {
  final String text;
  MyWidget({this.text = ''});
}''';
        final expected = '''class MyWidget {
  final String text;
  MyWidget({String? text}) : text = text ?? '';
}''';
        final result = singleMoveHardCodedStringParamUseCase(target);
        expect(result, expected);
      });

      test('preserves const keyword in constructor', () {
        final target = '''class MyWidget {
  final String label;
  const MyWidget({this.label = 'Label'});
}''';
        final expected = '''class MyWidget {
  final String label;
  const MyWidget({String? label}) : label = label ?? 'Label';
}''';
        final result = singleMoveHardCodedStringParamUseCase(target);
        expect(result, expected);
      });
    });

    group('Multiple parameters and mixed scenarios', () {
      test('transforms multiple parameters with string defaults', () {
        final target = '''class MyWidget {
  final String title;
  final String subtitle;
  MyWidget({this.title = 'Title', this.subtitle = 'Subtitle'});
}''';
        final expected = '''class MyWidget {
  final String title;
  final String subtitle;
  MyWidget({String? title, String? subtitle}) : title = title ?? 'Title', subtitle = subtitle ?? 'Subtitle';
}''';
        final result = singleMoveHardCodedStringParamUseCase(target);
        expect(result, expected);
      });

      test('handles mix of parameters with and without defaults', () {
        final target = '''class MyWidget {
  final String title;
  final int count;
  final String label;
  MyWidget({this.title = 'Default', required this.count, this.label = 'Label'});
}''';
        final expected = '''class MyWidget {
  final String title;
  final int count;
  final String label;
  MyWidget({String? title, required this.count, String? label}) : title = title ?? 'Default', label = label ?? 'Label';
}''';
        final result = singleMoveHardCodedStringParamUseCase(target);
        expect(result, expected);
      });

      test('preserves non-string default values', () {
        final target = '''class MyWidget {
  final String text;
  final int number;
  final bool flag;
  MyWidget({this.text = 'Hello', this.number = 42, this.flag = true});
}''';
        final expected = '''class MyWidget {
  final String text;
  final int number;
  final bool flag;
  MyWidget({String? text, this.number = 42, this.flag = true}) : text = text ?? 'Hello';
}''';
        final result = singleMoveHardCodedStringParamUseCase(target);
        expect(result, expected);
      });
    });

    group('Named constructors and special cases', () {
      test('transforms named constructor', () {
        final target = '''class MyWidget {
  final String name;
  MyWidget.named({this.name = 'Named'});
}''';
        final expected = '''class MyWidget {
  final String name;
  MyWidget.named({String? name}) : name = name ?? 'Named';
}''';
        final result = singleMoveHardCodedStringParamUseCase(target);
        expect(result, expected);
      });

      test('handles constructor with existing initializer list', () {
        final target = '''class MyWidget extends BaseWidget {
  final String title;
  final int id;
  MyWidget({this.title = 'Title', required this.id}) : super(id: id);
}''';
        final expected = '''class MyWidget extends BaseWidget {
  final String title;
  final int id;
  MyWidget({String? title, required this.id}) : title = title ?? 'Title', super(id: id);
}''';
        final result = singleMoveHardCodedStringParamUseCase(target);
        expect(result, expected);
      });

      test('handles multiple constructors in same class', () {
        final target = '''class MyWidget {
  final String name;
  MyWidget({this.name = 'Default'});
  MyWidget.secondary({this.name = 'Secondary'});
}''';
        final expected = '''class MyWidget {
  final String name;
  MyWidget({String? name}) : name = name ?? 'Default';
  MyWidget.secondary({String? name}) : name = name ?? 'Secondary';
}''';
        final result = singleMoveHardCodedStringParamUseCase(target);
        expect(result, expected);
      });
    });

    group('No transformation cases', () {
      test('returns original source when no string defaults', () {
        final target = '''class MyWidget {
  final String title;
  final int count;
  MyWidget({required this.title, this.count = 0});
}''';
        final result = singleMoveHardCodedStringParamUseCase(target);
        expect(result, target);
      });

      test('returns original source for empty constructor', () {
        final target = '''class MyWidget {
  MyWidget();
}''';
        final result = singleMoveHardCodedStringParamUseCase(target);
        expect(result, target);
      });

      test('returns original source when no constructors', () {
        final target = '''class MyWidget {
  final String title = 'Default';
  void doSomething() {}
}''';
        final result = singleMoveHardCodedStringParamUseCase(target);
        expect(result, target);
      });
    });

    group('Special characters and escaping', () {
      test('handles strings with single quotes inside', () {
        final target = '''class MyWidget {
  final String text;
  MyWidget({this.text = "It's working"});
}''';
        final expected = '''class MyWidget {
  final String text;
  MyWidget({String? text}) : text = text ?? "It's working";
}''';
        final result = singleMoveHardCodedStringParamUseCase(target);
        expect(result, expected);
      });

      test('handles strings with escape sequences', () {
        final target = '''class MyWidget {
  final String text;
  MyWidget({this.text = 'Line 1\\nLine 2'});
}''';
        final expected = '''class MyWidget {
  final String text;
  MyWidget({String? text}) : text = text ?? 'Line 1\\nLine 2';
}''';
        final result = singleMoveHardCodedStringParamUseCase(target);
        expect(result, expected);
      });
    });

    group('Error handling', () {
      test('throws BabelException for invalid Dart syntax', () {
        final target = '''class MyWidget {
  final String title
  MyWidget({this.title = 'Default'});
}'''; // Missing semicolon

        expect(
          () => singleMoveHardCodedStringParamUseCase(target),
          throwsA(isA<BabelException>()),
        );
      });

      test('throws BabelException for incomplete code', () {
        final target = '''class MyWidget {
  final String title;
  MyWidget({this.title = 'Default'
}'''; // Missing closing braces

        expect(
          () => singleMoveHardCodedStringParamUseCase(target),
          throwsA(isA<BabelException>()),
        );
      });
    });

    group('Complex real-world scenarios', () {
      test('handles Flutter widget with multiple features', () {
        final target = '''class CustomButton extends StatelessWidget {
  final String text;
  final String? tooltip;
  final IconData icon;
  final VoidCallback onPressed;
  
  const CustomButton({
    Key? key,
    this.text = 'Click me',
    this.tooltip,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
}''';
        final expected = '''class CustomButton extends StatelessWidget {
  final String text;
  final String? tooltip;
  final IconData icon;
  final VoidCallback onPressed;
  
  const CustomButton({
    Key? key,
    String? text,
    this.tooltip,
    required this.icon,
    required this.onPressed,
  }) : text = text ?? 'Click me', super(key: key);
}''';
        final result = singleMoveHardCodedStringParamUseCase(target);
        expect(result, expected);
      });

      test('handles factory constructor (should not transform)', () {
        final target = '''class MyWidget {
  final String name;
  MyWidget._({required this.name});
  
  factory MyWidget({String name = 'Default'}) {
    return MyWidget._(name: name);
  }
}''';
        final result = singleMoveHardCodedStringParamUseCase(target);
        expect(
          result,
          target,
        ); // Factory constructors should not be transformed
      });
    });
  });
}
