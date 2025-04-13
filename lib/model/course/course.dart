import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';

part 'course.g.dart';

enum CourseStatus {
  @JsonValue('inProgress')
  inProgress,
  @JsonValue('upcoming')
  upcoming,
  @JsonValue('completed')
  completed,
}

enum TimePeriod {
  @JsonValue('morning')
  morning,
  @JsonValue('afternoon')
  afternoon,
  @JsonValue('evening')
  evening,
}

@freezed
class Course with _$Course {
  const factory Course({
    required String name,
    required String professor,
    required String room,
    required String startTime,
    required String endTime,
    required CourseStatus status,
    // required TimePeriod timeOfDay,
    String? courseId,
    List<String>? materials,
  }) = _Course;

  factory Course.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CourseFromJson(json);
}
