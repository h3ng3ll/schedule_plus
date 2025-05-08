// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      name: json['name'] as String?,
      email: json['email'] as String,
      imgUrl: json['imgUrl'] as String?,
      surname: json['surname'] as String?,
      department: json['department'] as String?,
      year: (json['year'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'imgUrl': instance.imgUrl,
      'surname': instance.surname,
      'department': instance.department,
      'year': instance.year,
    };
