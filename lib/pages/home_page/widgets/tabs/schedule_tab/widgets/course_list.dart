import 'package:flutter/material.dart';

import '../../../../../../model/schedule/schedule.dart';
import 'course_time_selector.dart';

class CourseList extends StatelessWidget {
  final Function(Schedule) onClassTapped;
  final List<Schedule> courses;

  const CourseList({
    super.key,
    required this.onClassTapped,
    required this.courses,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return CourseTimeSection(
          // timeOfDay: course.timeOfDay,
          course: course,
          onClassTapped: onClassTapped,
        );
      },
    );

    // Group courses by time of day
    // final Map<TimePeriod , List<>?>groupedCourses = {};

    // for (Course course in courses) {
    //   if (!groupedCourses.containsKey(course.timeOfDay)) {
    //     groupedCourses[course.timeOfDay] = [];
    //   }
    //   groupedCourses[course.timeOfDay]!.add(course);
    // }

    // return GroupedListView<Course, TimePeriod>(
    //   elements: [
    //     Course(
    //       name: 'Computer Networks',
    //       professor: 'Prof. Williams',
    //       room: 'Room 405',
    //       startTime: '2:00',
    //       endTime: '3:30',
    //       status: CourseStatus.upcoming,
    //       // timeOfDay: TimePeriod.afternoon,
    //     ),
    //   ],
    //   groupBy: (course) => course.timeOfDay,
    //   groupHeaderBuilder: (course) {
    //     return Text(course.timeOfDay.toString());
    //   },
    //   itemBuilder: (context, course) {
    //     return CourseTimeSection(
    //       timeOfDay: course.timeOfDay,
    //       courses: courses,
    //       onClassTapped: onClassTapped,
    //     );
    //   },
    // );
    // return ListView(
    //   children:
    //       groupedCourses.entries.map((entry) {
    //         // return Container();
    //         return CourseTimeSection(
    //           timeOfDay: entry.key,
    //           courses: entry.value,
    //           onClassTapped: onClassTapped,
    //         );
    //       }).toList(),
    // );
  }
}
