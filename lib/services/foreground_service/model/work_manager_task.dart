

class WorkManagerTask {
  final String uniqueName;
  final String taskName;

  WorkManagerTask(
    this.uniqueName,
    this.taskName,
  );
}

abstract class WorkManagerTasks {

  static WorkManagerTask todaySchedule = WorkManagerTask(
    'today_schedule',
    'TodaySchedule',
  );

}
