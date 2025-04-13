// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseImpl _$$CourseImplFromJson(Map<String, dynamic> json) => _$CourseImpl(
      name: json['name'] as String,
      professor: json['professor'] as String,
      room: json['room'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      status: $enumDecode(_$CourseStatusEnumMap, json['status']),
      courseId: json['courseId'] as String?,
      materials: (json['materials'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CourseImplToJson(_$CourseImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'professor': instance.professor,
      'room': instance.room,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'status': _$CourseStatusEnumMap[instance.status]!,
      'courseId': instance.courseId,
      'materials': instance.materials,
    };

const _$CourseStatusEnumMap = {
  CourseStatus.inProgress: 'inProgress',
  CourseStatus.upcoming: 'upcoming',
  CourseStatus.completed: 'completed',
};
