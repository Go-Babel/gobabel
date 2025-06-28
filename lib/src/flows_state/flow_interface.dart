abstract class FlowInterface<T> extends Object
    implements Loadable, Loggable, SerializableFromJson<T> {}

abstract class Loadable {
  String get message;
  int get maxAmountOfSteps;
  int get stepCount;
}

abstract class Loggable {
  bool get shouldLog;
}

abstract class SerializableFromJson<T> {
  SerializableFromJson();
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
}
