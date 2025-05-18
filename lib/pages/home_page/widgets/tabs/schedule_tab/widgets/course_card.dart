import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../model/schedule/schedule.dart';

class CourseCard extends StatelessWidget {
  final Schedule schedule;
  final VoidCallback onTap;

  const CourseCard({
    super.key,
    required this.schedule,
    required this.onTap,
  });

  // Color _getStatusColor() {
  //   switch (course.status) {
  //     case CourseStatus.inProgress:
  //       return Colors.green;
  //     case CourseStatus.upcoming:
  //       return Colors.grey;
  //     case CourseStatus.completed:
  //       return Colors.blue;
  //   }
  // }
  //
  // String _getStatusText() {
  //   switch (course.status) {
  //     case CourseStatus.inProgress:
  //       return 'In Progress';
  //     case CourseStatus.upcoming:
  //       return 'Upcoming';
  //     case CourseStatus.completed:
  //       return 'Completed';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: 0.05,
              ),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Container(
                  //   width: 8,
                  //   height: 8,
                  //   decoration: BoxDecoration(
                  //     color: _getStatusColor(),
                  //     shape: BoxShape.circle,
                  //   ),
                  // ),
                  const SizedBox(width: 8),
                  Text(
                    '${DateFormat("hh:mm").format(schedule.startTime)} - ${DateFormat("hh:mm").format(schedule.endTime)}',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 12,
                  //     vertical: 4,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     color: _getStatusColor().withValues(
                  //       alpha: 0.1,
                  //     ),
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   child: Text(
                  //     _getStatusText(),
                  //     style: TextStyle(
                  //       color: _getStatusColor(),
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w500,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    schedule.course.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 16,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            schedule.professor.user.name ,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 16,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            schedule.location,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
