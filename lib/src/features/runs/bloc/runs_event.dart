part of 'runs_bloc.dart';


@freezed
class RunsEvent with _$RunsEvent {
  const factory RunsEvent.started() = RunsStarted;
  const factory RunsEvent.loadRuns() = LoadRuns;
  const factory RunsEvent.addRun(RunModel run) = AddRun;
  const factory RunsEvent.deleteRun(String runId) = DeleteRun;
}
