// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_tab_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileTabEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileTabEventCopyWith<$Res> {
  factory $ProfileTabEventCopyWith(
          ProfileTabEvent value, $Res Function(ProfileTabEvent) then) =
      _$ProfileTabEventCopyWithImpl<$Res, ProfileTabEvent>;
}

/// @nodoc
class _$ProfileTabEventCopyWithImpl<$Res, $Val extends ProfileTabEvent>
    implements $ProfileTabEventCopyWith<$Res> {
  _$ProfileTabEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileTabEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
          _$LoadImpl value, $Res Function(_$LoadImpl) then) =
      __$$LoadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$ProfileTabEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileTabEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadImpl implements _Load {
  const _$LoadImpl();

  @override
  String toString() {
    return 'ProfileTabEvent.load()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements ProfileTabEvent {
  const factory _Load() = _$LoadImpl;
}

/// @nodoc
mixin _$ProfileTabState {
  ProfileTabStatus get status => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get surname => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;

  /// Create a copy of ProfileTabState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileTabStateCopyWith<ProfileTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileTabStateCopyWith<$Res> {
  factory $ProfileTabStateCopyWith(
          ProfileTabState value, $Res Function(ProfileTabState) then) =
      _$ProfileTabStateCopyWithImpl<$Res, ProfileTabState>;
  @useResult
  $Res call(
      {ProfileTabStatus status,
      String? avatarUrl,
      String? name,
      String? surname,
      String? department,
      int? year});
}

/// @nodoc
class _$ProfileTabStateCopyWithImpl<$Res, $Val extends ProfileTabState>
    implements $ProfileTabStateCopyWith<$Res> {
  _$ProfileTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileTabState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? avatarUrl = freezed,
    Object? name = freezed,
    Object? surname = freezed,
    Object? department = freezed,
    Object? year = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProfileTabStatus,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileTabStateImplCopyWith<$Res>
    implements $ProfileTabStateCopyWith<$Res> {
  factory _$$ProfileTabStateImplCopyWith(_$ProfileTabStateImpl value,
          $Res Function(_$ProfileTabStateImpl) then) =
      __$$ProfileTabStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProfileTabStatus status,
      String? avatarUrl,
      String? name,
      String? surname,
      String? department,
      int? year});
}

/// @nodoc
class __$$ProfileTabStateImplCopyWithImpl<$Res>
    extends _$ProfileTabStateCopyWithImpl<$Res, _$ProfileTabStateImpl>
    implements _$$ProfileTabStateImplCopyWith<$Res> {
  __$$ProfileTabStateImplCopyWithImpl(
      _$ProfileTabStateImpl _value, $Res Function(_$ProfileTabStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileTabState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? avatarUrl = freezed,
    Object? name = freezed,
    Object? surname = freezed,
    Object? department = freezed,
    Object? year = freezed,
  }) {
    return _then(_$ProfileTabStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProfileTabStatus,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ProfileTabStateImpl implements _ProfileTabState {
  const _$ProfileTabStateImpl(
      {this.status = ProfileTabStatus.initial,
      this.avatarUrl,
      this.name,
      this.surname,
      this.department,
      this.year});

  @override
  @JsonKey()
  final ProfileTabStatus status;
  @override
  final String? avatarUrl;
  @override
  final String? name;
  @override
  final String? surname;
  @override
  final String? department;
  @override
  final int? year;

  @override
  String toString() {
    return 'ProfileTabState(status: $status, avatarUrl: $avatarUrl, name: $name, surname: $surname, department: $department, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileTabStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.year, year) || other.year == year));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, avatarUrl, name, surname, department, year);

  /// Create a copy of ProfileTabState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileTabStateImplCopyWith<_$ProfileTabStateImpl> get copyWith =>
      __$$ProfileTabStateImplCopyWithImpl<_$ProfileTabStateImpl>(
          this, _$identity);
}

abstract class _ProfileTabState implements ProfileTabState {
  const factory _ProfileTabState(
      {final ProfileTabStatus status,
      final String? avatarUrl,
      final String? name,
      final String? surname,
      final String? department,
      final int? year}) = _$ProfileTabStateImpl;

  @override
  ProfileTabStatus get status;
  @override
  String? get avatarUrl;
  @override
  String? get name;
  @override
  String? get surname;
  @override
  String? get department;
  @override
  int? get year;

  /// Create a copy of ProfileTabState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileTabStateImplCopyWith<_$ProfileTabStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
