import 'package:home_widget/home_widget.dart';
import 'package:intl/intl.dart';

import '../../model/schedule/schedule.dart';

class HomeWidgetService {
  String appGroupId = 'group.todaySchedule';

  String androidWidgetName = 'TodaySchedule';

  static final instance = HomeWidgetService._();

  final String courseNameKey = 'course_name';
  final String todayDayKey = 'today_day';
  final String beginTimeKey = 'begin_time';
  final String endTimeKey = 'end_time';
  final String professorKey = 'professor';
  final String locationKey = 'location';

  HomeWidgetService._();

  Future<void> initialize() async {
    await HomeWidget.setAppGroupId(
      appGroupId,
    );
  }

  Future<void> setData(Schedule schedule) async {
    await HomeWidget.setAppGroupId(appGroupId);

    await HomeWidget.saveWidgetData(
      courseNameKey,
      schedule.course.name,
    );
    await HomeWidget.saveWidgetData(
      todayDayKey,
      DateFormat('EEEE.dd').format(
        DateTime.now(),
      ),
    );
    await HomeWidget.saveWidgetData(
      beginTimeKey,
      DateFormat('hh.mm').format(
        schedule.startTime,
      ),
    );

    await HomeWidget.saveWidgetData(
      endTimeKey,
      DateFormat('hh.mm').format(
        schedule.endTime,
      ),
    );

    await HomeWidget.saveWidgetData(
      professorKey,
      schedule.professor.user.name,
    );
    await HomeWidget.saveWidgetData(
      locationKey,
      schedule.location,
    );

    final res = await HomeWidget.saveWidgetData(
      courseNameKey,
      schedule.course.name,
    );
    final value = await HomeWidget.updateWidget(
      androidName: androidWidgetName,
    );
  }
}
