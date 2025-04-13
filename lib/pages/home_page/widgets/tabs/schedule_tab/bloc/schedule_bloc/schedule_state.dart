part of 'schedule_bloc.dart';

enum ScheduleStatus {
  initial,
  loading,
  loaded,
  error,
}

@freezed
sealed class ScheduleState with _$ScheduleState {
  const factory ScheduleState({
    @Default(ScheduleStatus.initial) ScheduleStatus status,
    @Default([]) List<Course> courses,
    required DateTime time,
    @Default('') String  errorMessage,
  }) = _ScheduleState;
}
