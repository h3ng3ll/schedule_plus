import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../resources/colors/app_colors.dart';

class ScheduleHeader extends StatelessWidget {
  final DateTime scheduleTime;

  const ScheduleHeader({
    super.key,
    required this.scheduleTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Schedule',
          style: TextStyle(
            color: AppColors.jacarta.value,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.calendar_today,
              color: AppColors.majorelleBlue.value,
              size: 18,
            ),
            const SizedBox(width: 4),
            Text(
              DateFormat('MMM yyyy').format(
                scheduleTime,
              ),
              style: TextStyle(
                color: AppColors.majorelleBlue.value,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
