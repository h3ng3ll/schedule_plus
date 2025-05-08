part of 'settings_bloc.dart';

enum SettingsStatus {
  initial,
  loading,
  error,
}
@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required User user,
    @Default(SettingsStatus.initial) SettingsStatus status,
    @Default('') String message,
  }) = _SettingsState;
}
