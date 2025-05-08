part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.register({
    required String email,
    required String password,
    String? name,
    required VoidCallback onCompleted,
}) = _Register;
}
