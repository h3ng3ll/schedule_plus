import 'package:flutter/foundation.dart';
// import 'package:workmanager/workmanager.dart';

import 'model/task_handler.dart';
import 'model/work_manager_task.dart';

/// On May 2025 Deprecated package. Must reduce  old flutter sdk version to
/// approximately 3.3
@pragma('vm:entry-point')
void callbackDispatcher() async {
  // WorkManagerService.instance.workManager.executeTask(
  //   (taskName, inputData) async {
  //     final handler = TaskRegistry.getHandler(taskName);
  //
  //     if (handler != null) {
  //       return await handler.handle(inputData);
  //     } else {
  //       debugPrint('Нет обработчика для задачи: $taskName');
  //       return false;
  //     }
  //   },
  // );
}

class WorkManagerService {
  static final instance = WorkManagerService._();

  WorkManagerService._() ;

  Future<void> initialize() async {
    // await workManager.initialize(
    //   callbackDispatcher,
    //   isInDebugMode: kDebugMode,
    // );
    //
    // workManager.registerPeriodicTask(
    //   WorkManagerTasks.todaySchedule.taskName,
    //   WorkManagerTasks.todaySchedule.uniqueName,
    //   frequency: Duration(
    //     minutes: 15,
    //   ),
    // );
  }

  // Workmanager workManager = Workmanager();
}
