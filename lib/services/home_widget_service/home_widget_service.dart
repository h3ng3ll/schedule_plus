import 'package:home_widget/home_widget.dart';
import 'package:intl/intl.dart';

import '../../model/schedule/schedule.dart';

class HomeWidgetService {
  final String _appGroupId = 'group.todaySchedule';

  final String _androidWidgetName = 'TodaySchedule';

  static final instance = HomeWidgetService._();

  final String _courseNameKey = 'course_name';
  final String _todayDayKey = 'today_day';
  final String _beginTimeKey = 'begin_time';
  final String _endTimeKey = 'end_time';
  final String _professorKey = 'professor';
  final String _locationKey = 'location';

  HomeWidgetService._();

  Future<void> initialize() async {
    await HomeWidget.setAppGroupId(
      _appGroupId,
    );
  }

  Future<void> updateTodaySchedule(Schedule schedule) async {
    await HomeWidget.setAppGroupId(_appGroupId);

    await HomeWidget.saveWidgetData(
      _courseNameKey,
      schedule.course.name,
    );
    await HomeWidget.saveWidgetData(
      _todayDayKey,
      DateFormat('EEEE.dd').format(
        DateTime.now(),
      ),
    );
    await HomeWidget.saveWidgetData(
      _beginTimeKey,
      DateFormat('hh.mm').format(
        schedule.startTime,
      ),
    );

    await HomeWidget.saveWidgetData(
      _endTimeKey,
      DateFormat('hh.mm').format(
        schedule.endTime,
      ),
    );

    await HomeWidget.saveWidgetData(
      _professorKey,
      schedule.professor.user.name,
    );
    await HomeWidget.saveWidgetData(
      _locationKey,
      schedule.location,
    );

    final res = await HomeWidget.saveWidgetData(
      _courseNameKey,
      schedule.course.name,
    );
    final value = await HomeWidget.updateWidget(
      androidName: _androidWidgetName,
    );
  }
}
