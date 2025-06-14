import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel_client/gobabel_client.dart';

part 'api_client_entity.freezed.dart';
part 'api_client_entity.g.dart';

@freezed
abstract class ApiClientEntity with _$ApiClientEntity {
  const ApiClientEntity._();
  factory ApiClientEntity({
    required String host,
    required Duration connectionTimeout,
  }) = _ApiClientEntity;

  Client get server {
    return Client(host, connectionTimeout: connectionTimeout);
  }

  factory ApiClientEntity.fromJson(Map<String, dynamic> json) =>
      _$ApiClientEntityFromJson(json);
}
