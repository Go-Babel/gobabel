import 'package:test/test.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/remove_const_keyword_usecase.dart';

void main() {
  late RemoveConstKeywordUsecase usecase;

  setUp(() {
    usecase = RemoveConstKeywordUsecase();
  });

  group('RemoveConstKeywordUsecase', () {
    group('removeConsts', () {
      test('should NOT remove const from variable declarations', () {
        const input = '''
const int number = 42;
const String text = 'hello';
const double pi = 3.14;
static const String constantString = 'test';
''';

        final result = usecase.removeConsts(input);
        expect(result, equals(input)); // Should remain unchanged
      });

      test('should remove const from constructor calls', () {
        const input = '''
final widget = const Text('Hello');
final container = const Container(child: const Text('World'));
''';
        const expected = '''
final widget =  Text('Hello');
final container =  Container(child:  Text('World'));
''';

        final result = usecase.removeConsts(input);
        expect(result, equals(expected));
      });

      test(
        'should remove const from collections but not variable declarations',
        () {
          const input = '''
const list = const [1, 2, 3];
const map = const {'key': 'value'};
const set = const {1, 2, 3};
''';
          const expected = '''
const list =  [1, 2, 3];
const map =  {'key': 'value'};
const set =  {1, 2, 3};
''';

          final result = usecase.removeConsts(input);
          expect(result, equals(expected));
        },
      );

      test('should NOT remove const from strings', () {
        const input = '''
const message = 'This const should stay';
final text = "Another const in string";
final multiline = """
This const keyword should remain
const values are important
""";
''';

        final result = usecase.removeConsts(input);
        expect(result, equals(input)); // Should remain unchanged
      });

      test('should handle mixed scenarios correctly', () {
        const input = '''
class MyClass {
  const MyClass();
  
  static const String constantString = 'const in string should stay';
  static const int number = 42;
  
  Widget build() {
    return const Column(
      children: const [
        const Text('Hello const world'),
        const SizedBox(height: 10),
      ],
    );
  }
}
''';
        const expected = '''
class MyClass {
   MyClass();
  
  static const String constantString = 'const in string should stay';
  static const int number = 42;
  
  Widget build() {
    return  Column(
      children:  [
         Text('Hello const world'),
         SizedBox(height: 10),
      ],
    );
  }
}
''';

        final result = usecase.removeConsts(input);
        expect(result, equals(expected));
      });

      test('should handle const with generics in constructor calls', () {
        const input = '''
const Map<String, int> scores = const <String, int>{'a': 1, 'b': 2};
const List<Widget> widgets = const <Widget>[const Text('test')];
''';
        const expected = '''
const Map<String, int> scores =  <String, int>{'a': 1, 'b': 2};
const List<Widget> widgets =  <Widget>[ Text('test')];
''';

        final result = usecase.removeConsts(input);
        expect(result, equals(expected));
      });

      test(
        'should return same string when no constructor const keywords present',
        () {
          const input = '''
int number = 42;
String text = 'hello';
final widget = Text('Hello World');
const int staticValue = 100;
''';

          final result = usecase.removeConsts(input);
          expect(result, equals(input));
        },
      );

      test('should handle empty string', () {
        const input = '';
        final result = usecase.removeConsts(input);
        expect(result, equals(''));
      });

      test('should not remove standalone const keyword if not constructor', () {
        const input = 'const int value = 5;';

        final result = usecase.removeConsts(input);
        expect(result, equals(input)); // Should remain unchanged
      });

      test(
        'should preserve const in variable declarations but remove from constructors',
        () {
          const input = '''
// Variable declarations should keep const
const int value = 42; 
static const String name = 'test';
final const double pi = 3.14;

// Constructor calls should lose const
Widget build() {
  return const Scaffold(
    body: const Center(
      child: const Column(
        children: const [
          const Text('Hello'),
          const SizedBox(height: 8),
        ],
      ),
    ),
  );
}
''';
          const expected = '''
// Variable declarations should keep const
const int value = 42; 
static const String name = 'test';
final const double pi = 3.14;

// Constructor calls should lose const
Widget build() {
  return  Scaffold(
    body:  Center(
      child:  Column(
        children:  [
           Text('Hello'),
           SizedBox(height: 8),
        ],
      ),
    ),
  );
}
''';

          final result = usecase.removeConsts(input);
          expect(result, equals(expected));
        },
      );

      test('should handle const constructors with named parameters', () {
        const input = '''const Padding(
  padding: const EdgeInsets.all(8.0),
  child: const Text('Hello'),
)
''';
        const expected = ''' Padding(
  padding: const EdgeInsets.all(8.0),
  child:  Text('Hello'),
)
''';

        final result = usecase.removeConsts(input);
        expect(result, equals(expected));
      });
    });
  });
}
