import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:result_dart/result_dart.dart';

part 'flow_interface.freezed.dart';
part 'flow_interface.g.dart';

typedef BabelUsecaseResp = AsyncResult<IFlowInterface>;
typedef SyncBabelUsecaseResp = Result<IFlowInterface>;

@freezed
abstract class IFlowInterface with _$IFlowInterface {
  const IFlowInterface._();

  const factory IFlowInterface.create({required CreateFlowState state}) =
      IFlowInterfaceCreate;

  const factory IFlowInterface.generate({required GenerateFlowState state}) =
      IFlowInterfaceGenerate;

  const factory IFlowInterface.sync({required SyncFlowState state}) =
      IFlowInterfaceSync;

  factory IFlowInterface.fromJson(Map<String, dynamic> json) =>
      _$IFlowInterfaceFromJson(json);

  String get message => map(
    create: (data) => data.state.message,
    generate: (data) => data.state.message,
    sync: (data) => data.state.message,
  );

  int get maxAmountOfSteps => map(
    create: (data) => data.state.maxAmountOfSteps,
    generate: (data) => data.state.maxAmountOfSteps,
    sync: (data) => data.state.maxAmountOfSteps,
  );

  int get stepCount => map(
    create: (data) => data.state.stepCount,
    generate: (data) => data.state.stepCount,
    sync: (data) => data.state.stepCount,
  );

  bool get shouldLog => map(
    create: (data) => data.state.shouldLog,
    generate: (data) => data.state.shouldLog,
    sync: (data) => data.state.shouldLog,
  );
}

abstract class Loadable {
  String get message;
  int get maxAmountOfSteps;
  int get stepCount;
}

abstract class Loggable {
  bool get shouldLog;
}
