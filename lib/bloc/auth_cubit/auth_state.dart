part of 'auth_cubit.dart';

enum AuthStatus {
  initial,
  loading,
  authorized,
  failed,
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    // User? user,
    String? errorMessage,

    /// verificationPart
    String? verificationId,
    int? resendToken,
  }) = _AuthState;


}
