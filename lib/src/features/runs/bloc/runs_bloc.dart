import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:run_tracker_flutter/src/core/models/run_model.dart';
import 'package:run_tracker_flutter/src/core/services/firestore_service.dart';

part 'runs_event.dart';
part 'runs_state.dart';
part 'runs_bloc.freezed.dart';

class RunsBloc extends Bloc<RunsEvent, RunsState> {
  final FirestoreService fireStoreService;

  RunsBloc({required this.fireStoreService}) : super(const RunsState.initial()) {
    on<RunsStarted>((event, emit) {
      emit(const RunsState.initial());
    });

    on<LoadRuns>((event, emit) async {
      emit(const RunsState.loading());
      try {
        final userId = FirebaseAuth.instance.currentUser?.uid;
        if (userId == null) throw Exception('User not authenticated');

        final runs = await fireStoreService.getRunsOnce(userId);
        emit(RunsState.loaded(runs));
      } catch (e) {
        emit(RunsState.error(e.toString()));
      }
    });

    on<AddRun>((event, emit) async {
      try {
        final userId = FirebaseAuth.instance.currentUser?.uid;
        if (userId == null) throw Exception('User not authenticated');

        await fireStoreService.addRun(userId: userId, run: event.run);
        add(const RunsEvent.loadRuns());
      } catch (e) {
        emit(RunsState.error(e.toString()));
      }
    });

    on<DeleteRun>((event, emit) async {
      try {
        final userId = FirebaseAuth.instance.currentUser?.uid;
        if (userId == null) throw Exception('User not authenticated');

        await fireStoreService.deleteRun(userId: userId, runId: event.runId);
        add(const RunsEvent.loadRuns());
      } catch (e) {
        emit(RunsState.error(e.toString()));
      }
    });
  }
}
