import 'package:freezed_annotation/freezed_annotation.dart';

import '../course/course.dart';
import '../group/group.dart';
import '../professor/professor.dart';

part 'schedule.freezed.dart';

part 'schedule.g.dart';


@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    required int id ,
    required String location,
    required Course course,
    required List<Group> groups,
    required Professor professor,
    required DateTime startTime,
    required DateTime endTime,
  }) = _Schedule;

  factory Schedule.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ScheduleFromJson(json);
}
