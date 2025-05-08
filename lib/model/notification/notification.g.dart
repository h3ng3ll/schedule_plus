// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      createdAt: const DateTimeSerializable()
          .fromJson((json['createdAt'] as num).toInt()),
      isRead: json['isRead'] as bool,
      assignedLocation: json['assignedLocation'] as String?,
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'createdAt': const DateTimeSerializable().toJson(instance.createdAt),
      'isRead': instance.isRead,
      'assignedLocation': instance.assignedLocation,
    };
