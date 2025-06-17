import 'dart:io';

import 'package:gobabel/src/entities/api_client_entity.dart';
import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<ApiClientEntity> createClientEntity(Directory dir) async {
  final client = ApiClientEntity(
    host: 'https://api.gobabel.com',
    connectionTimeout: const Duration(seconds: 30),
  );

  // Todo(igor): This should be a separate state for all 3 flows. Like a "checkedIsValidDirectory"
  if (!(dir.path.contains(
        '${Platform.pathSeparator}lib${Platform.pathSeparator}',
      ) ||
      dir.path.endsWith('${Platform.pathSeparator}lib'))) {
    return Exception(
      'Provided directory is not inside a lib folder.',
    ).toFailure();
  }

  return client.toSuccess();
}

AsyncResult<CreateFlowCreatedClient> create_createClientEntity(
  CreateFlowInitial payload,
) {
  return createClientEntity(payload.directory).flatMap((client) {
    return CreateFlowCreatedClient(
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      client: client,
    ).toSuccess();
  });
}

AsyncResult<SyncFlowCreatedClient> sync_createClientEntity(
  SyncFlowInitial payload,
) {
  return createClientEntity(payload.directory).flatMap((client) {
    return SyncFlowCreatedClient(
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      client: client,
    ).toSuccess();
  });
}

AsyncResult<GenerateFlowCreatedClient> generate_createClientEntity(
  GenerateFlowInitial payload,
) {
  return createClientEntity(payload.directory).flatMap((client) {
    return GenerateFlowCreatedClient(
      willLog: payload.willLog,
      inputedByUserLocale: payload.inputedByUserLocale,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      client: client,
    ).toSuccess();
  });
}
