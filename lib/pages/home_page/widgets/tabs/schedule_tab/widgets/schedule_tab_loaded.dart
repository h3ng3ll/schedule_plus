import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../model/course/course.dart';
import '../../../../../../utils/chronos_service.dart';
import '../../../../../../widgets/app_background.dart';
import '../bloc/schedule_bloc/schedule_bloc.dart';
import 'app_bar/app_header.dart';
import 'course_list.dart';
import 'schedule_header.dart';
import 'weekday_selector.dart';

class ScheduleTabLoaded extends StatefulWidget {
  final DateTime selectedDay;
  final List<Course> courses;

  const ScheduleTabLoaded({
    super.key,
    required this.selectedDay,
    required this.courses,
  });

  @override
  State<ScheduleTabLoaded> createState() => _ScheduleTabLoadedState();
}

class _ScheduleTabLoadedState extends State<ScheduleTabLoaded> {
  final ChronosService _chronosService = ChronosService.instance;

  void _onDaySelected(BuildContext context, DateTime day) {
    context.read<ScheduleBloc>().add(
          ScheduleEvent.fetchCourses(
            time: day,
          ),
        );
  }

  void _onClassTapped(Course course) {
    // Show class details or navigate to class details screen
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(course.name),
        content: Text(
          'Professor: ${course.professor}\nRoom: ${course.room}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(),
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const AppHeader(),
                const Gap(16),
                ScheduleHeader(
                  scheduleTime: widget.selectedDay,
                ),
                const Gap(16),
                WeekdaySelector(
                  dates: _chronosService.getDays(),
                  selectedDay: widget.selectedDay,
                  onDaySelected: (
                    DateTime day,
                  ) =>
                      _onDaySelected(
                    context,
                    day,
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: CourseList(
                    onClassTapped: _onClassTapped,
                    courses: widget.courses,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
