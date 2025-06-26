Create a optional in cli called "--will-log-user=true" and if it is true the logs will be activated.

----------

Please refactor "BabelProcessRunner" to use return "AsyncResult<ProcessResult>". 
This is the new pattern, lets avoid functions that returns values directly without error handling that comes with "AsyncResult".
Put the function in a try catch block and return an BabelException if it fails.
Also, it does not need to be a class with a single method. In can be a function that takes parameters and returns the result, without any class.

----------

Add those 2 guide lines guide line to the claude documentation.

----------
ja
Please refactor "generateSha1" to use return "Result<String>" since this is the default pattern of each function.
This is the new pattern, lets avoid functions that returns values directly without error handling that comes with "AsyncResult".
Put the function in a try catch block and return an BabelException if it fails.

----------
When --will-log-user


mixin Serializable {
  Map<String, dynamic> toJson();
}

abstract class SerializableFromJson<T> {
  T fromJson(Map<String, dynamic> json);
}

@freezed
class User with _$User, Serializable {
  const factory User({required String name, required int age}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
