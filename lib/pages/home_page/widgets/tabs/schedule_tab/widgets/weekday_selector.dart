import 'package:flutter/material.dart';

import '../../../../../../utils/chronos_service.dart';
import 'day_item.dart';

class WeekdaySelector extends StatelessWidget {
  final List<DateTime> dates;
  final DateTime selectedDay;
  final Function(DateTime) onDaySelected;

  const WeekdaySelector({
    super.key,
    required this.dates,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<DateTime> days = ChronosService.instance.getDays();
    final List<String> weekDays = ChronosService.instance.weekdays();
    return SizedBox(
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weekDays.length,
        itemBuilder: (
          context,
          index,
        ) {
          final String weekDay = weekDays[index];
          final DateTime day = days[index];

          return GestureDetector(
            onTap: () => onDaySelected(
              day,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                right: 16.0,
              ),
              child: DayItem(
                weekday: weekDay,
                date: day.day.toString().padLeft(2, '0'),
                isSelected: day.day == selectedDay.day,
                isToday: day.day == DateTime.now().day,
              ),
            ),
          );
        },
      ),
    );
  }
}
