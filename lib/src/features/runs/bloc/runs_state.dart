part of 'runs_bloc.dart';


@freezed
sealed class RunsState with _$RunsState {
  const factory RunsState.initial() = RunsInitial;
  const factory RunsState.loading() = RunsLoading;
  const factory RunsState.loaded(List<RunModel> runs) = RunsLoaded;
  const factory RunsState.error(String message) = RunsError;
}
