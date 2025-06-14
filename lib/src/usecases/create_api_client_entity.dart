import 'package:gobabel/src/entities/api_client_entity.dart';
import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<ApiClientEntity> createClientEntity() async {
  final client = ApiClientEntity(
    host: 'https://api.gobabel.com',
    connectionTimeout: const Duration(seconds: 30),
  );

  return client.toSuccess();
}

AsyncResult<CreateFlowCreatedClient> create_createClientEntity(
  CreateFlowInitial payload,
) {
  return createClientEntity().flatMap((client) {
    return CreateFlowCreatedClient(
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      client: client,
    ).toSuccess();
  });
}
