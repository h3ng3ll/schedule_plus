import 'package:dio/dio.dart';


import '../../model/schedule/schedule.dart';
import '../api/schedule_api.dart';

class ScheduleRepository {
  final ScheduleApi _scheduleApi = ScheduleApi.instance;
  static final ScheduleRepository instance = ScheduleRepository._();

  ScheduleRepository._();

  Future<List<Schedule>> fetchSchedule({
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    try {
      final res = await _scheduleApi.fetchSchedules(
        startTime: startTime,
        endTime: endTime,
      );
      final List<Schedule> schedules = List<Schedule> .from(
        (res.data as List<dynamic>).map(
          (e) => Schedule.fromJson(e),
        ),
      ).toList();

      return schedules;

    } on DioException {
      rethrow;
    }
  }
}
