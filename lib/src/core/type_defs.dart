import 'package:result_dart/result_dart.dart';

typedef ErrorMessage = String;
typedef BabelResult<T extends Object> = ResultDart<T, String>;
typedef AsyncBabelResult<T extends Object> = AsyncResultDart<T, String>;
typedef L10nKey = String;
typedef L10nValue = String;
typedef BabelFunctionDeclaration = String;
typedef BabelFunctionImplementation = String;
typedef ContextPath = String;
