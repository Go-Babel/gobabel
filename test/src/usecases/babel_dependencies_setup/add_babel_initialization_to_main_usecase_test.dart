import 'dart:io';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/usecases/babel_dependencies_setup/add_babel_initialization_to_main_usecase.dart';
import 'package:test/test.dart';

void main() {
  group('addBabelInitializationToMainUsecase', () {
    late Directory tempDir;
    late CodeBaseYamlInfo flutterYamlInfo;
    late CodeBaseYamlInfo dartYamlInfo;

    setUp(() {
      tempDir = Directory.systemTemp.createTempSync('babel_test_');
      Directory('${tempDir.path}/lib').createSync();
      Directory('${tempDir.path}/bin').createSync();
      
      flutterYamlInfo = CodeBaseYamlInfo(
        projectName: 'test_app',
        projectDescription: 'Test Flutter app',
        version: '1.0.0',
        type: ProjectType.flutter,
      );
      
      dartYamlInfo = CodeBaseYamlInfo(
        projectName: 'test_app',
        projectDescription: 'Test Dart app',
        version: '1.0.0',
        type: ProjectType.dart,
      );
    });

    tearDown(() {
      tempDir.deleteSync(recursive: true);
    });

    test('Should add WidgetsFlutterBinding.ensureInitialized() and Babel.instance.initialize() for Flutter project without binding', () async {
      final mainFile = File('${tempDir.path}/lib/main.dart');
      await mainFile.writeAsString('''
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
''');

      final result = await addBabelInitializationToMainUsecase(
        directory: tempDir,
        codeBaseYamlInfo: flutterYamlInfo,
      );

      expect(result.isSuccess(), true);
      
      final content = await mainFile.readAsString();
      expect(content.contains('WidgetsFlutterBinding.ensureInitialized()'), true);
      expect(content.contains('await Babel.instance.initialize()'), true);
      expect(content.contains('async'), true);
      
      // Verify order: WidgetsFlutterBinding should come before Babel
      final bindingIndex = content.indexOf('WidgetsFlutterBinding.ensureInitialized()');
      final babelIndex = content.indexOf('await Babel.instance.initialize()');
      expect(bindingIndex < babelIndex, true);
    });

    test('Should add Babel.instance.initialize() after existing WidgetsFlutterBinding.ensureInitialized()', () async {
      final mainFile = File('${tempDir.path}/lib/main.dart');
      await mainFile.writeAsString('''
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
''');

      final result = await addBabelInitializationToMainUsecase(
        directory: tempDir,
        codeBaseYamlInfo: flutterYamlInfo,
      );

      expect(result.isSuccess(), true);
      
      final content = await mainFile.readAsString();
      expect(content.contains('await Babel.instance.initialize()'), true);
      
      // Verify Babel comes after WidgetsFlutterBinding
      final bindingIndex = content.indexOf('WidgetsFlutterBinding.ensureInitialized()');
      final babelIndex = content.indexOf('await Babel.instance.initialize()');
      expect(bindingIndex < babelIndex, true);
    });

    test('Should only add Babel.instance.initialize() for Dart project', () async {
      final mainFile = File('${tempDir.path}/bin/test_app.dart');
      await mainFile.writeAsString('''
void main() {
  print('Hello, World!');
}
''');

      final result = await addBabelInitializationToMainUsecase(
        directory: tempDir,
        codeBaseYamlInfo: dartYamlInfo,
      );

      expect(result.isSuccess(), true);
      
      final content = await mainFile.readAsString();
      expect(content.contains('await Babel.instance.initialize()'), true);
      expect(content.contains('WidgetsFlutterBinding'), false);
      expect(content.contains('async'), true);
    });

    test('Should not duplicate Babel initialization if already present', () async {
      final mainFile = File('${tempDir.path}/lib/main.dart');
      await mainFile.writeAsString('''
import 'package:flutter/material.dart';
import 'package:test_app/babel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Babel.instance.initialize();
  runApp(MyApp());
}
''');

      final result = await addBabelInitializationToMainUsecase(
        directory: tempDir,
        codeBaseYamlInfo: flutterYamlInfo,
      );

      expect(result.isSuccess(), true);
      
      final content = await mainFile.readAsString();
      // Count occurrences of Babel initialization
      final babelCount = 'Babel.instance.initialize'.allMatches(content).length;
      expect(babelCount, 1);
    });

    test('Should add Flutter import when adding WidgetsFlutterBinding', () async {
      final mainFile = File('${tempDir.path}/lib/main.dart');
      await mainFile.writeAsString('''
void main() {
  print('Starting app');
}
''');

      final result = await addBabelInitializationToMainUsecase(
        directory: tempDir,
        codeBaseYamlInfo: flutterYamlInfo,
      );

      expect(result.isSuccess(), true);
      
      final content = await mainFile.readAsString();
      expect(content.contains("import 'package:flutter/widgets.dart';"), true);
      expect(content.contains('WidgetsFlutterBinding.ensureInitialized()'), true);
      expect(content.contains('await Babel.instance.initialize()'), true);
    });
  });
}