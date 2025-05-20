import 'package:dio/dio.dart';

import '../repositories/base_repository.dart';

class ScheduleApi {
  final BaseRepository _baseRepository = BaseRepository.instance;

  static final instance = ScheduleApi._();

  ScheduleApi._();

  Future<Response> fetchSchedules({
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    return await _baseRepository.api.get(
      '/Schedule/',
      queryParameters: {
        'StartDate': startTime?.toIso8601String(),
        'EndTime': endTime?.toIso8601String(),
      },
    );
  }
}
