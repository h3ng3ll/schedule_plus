part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.update({
    required User user,
  }) = _Update;

  const factory SettingsEvent.fetchUnReadMessagesCount() =
      _FetchUnReadMessagesCount;

  const factory SettingsEvent.incrementUnReadMessagesCount() =
      _IncrementUnReadMessagesCount;

  const factory SettingsEvent.unReadLastMessages({
   required  int counts,
  }) = _UnReadLastMessages;
}
