// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      title: json['title'] as String,
      body: json['body'] as String,
      time: DateTime.parse(json['time'] as String),
      isRead: json['isRead'] as bool,
      assignedLocation: json['assignedLocation'] as String?,
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'time': instance.time.toIso8601String(),
      'isRead': instance.isRead,
      'assignedLocation': instance.assignedLocation,
    };
