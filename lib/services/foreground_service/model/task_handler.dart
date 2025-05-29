import '../handlers/home_widget_today_schedule_handler.dart';
import 'work_manager_task.dart';

abstract class TaskHandler {
  Future<bool> handle(Map<String, dynamic>? inputData);
}

class TaskRegistry {
  static final Map<String, dynamic> _handlers = {
    WorkManagerTasks.todaySchedule.taskName: HomeWidgetTodayScheduleHandler(),
  };

  static TaskHandler? getHandler(String taskName) => _handlers[taskName];
}
