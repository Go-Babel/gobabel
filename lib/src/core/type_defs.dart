import 'package:result_dart/result_dart.dart';

typedef ErrorMessage = String;
typedef BabelResult<T extends Object> = ResultDart<T, String>;
typedef AsyncBabelResult<T extends Object> = AsyncResultDart<T, String>;
typedef BabelFunctionDeclaration = String;
typedef FileContent = String;
typedef BabelFunctionImplementation = String;
typedef ShaCommit = String;
typedef ChangedFilePath = String;
