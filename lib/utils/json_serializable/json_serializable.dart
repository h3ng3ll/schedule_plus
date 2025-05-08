import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeSerializable implements JsonConverter<DateTime, int> {
  const DateTimeSerializable();

  @override
  DateTime fromJson(int value) {
    return DateTime.fromMillisecondsSinceEpoch(
      value,
    );
  }

  @override
  int  toJson(DateTime time) {
    final int value = time.millisecondsSinceEpoch;
    return value;
  }
}
