import '../../../data/repositories/base_repository.dart';
import '../../../data/repositories/schedule_repository.dart';
import '../../home_widget_service/home_widget_service.dart';
import '../model/task_handler.dart';

class HomeWidgetTodayScheduleHandler implements TaskHandler {

  final BaseRepository _baseRepository = BaseRepository.instance;
  final ScheduleRepository _scheduleRepository = ScheduleRepository.instance;

  final HomeWidgetService _homeWidgetService = HomeWidgetService.instance;

  @override
  Future<bool> handle(Map<String, dynamic>? inputData) async {
    final isAuthorized = await _baseRepository.isPresentToken();
    if (!isAuthorized) return false;
    DateTime time = DateTime.now();

    final startTime = time.copyWith(
      hour: 0,
      minute: 0,
      second: 0,
    );
    final endTime = time.copyWith(
      hour: 23,
      minute: 59,
      second: 59,
    );

    final schedules = await _scheduleRepository.fetchSchedule(
      startTime: startTime,
      endTime: endTime,
    );

    if (schedules.isEmpty) return false;

    await _homeWidgetService.updateTodaySchedule(
      schedules.first,
    );
    return true;
  }
}
