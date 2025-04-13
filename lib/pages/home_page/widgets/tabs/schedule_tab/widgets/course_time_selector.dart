import 'package:flutter/material.dart';

import '../../../../../../model/course/course.dart';
import 'course_card.dart';

class CourseTimeSection extends StatelessWidget {
  // final TimePeriod timeOfDay;
  final Course course;
  final Function(Course) onClassTapped;

  const CourseTimeSection({
    super.key,
    // required this.timeOfDay,
    required this.course,
    required this.onClassTapped,
  });

  // String _getTimeOfDayTitle() {
  //   switch (timeOfDay) {
  //     case TimePeriod.morning:
  //       return 'Morning';
  //     case TimePeriod.afternoon:
  //       return 'Afternoon';
  //     case TimePeriod.evening:
  //       return 'Evening';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 8.0),
        //   child: Text(
        //     _getTimeOfDayTitle(),
        //     style: TextStyle(
        //       color: Colors.grey[600],
        //       fontSize: 16,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        // ),
        // ...course.map(
        //   (course) =>
        CourseCard(
          course: course,
          onTap: () => onClassTapped(
            course,
          ),
        ),
        // ),
        const SizedBox(height: 16),
      ],
    );
  }
}
