part of 'login_bloc.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    @Default(false) bool isFailure,
    @Default('') String errorMessage,
  }) = _LoginState;
}