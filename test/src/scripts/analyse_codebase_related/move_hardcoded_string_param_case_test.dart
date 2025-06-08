import 'package:test/test.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/move_hardcoded_string_param_case.dart';

void main() {
  group('MoveHardCodedStringParamUseCase', () {
    late MoveHardCodedStringParamUseCase useCase;

    setUp(() {
      useCase = MoveHardCodedStringParamUseCase();
    });

    test('should transform constructor with hardcoded string parameter', () {
      const original = '''
class TestHardcodedFile {
  final String userName;
  final Map<String, dynamic> userData;

  const TestHardcodedFile({
    super.key,
    this.userName = 'Tom',
    required this.userData,
  });
}
''';

      final result = useCase.analyseSingleFile(original);

      expect(result, contains('String? userName'));
      expect(result, contains('userName = userName ?? \'Tom\''));
      expect(result, isNot(contains('this.userName = \'Tom\'')));
    });

    test('should transform multiple hardcoded string parameters', () {
      const original = '''
class MultipleStrings {
  final String name;
  final String title;
  final int age;

  const MultipleStrings({
    this.name = 'Default Name',
    this.title = 'Default Title', 
    required this.age,
  });
}
''';

      final result = useCase.analyseSingleFile(original);

      expect(result, contains('String? name'));
      expect(result, contains('String? title'));
      expect(result, contains('name = name ?? \'Default Name\''));
      expect(result, contains('title = title ?? \'Default Title\''));
      expect(result, contains('required this.age'));
    });

    test('should not transform non-string default parameters', () {
      const original = '''
class NonStringDefaults {
  final String name;
  final int count;
  final bool isActive;

  const NonStringDefaults({
    required this.name,
    this.count = 42,
    this.isActive = true,
  });
}
''';

      final result = useCase.analyseSingleFile(original);

      expect(result, contains('this.count = 42'));
      expect(result, contains('this.isActive = true'));
      expect(result, contains('required this.name'));
    });

    test('should handle named constructor', () {
      const original = '''
class NamedConstructor {
  final String message;

  const NamedConstructor.withDefault({
    this.message = 'Hello World',
  });
}
''';

      final result = useCase.analyseSingleFile(original);

      expect(result, contains('String? message'));
      expect(result, contains('message = message ?? \'Hello World\''));
    });

    test('should handle constructor without const keyword', () {
      const original = '''
class NonConstConstructor {
  final String value;

  NonConstConstructor({
    this.value = 'default',
  });
}
''';

      final result = useCase.analyseSingleFile(original);

      expect(result, contains('String? value'));
      expect(result, contains('value = value ?? \'default\''));
      expect(result, isNot(contains('const')));
    });

    test('should not modify constructor without hardcoded strings', () {
      const original = '''
class NoHardcodedStrings {
  final String name;
  final int age;

  const NoHardcodedStrings({
    required this.name,
    required this.age,
  });
}
''';

      final result = useCase.analyseSingleFile(original);

      expect(result, equals(original));
    });

    test('should handle mixed parameter types', () {
      const original = '''
class MixedParams {
  final String name;
  final String? optionalName;
  final int count;

  const MixedParams({
    super.key,
    this.name = 'DefaultName',
    this.optionalName,
    this.count = 0,
  });
}
''';

      final result = useCase.analyseSingleFile(original);

      expect(result, contains('String? name'));
      expect(result, contains('this.optionalName'));
      expect(result, contains('this.count = 0'));
      expect(result, contains('name = name ?? \'DefaultName\''));
    });

    test('should handle empty constructor', () {
      const original = '''
class EmptyConstructor {
  const EmptyConstructor();
}
''';

      final result = useCase.analyseSingleFile(original);

      expect(result, equals(original));
    });

    test('should handle string with special characters', () {
      const original = '''
class SpecialChars {
  final String message;

  const SpecialChars({
    this.message = 'Hello "World" with \\n newline',
  });
}
''';

      final result = useCase.analyseSingleFile(original);
      print(result);

      expect(result, contains('String? message'));
      expect(
        result,
        contains('message = message ?? \'Hello "World" with \n newline\''),
      );
    });
  });
}
