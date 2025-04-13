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

  List<DateTime> getDays() => List.generate(
        5,
        (i) => DateTime.now().add(
          Duration(
            days: i,
          ),
        ),
      );
}
