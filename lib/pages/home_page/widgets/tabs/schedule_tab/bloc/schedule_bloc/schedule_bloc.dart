import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../data/repositories/schedule_repository.dart';
import '../../../../../../../model/schedule/schedule.dart';

part 'schedule_event.dart';

part 'schedule_state.dart';

part 'schedule_bloc.freezed.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final ScheduleRepository _scheduleRepository = ScheduleRepository.instance;

  ScheduleBloc({required DateTime dayTime})
      : super(
          ScheduleState(
            time: dayTime,
          ),
        ) {
    on<_FetchSchedules>(fetchSchedules);
  }

  /// fetch schedules for a day period
  Future<void> fetchSchedules(event, emit) async {
    emit(
      state.copyWith(
        status: ScheduleStatus.loading,
      ),
    );
    final DateTime time = event.time;

    final startTime = time.copyWith(
      hour: 0,
      minute: 0,
      second: 0,
    );
    final endTime =  time.copyWith(
      hour: 23,
      minute: 59,
      second: 59,
    );

    final schedules = await _scheduleRepository.fetchSchedule(
      startTime: startTime,
      endTime: endTime
    );
    emit(
      state.copyWith(
        status: ScheduleStatus.loaded,
        time: time,
        schedules: schedules,
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
