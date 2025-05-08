part of 'auth_cubit.dart';


enum AuthStatus{
  initial,
  loading,
  error,
}
@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    User? user,
    @Default(AuthStatus.initial) AuthStatus status,
    @Default('') String errorMessage,
  }) = _AuthState;
}
