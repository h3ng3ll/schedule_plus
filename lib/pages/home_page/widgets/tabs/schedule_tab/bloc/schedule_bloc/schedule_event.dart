part of 'schedule_bloc.dart';

@freezed
class ScheduleEvent with _$ScheduleEvent {
  const factory ScheduleEvent.fetchCourses({
    required DateTime time,
  }) = _FetchCourses;

//   const factory ScheduleEvent.selectDay({
//     required DateTime time,
//   }) = _FetchCourses;
}
