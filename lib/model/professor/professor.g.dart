// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfessorImpl _$$ProfessorImplFromJson(Map<String, dynamic> json) =>
    _$ProfessorImpl(
      id: (json['id'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfessorImplToJson(_$ProfessorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
    };
