import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

class ChronosService {
  static final instance = ChronosService._();

  const ChronosService._();

  List<String> weekdays() {
    final startDate = DateTime(
      2025,
      3,
      23,
    ); // This is a Sunday

    return List.generate(
      5,
      (i) {
        final currentDate = startDate.add(
          Duration(
            days: i + 1,
          ),
        ); // +1 to start from Monday
        final formattedDay = DateFormat(
          'EEE',
        )
            .format(
              currentDate,
            )
            .toUpperCase();
        return formattedDay;
      },
    );
  }

  List<DateTime> getDays() {
    final now = DateTime.now();

    DateTime time = now;

    if (now.weekday >= Day.monday.index && now.weekday <= Day.friday.index) {
      while (time.weekday != Day.monday.index) {
        time = time.subtract(
          Duration(
            days: 1,
          ),
        );
      }
    } else {

      while (time.weekday != Day.monday.index) {
        time = time.add(
          Duration(
            days: 1,
          ),
        );
      }
    }
    return List.generate(
      5,
          (i) {
        return time.add(
          Duration(
            days: i,
          ),
        );
      },
    );
  }
}
