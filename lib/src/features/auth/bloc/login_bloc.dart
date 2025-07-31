import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:run_tracker_flutter/src/core/services/auth_service.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final authService = AuthService();
  LoginBloc() : super(const LoginState()) {
    on<LoginEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email, isFailure: false));
    });
    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password, isFailure: false));
    });
    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, isFailure: false, isSuccess: false));
      try{
         await authService.signInWithEmailAndPassword(state.email, state.password);
      }on FirebaseAuthException catch (e){
        emit(state.copyWith(isSubmitting: false, isSuccess: false, isFailure: true, errorMessage: e.message??'Auth failed'));
      }
      catch(e) {
        emit(state.copyWith(isSubmitting: false, isSuccess: false, isFailure: true, errorMessage: 'Auth failed'));
      }
    });
  }
}