import 'dart:io';

import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

typedef BabelResponse<T> = AsyncResultDart<FlowInterface<T>, BabelException>;
typedef SyncBabelResponse<T> = ResultDart<FlowInterface<T>, BabelException>;

abstract class FlowInterface<T> extends Object
    implements Loadable, Loggable, Resetable, SerializableFromJson<T> {}

abstract class Loadable {
  String get message;
  int get maxAmountOfSteps;
  int get stepCount;
}

abstract class Loggable {
  bool get shouldLog;
  Directory get directory;
}

abstract class Resetable {
  bool get shouldReset;
}

abstract class SerializableFromJson<T> {
  SerializableFromJson();
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
}
