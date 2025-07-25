import 'package:gobabel/src/usecases/codebase_analyse_related/move_hardcoded_string_in_function_param.dart';
import 'package:test/test.dart';

void main() {
  group('MoveHardcodedStringInFuntionParamUsecase', () {
    test(
      'should move hardcoded string for a simple function with one named parameter',
      () {
        const inputCode = """
void printName({String name = 'John Doe'}) {
  print('Hello, \$name!');
}
""";
        const expectedOutput = r"""void printName({String? name }) {
  name ??= 'John Doe';

  print('Hello, $name!');
}
""";
        final result = singleMoveHardcodedStringInFuntionParamUsecase(
          inputCode,
        );

        expect(result, expectedOutput);
      },
    );

    test(
      'should move hardcoded strings for a function with multiple named parameters',
      () {
        const inputCode = """
Future<void> showConfirmationDialog({
  required BuildContext context,
  String title = 'Confirmation',
  String confirmButtonText = 'OK',
}) async {
  // Function logic...
}
""";
        const expectedOutput = """Future<void> showConfirmationDialog({
  required BuildContext context,
  String? title ,
  String? confirmButtonText ,
}) async {
  title ??= 'Confirmation';
  confirmButtonText ??= 'OK';
  // Function logic...
}
""";
        final result = singleMoveHardcodedStringInFuntionParamUsecase(
          inputCode,
        );

        expect(result, expectedOutput);
      },
    );

    test('should not modify function with no hardcoded string parameters', () {
      const inputCode = """
void greet(String name) {
  print('Hello, \$name!');
}
""";
      final result = singleMoveHardcodedStringInFuntionParamUsecase(inputCode);
      expect(result, inputCode);
    });

    test('should not modify function with non-string hardcoded parameter', () {
      const inputCode = """
void setAge({int age = 30}) {
  print('Age: \$age');
}
""";
      final result = singleMoveHardcodedStringInFuntionParamUsecase(inputCode);
      expect(result, inputCode);
    });

    test(
      'should move hardcoded string for a function with positional optional parameter',
      () {
        const inputCode = """
void printMessage([String message = 'Default message']) {
  print(message);
}
""";
        const expectedOutput = """void printMessage([String? message ]) {
  message ??= 'Default message';

  print(message);
}
""";
        final result = singleMoveHardcodedStringInFuntionParamUsecase(
          inputCode,
        );
        expect(result, expectedOutput);
      },
    );

    test('should correctly process a method within a class', () {
      const inputCode = """
class MyClass {
  void myMethod({String text = 'Hello World'}) {
    print(text);
  }
}
""";
      const expectedOutput = """class MyClass {
  void myMethod({String? text }) {
  text ??= 'Hello World';

    print(text);
  }
}
""";
      final result = singleMoveHardcodedStringInFuntionParamUsecase(inputCode);

      expect(result, expectedOutput);
    });

    test('should handle multiple functions in the input code', () {
      const inputCode = """
void func1({String val = 'One'}) {
  print(val);
}

void func2(int count) {
  print(count);
}

void func3({String msg = 'Two', String? detail}) {
  print('\$msg, \$detail');
}
""";
      const expectedOutput = r"""void func1({String? val }) {
  val ??= 'One';

  print(val);
}

void func2(int count) {
  print(count);
}

void func3({String? msg , String? detail}) {
  msg ??= 'Two';

  print('$msg, $detail');
}
""";
      final result = singleMoveHardcodedStringInFuntionParamUsecase(inputCode);

      expect(result, expectedOutput);
    });

    test('should handle function with expression body', () {
      const inputCode = """
String greet([String name = 'Guest']) => 'Hello, \$name!';
""";
      const expectedOutputAfterParamChange =
          r"""String greet([String? name ])  {
  name ??= 'Guest';
  return 'Hello, $name!';
}
""";
      final result = singleMoveHardcodedStringInFuntionParamUsecase(inputCode);
      print('Result: $result');
      expect(result, expectedOutputAfterParamChange);
    });

    test('should handle function with an empty body', () {
      const inputCode = """
void doSomething({String action = 'Nothing'}) {}
""";
      const expectedOutput = """void doSomething({String? action }) {
  action ??= 'Nothing';}
""";
      final result = singleMoveHardcodedStringInFuntionParamUsecase(inputCode);
      expect(result, expectedOutput);
    });

    test(
      'should correctly handle parameter order when default string is not last',
      () {
        const inputCode = """
void complexFunc({String name = 'Default', int age, String? address}) {
  print('\$name, \$age, \$address');
}
""";
        const expectedOutput =
            r"""void complexFunc({String? name , int age, String? address}) {
  name ??= 'Default';

  print('$name, $age, $address');
}
""";
        final result = singleMoveHardcodedStringInFuntionParamUsecase(
          inputCode,
        );
        expect(result, expectedOutput);
      },
    );

    test('should handle already nullable string with default value', () {
      const inputCode = """
void logEvent({String? type = 'INFO', required String message}) {
  print('[\$type] \$message');
}
""";
      // The type is already String? but has a default value.
      // The script should remove the default and add the null-aware assignment.
      // It should not add a second '?' to the type.
      const expectedOutput =
          r"""void logEvent({String?? type , required String message}) {
  type ??= 'INFO';

  print('[$type] $message');
}
""";
      final result = singleMoveHardcodedStringInFuntionParamUsecase(inputCode);
      expect(result, expectedOutput);
    });

    test('should handle mixed named and positional optional parameters', () {
      const inputCode = """
void mixedParams(int id, [String role = 'User'], {String status = 'Active'}) {
  print('\$id, \$role, \$status');
}
""";
      const expectedOutput =
          r"""void mixedParams(int id, [String? role ], {String status = 'Active'}) {
  role ??= 'User';

  print('$id, $role, $status');
}
""";
      final result = singleMoveHardcodedStringInFuntionParamUsecase(inputCode);

      expect(result, expectedOutput);
    });

    test(
      'should preserve existing newlines and formatting as much as possible',
      () {
        const inputCode = """
class MyService {
  Future<void> fetchData({
    String endpoint = 'default/api',
    int timeout = 5000,
  }) async {
    // some logic
    print(endpoint);
    // more logic
  }
}
""";
        const expectedOutput = """class MyService {
  Future<void> fetchData({
    String? endpoint ,
    int timeout = 5000,
  }) async {
  endpoint ??= 'default/api';

    // some logic
    print(endpoint);
    // more logic
  }
}
""";
        final result = singleMoveHardcodedStringInFuntionParamUsecase(
          inputCode,
        );

        expect(result, expectedOutput);
      },
    );

    test(
      'should handle function with only one hardcoded string param and other params',
      () {
        const inputCode = """
void processData(int id, {String category = 'General', bool isActive = true}) {
  print('\$id - \$category (\${isActive ? 'Active' : 'Inactive'})');
}
""";
        const expectedOutput =
            """void processData(int id, {String? category , bool isActive = true}) {
  category ??= 'General';

  print('\$id - \$category (\${isActive ? 'Active' : 'Inactive'})');
}
""";
        final result = singleMoveHardcodedStringInFuntionParamUsecase(
          inputCode,
        );
        expect(result, expectedOutput);
      },
    );
  });

  group('Move hardcoded string with null assertions', () {
    test('Should add null assertion to nullable parameter used in closure', () {
      const input = '''
import 'package:flutter/material.dart'; 

Future<void> showConfirmationDialog({
  required BuildContext context,
  required String title,
  String? message,
  required void Function()? onConfirm,
  String confirmButtonText = 'Hello',
}) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: message != null ? Text(message) : null,
        actions: [
          TextButton(
            onPressed: () {
              onConfirm?.call();
              Navigator.of(context).pop();
            },
            child: Text(confirmButtonText),
          ),
        ],
      );
    },
  );
}''';

      const expected = '''
import 'package:flutter/material.dart'; 

Future<void> showConfirmationDialog({
  required BuildContext context,
  required String title,
  String? message,
  required void Function()? onConfirm,
  String? confirmButtonText ,
}) async {
  confirmButtonText ??= 'Hello';

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: message != null ? Text(message) : null,
        actions: [
          TextButton(
            onPressed: () {
              onConfirm?.call();
              Navigator.of(context).pop();
            },
            child: Text(confirmButtonText!),
          ),
        ],
      );
    },
  );
}''';

      final result = singleMoveHardcodedStringInFuntionParamUsecase(input);
      expect(result.trim(), equals(expected.trim()));
    });

    test('Should not add null assertion outside of closures', () {
      const input = '''
void testFunction({
  String message = 'Hello',
}) {
  print(message);
  final text = message.toUpperCase();
  print(text);
}''';

      const expected = '''
void testFunction({
  String? message ,
}) {
  message ??= 'Hello';

  print(message);
  final text = message.toUpperCase();
  print(text);
}''';

      final result = singleMoveHardcodedStringInFuntionParamUsecase(input);
      expect(result, equals(expected));
    });

    test('Should handle multiple parameters with null assertions', () {
      const input = '''
Future<void> showCustomDialog({
  required BuildContext context,
  String title = 'Default Title',
  String message = 'Default Message',
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Column(
          children: [
            Text(message),
            TextButton(
              onPressed: () {
                print(title);
              },
              child: Text(message),
            ),
          ],
        ),
      );
    },
  );
}''';

      const expected = '''
Future<void> showCustomDialog({
  required BuildContext context,
  String? title ,
  String? message ,
}) async {
  title ??= 'Default Title';
  message ??= 'Default Message';

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title!),
        content: Column(
          children: [
            Text(message!),
            TextButton(
              onPressed: () {
                print(title!);
              },
              child: Text(message!),
            ),
          ],
        ),
      );
    },
  );
}''';

      final result = singleMoveHardcodedStringInFuntionParamUsecase(input);
      expect(result.trim(), equals(expected.trim()));
    });
  });
}
