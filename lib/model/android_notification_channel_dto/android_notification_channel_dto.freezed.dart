// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'android_notification_channel_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AndroidNotificationChannelDTO _$AndroidNotificationChannelDTOFromJson(
    Map<String, dynamic> json) {
  return _AndroidNotificationChannelDTO.fromJson(json);
}

/// @nodoc
mixin _$AndroidNotificationChannelDTO {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this AndroidNotificationChannelDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AndroidNotificationChannelDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AndroidNotificationChannelDTOCopyWith<AndroidNotificationChannelDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AndroidNotificationChannelDTOCopyWith<$Res> {
  factory $AndroidNotificationChannelDTOCopyWith(
          AndroidNotificationChannelDTO value,
          $Res Function(AndroidNotificationChannelDTO) then) =
      _$AndroidNotificationChannelDTOCopyWithImpl<$Res,
          AndroidNotificationChannelDTO>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$AndroidNotificationChannelDTOCopyWithImpl<$Res,
        $Val extends AndroidNotificationChannelDTO>
    implements $AndroidNotificationChannelDTOCopyWith<$Res> {
  _$AndroidNotificationChannelDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AndroidNotificationChannelDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AndroidNotificationChannelDTOImplCopyWith<$Res>
    implements $AndroidNotificationChannelDTOCopyWith<$Res> {
  factory _$$AndroidNotificationChannelDTOImplCopyWith(
          _$AndroidNotificationChannelDTOImpl value,
          $Res Function(_$AndroidNotificationChannelDTOImpl) then) =
      __$$AndroidNotificationChannelDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$AndroidNotificationChannelDTOImplCopyWithImpl<$Res>
    extends _$AndroidNotificationChannelDTOCopyWithImpl<$Res,
        _$AndroidNotificationChannelDTOImpl>
    implements _$$AndroidNotificationChannelDTOImplCopyWith<$Res> {
  __$$AndroidNotificationChannelDTOImplCopyWithImpl(
      _$AndroidNotificationChannelDTOImpl _value,
      $Res Function(_$AndroidNotificationChannelDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of AndroidNotificationChannelDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$AndroidNotificationChannelDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AndroidNotificationChannelDTOImpl
    implements _AndroidNotificationChannelDTO {
  const _$AndroidNotificationChannelDTOImpl(
      {required this.id, required this.name});

  factory _$AndroidNotificationChannelDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AndroidNotificationChannelDTOImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'AndroidNotificationChannelDTO(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AndroidNotificationChannelDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of AndroidNotificationChannelDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AndroidNotificationChannelDTOImplCopyWith<
          _$AndroidNotificationChannelDTOImpl>
      get copyWith => __$$AndroidNotificationChannelDTOImplCopyWithImpl<
          _$AndroidNotificationChannelDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AndroidNotificationChannelDTOImplToJson(
      this,
    );
  }
}

abstract class _AndroidNotificationChannelDTO
    implements AndroidNotificationChannelDTO {
  const factory _AndroidNotificationChannelDTO(
      {required final String id,
      required final String name}) = _$AndroidNotificationChannelDTOImpl;

  factory _AndroidNotificationChannelDTO.fromJson(Map<String, dynamic> json) =
      _$AndroidNotificationChannelDTOImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of AndroidNotificationChannelDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AndroidNotificationChannelDTOImplCopyWith<
          _$AndroidNotificationChannelDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
