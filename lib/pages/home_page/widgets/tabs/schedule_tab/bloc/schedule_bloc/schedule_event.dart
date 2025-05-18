part of 'schedule_bloc.dart';

@freezed
class ScheduleEvent with _$ScheduleEvent {
  const factory ScheduleEvent.fetchSchedules({
    required DateTime time,
  }) = _FetchSchedules;

//   const factory ScheduleEvent.selectDay({
//     required DateTime time,
//   }) = _FetchCourses;
}
