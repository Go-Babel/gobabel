// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'flow_interface.freezed.dart';
// part 'flow_interface.g.dart';

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

/*
Example models for test
@freezed
class User with _$User implements FlowInterface<User> {
  const User._();

  const factory User({required String name, required int age}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // enforce the interface by forwarding the instance method
  @override
  User fromJson(Map<String, dynamic> json) => User.fromJson(json);

  @override
  int get maxAmountOfSteps => throw UnimplementedError();

  @override
  String get message => throw UnimplementedError();

  @override
  int get stepCount => throw UnimplementedError();
  
  @override
  bool get shouldLog => true;
}
*/
