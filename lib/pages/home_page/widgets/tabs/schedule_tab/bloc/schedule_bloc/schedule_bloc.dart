import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../model/course/course.dart';

part 'schedule_event.dart';

part 'schedule_state.dart';

part 'schedule_bloc.freezed.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc({required DateTime dayTime})
      : super(
          ScheduleState(
            time: dayTime,
          ),
        ) {
    on<ScheduleEvent>(
      (event, emit) async {
        return await event.map<FutureOr<void>>(
          fetchCourses: (fetchCoursesArgs) => fetchCourses(
            event,
            emit,
            fetchCoursesArgs.time,
          ),
        );
      },
    );
  }

  /// fetch courses for a day period
  void fetchCourses(
    event,
    emit,
    DateTime time,
  ) {
    emit(
      state.copyWith(
        status: ScheduleStatus.loading,
      ),
    );
    final List<Course> courses = [
      Course(
        name: 'Advanced Mathematics',
        professor: 'Prof. Smith',
        room: 'Room 301',
        startTime: '9:00',
        endTime: '10:30',
        status: CourseStatus.inProgress,
        // timeOfDay: TimePeriod.morning,
      ),
      Course(
        name: 'Data Structures',
        professor: 'Prof. Johnson',
        room: 'Room 205',
        startTime: '11:00',
        endTime: '12:30',
        status: CourseStatus.upcoming,
        // timeOfDay: TimePeriod.morning,
      ),
      Course(
        name: 'Computer Networks',
        professor: 'Prof. Williams',
        room: 'Room 405',
        startTime: '2:00',
        endTime: '3:30',
        status: CourseStatus.upcoming,
        // timeOfDay: TimePeriod.afternoon,
      ),
    ];
    emit(
      state.copyWith(
        status: ScheduleStatus.loaded,
        time: time,
        courses: courses,
      ),
    );
  }

// void selectDay(
//   event,
//   emit,
//   DateTime timeDay,
// ) async {
//   emit(
//     state.copyWith(
//       status: ScheduleStatus.loading,
//       time: timeDay,
//     ),
//   );
//
//   emit(
//     state.copyWith(
//       status: ScheduleStatus.loaded,
//       time: timeDay,
//     ),
//   );
// }
}
