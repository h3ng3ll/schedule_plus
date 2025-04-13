import 'package:flutter/material.dart';

class DayItem extends StatelessWidget {
  final String weekday;
  final String date;
  final bool isSelected;
  final bool isToday;

  const DayItem({
    super.key,
    required this.weekday,
    required this.date,
    required this.isSelected,
    required this.isToday,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
        color: isSelected ? Colors.deepPurple : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.deepPurple.withValues(
                    alpha: 0.3,
                  ),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weekday,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          if (isToday)
            Text(
              'TODAY',
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.deepPurple,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}
