// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_intermediate_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterIntermediatePageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchGroups,
    required TResult Function() fetchDepartments,
    required TResult Function(
            String? name, Group? group, Department? department)
        updateData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchGroups,
    TResult? Function()? fetchDepartments,
    TResult? Function(String? name, Group? group, Department? department)?
        updateData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchGroups,
    TResult Function()? fetchDepartments,
    TResult Function(String? name, Group? group, Department? department)?
        updateData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchGroups value) fetchGroups,
    required TResult Function(_FetchDepartments value) fetchDepartments,
    required TResult Function(_UpdateData value) updateData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchGroups value)? fetchGroups,
    TResult? Function(_FetchDepartments value)? fetchDepartments,
    TResult? Function(_UpdateData value)? updateData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchGroups value)? fetchGroups,
    TResult Function(_FetchDepartments value)? fetchDepartments,
    TResult Function(_UpdateData value)? updateData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterIntermediatePageEventCopyWith<$Res> {
  factory $RegisterIntermediatePageEventCopyWith(
          RegisterIntermediatePageEvent value,
          $Res Function(RegisterIntermediatePageEvent) then) =
      _$RegisterIntermediatePageEventCopyWithImpl<$Res,
          RegisterIntermediatePageEvent>;
}

/// @nodoc
class _$RegisterIntermediatePageEventCopyWithImpl<$Res,
        $Val extends RegisterIntermediatePageEvent>
    implements $RegisterIntermediatePageEventCopyWith<$Res> {
  _$RegisterIntermediatePageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterIntermediatePageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchGroupsImplCopyWith<$Res> {
  factory _$$FetchGroupsImplCopyWith(
          _$FetchGroupsImpl value, $Res Function(_$FetchGroupsImpl) then) =
      __$$FetchGroupsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchGroupsImplCopyWithImpl<$Res>
    extends _$RegisterIntermediatePageEventCopyWithImpl<$Res, _$FetchGroupsImpl>
    implements _$$FetchGroupsImplCopyWith<$Res> {
  __$$FetchGroupsImplCopyWithImpl(
      _$FetchGroupsImpl _value, $Res Function(_$FetchGroupsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterIntermediatePageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchGroupsImpl implements _FetchGroups {
  const _$FetchGroupsImpl();

  @override
  String toString() {
    return 'RegisterIntermediatePageEvent.fetchGroups()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchGroupsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchGroups,
    required TResult Function() fetchDepartments,
    required TResult Function(
            String? name, Group? group, Department? department)
        updateData,
  }) {
    return fetchGroups();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchGroups,
    TResult? Function()? fetchDepartments,
    TResult? Function(String? name, Group? group, Department? department)?
        updateData,
  }) {
    return fetchGroups?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchGroups,
    TResult Function()? fetchDepartments,
    TResult Function(String? name, Group? group, Department? department)?
        updateData,
    required TResult orElse(),
  }) {
    if (fetchGroups != null) {
      return fetchGroups();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchGroups value) fetchGroups,
    required TResult Function(_FetchDepartments value) fetchDepartments,
    required TResult Function(_UpdateData value) updateData,
  }) {
    return fetchGroups(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchGroups value)? fetchGroups,
    TResult? Function(_FetchDepartments value)? fetchDepartments,
    TResult? Function(_UpdateData value)? updateData,
  }) {
    return fetchGroups?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchGroups value)? fetchGroups,
    TResult Function(_FetchDepartments value)? fetchDepartments,
    TResult Function(_UpdateData value)? updateData,
    required TResult orElse(),
  }) {
    if (fetchGroups != null) {
      return fetchGroups(this);
    }
    return orElse();
  }
}

abstract class _FetchGroups implements RegisterIntermediatePageEvent {
  const factory _FetchGroups() = _$FetchGroupsImpl;
}

/// @nodoc
abstract class _$$FetchDepartmentsImplCopyWith<$Res> {
  factory _$$FetchDepartmentsImplCopyWith(_$FetchDepartmentsImpl value,
          $Res Function(_$FetchDepartmentsImpl) then) =
      __$$FetchDepartmentsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchDepartmentsImplCopyWithImpl<$Res>
    extends _$RegisterIntermediatePageEventCopyWithImpl<$Res,
        _$FetchDepartmentsImpl>
    implements _$$FetchDepartmentsImplCopyWith<$Res> {
  __$$FetchDepartmentsImplCopyWithImpl(_$FetchDepartmentsImpl _value,
      $Res Function(_$FetchDepartmentsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterIntermediatePageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchDepartmentsImpl implements _FetchDepartments {
  const _$FetchDepartmentsImpl();

  @override
  String toString() {
    return 'RegisterIntermediatePageEvent.fetchDepartments()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchDepartmentsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchGroups,
    required TResult Function() fetchDepartments,
    required TResult Function(
            String? name, Group? group, Department? department)
        updateData,
  }) {
    return fetchDepartments();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchGroups,
    TResult? Function()? fetchDepartments,
    TResult? Function(String? name, Group? group, Department? department)?
        updateData,
  }) {
    return fetchDepartments?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchGroups,
    TResult Function()? fetchDepartments,
    TResult Function(String? name, Group? group, Department? department)?
        updateData,
    required TResult orElse(),
  }) {
    if (fetchDepartments != null) {
      return fetchDepartments();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchGroups value) fetchGroups,
    required TResult Function(_FetchDepartments value) fetchDepartments,
    required TResult Function(_UpdateData value) updateData,
  }) {
    return fetchDepartments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchGroups value)? fetchGroups,
    TResult? Function(_FetchDepartments value)? fetchDepartments,
    TResult? Function(_UpdateData value)? updateData,
  }) {
    return fetchDepartments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchGroups value)? fetchGroups,
    TResult Function(_FetchDepartments value)? fetchDepartments,
    TResult Function(_UpdateData value)? updateData,
    required TResult orElse(),
  }) {
    if (fetchDepartments != null) {
      return fetchDepartments(this);
    }
    return orElse();
  }
}

abstract class _FetchDepartments implements RegisterIntermediatePageEvent {
  const factory _FetchDepartments() = _$FetchDepartmentsImpl;
}

/// @nodoc
abstract class _$$UpdateDataImplCopyWith<$Res> {
  factory _$$UpdateDataImplCopyWith(
          _$UpdateDataImpl value, $Res Function(_$UpdateDataImpl) then) =
      __$$UpdateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? name, Group? group, Department? department});

  $GroupCopyWith<$Res>? get group;
  $DepartmentCopyWith<$Res>? get department;
}

/// @nodoc
class __$$UpdateDataImplCopyWithImpl<$Res>
    extends _$RegisterIntermediatePageEventCopyWithImpl<$Res, _$UpdateDataImpl>
    implements _$$UpdateDataImplCopyWith<$Res> {
  __$$UpdateDataImplCopyWithImpl(
      _$UpdateDataImpl _value, $Res Function(_$UpdateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterIntermediatePageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? group = freezed,
    Object? department = freezed,
  }) {
    return _then(_$UpdateDataImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department?,
    ));
  }

  /// Create a copy of RegisterIntermediatePageEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupCopyWith<$Res>? get group {
    if (_value.group == null) {
      return null;
    }

    return $GroupCopyWith<$Res>(_value.group!, (value) {
      return _then(_value.copyWith(group: value));
    });
  }

  /// Create a copy of RegisterIntermediatePageEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res>? get department {
    if (_value.department == null) {
      return null;
    }

    return $DepartmentCopyWith<$Res>(_value.department!, (value) {
      return _then(_value.copyWith(department: value));
    });
  }
}

/// @nodoc

class _$UpdateDataImpl implements _UpdateData {
  const _$UpdateDataImpl({this.name, this.group, this.department});

// required String email,
// required String password,
  @override
  final String? name;
  @override
  final Group? group;
  @override
  final Department? department;

  @override
  String toString() {
    return 'RegisterIntermediatePageEvent.updateData(name: $name, group: $group, department: $department)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.department, department) ||
                other.department == department));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, group, department);

  /// Create a copy of RegisterIntermediatePageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDataImplCopyWith<_$UpdateDataImpl> get copyWith =>
      __$$UpdateDataImplCopyWithImpl<_$UpdateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchGroups,
    required TResult Function() fetchDepartments,
    required TResult Function(
            String? name, Group? group, Department? department)
        updateData,
  }) {
    return updateData(name, group, department);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchGroups,
    TResult? Function()? fetchDepartments,
    TResult? Function(String? name, Group? group, Department? department)?
        updateData,
  }) {
    return updateData?.call(name, group, department);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchGroups,
    TResult Function()? fetchDepartments,
    TResult Function(String? name, Group? group, Department? department)?
        updateData,
    required TResult orElse(),
  }) {
    if (updateData != null) {
      return updateData(name, group, department);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchGroups value) fetchGroups,
    required TResult Function(_FetchDepartments value) fetchDepartments,
    required TResult Function(_UpdateData value) updateData,
  }) {
    return updateData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchGroups value)? fetchGroups,
    TResult? Function(_FetchDepartments value)? fetchDepartments,
    TResult? Function(_UpdateData value)? updateData,
  }) {
    return updateData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchGroups value)? fetchGroups,
    TResult Function(_FetchDepartments value)? fetchDepartments,
    TResult Function(_UpdateData value)? updateData,
    required TResult orElse(),
  }) {
    if (updateData != null) {
      return updateData(this);
    }
    return orElse();
  }
}

abstract class _UpdateData implements RegisterIntermediatePageEvent {
  const factory _UpdateData(
      {final String? name,
      final Group? group,
      final Department? department}) = _$UpdateDataImpl;

// required String email,
// required String password,
  String? get name;
  Group? get group;
  Department? get department;

  /// Create a copy of RegisterIntermediatePageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateDataImplCopyWith<_$UpdateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterIntermediatePageState {
  RegisterIntermediatePageStatus get status =>
      throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<Group> get groups => throw _privateConstructorUsedError;
  List<Department> get departments => throw _privateConstructorUsedError;
  Group? get group => throw _privateConstructorUsedError;
  Department? get department => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Create a copy of RegisterIntermediatePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterIntermediatePageStateCopyWith<RegisterIntermediatePageState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterIntermediatePageStateCopyWith<$Res> {
  factory $RegisterIntermediatePageStateCopyWith(
          RegisterIntermediatePageState value,
          $Res Function(RegisterIntermediatePageState) then) =
      _$RegisterIntermediatePageStateCopyWithImpl<$Res,
          RegisterIntermediatePageState>;
  @useResult
  $Res call(
      {RegisterIntermediatePageStatus status,
      String errorMessage,
      List<Group> groups,
      List<Department> departments,
      Group? group,
      Department? department,
      String? name});

  $GroupCopyWith<$Res>? get group;
  $DepartmentCopyWith<$Res>? get department;
}

/// @nodoc
class _$RegisterIntermediatePageStateCopyWithImpl<$Res,
        $Val extends RegisterIntermediatePageState>
    implements $RegisterIntermediatePageStateCopyWith<$Res> {
  _$RegisterIntermediatePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterIntermediatePageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? groups = null,
    Object? departments = null,
    Object? group = freezed,
    Object? department = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RegisterIntermediatePageStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      departments: null == departments
          ? _value.departments
          : departments // ignore: cast_nullable_to_non_nullable
              as List<Department>,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of RegisterIntermediatePageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupCopyWith<$Res>? get group {
    if (_value.group == null) {
      return null;
    }

    return $GroupCopyWith<$Res>(_value.group!, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }

  /// Create a copy of RegisterIntermediatePageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res>? get department {
    if (_value.department == null) {
      return null;
    }

    return $DepartmentCopyWith<$Res>(_value.department!, (value) {
      return _then(_value.copyWith(department: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegisterIntermediatePageStateImplCopyWith<$Res>
    implements $RegisterIntermediatePageStateCopyWith<$Res> {
  factory _$$RegisterIntermediatePageStateImplCopyWith(
          _$RegisterIntermediatePageStateImpl value,
          $Res Function(_$RegisterIntermediatePageStateImpl) then) =
      __$$RegisterIntermediatePageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RegisterIntermediatePageStatus status,
      String errorMessage,
      List<Group> groups,
      List<Department> departments,
      Group? group,
      Department? department,
      String? name});

  @override
  $GroupCopyWith<$Res>? get group;
  @override
  $DepartmentCopyWith<$Res>? get department;
}

/// @nodoc
class __$$RegisterIntermediatePageStateImplCopyWithImpl<$Res>
    extends _$RegisterIntermediatePageStateCopyWithImpl<$Res,
        _$RegisterIntermediatePageStateImpl>
    implements _$$RegisterIntermediatePageStateImplCopyWith<$Res> {
  __$$RegisterIntermediatePageStateImplCopyWithImpl(
      _$RegisterIntermediatePageStateImpl _value,
      $Res Function(_$RegisterIntermediatePageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterIntermediatePageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? groups = null,
    Object? departments = null,
    Object? group = freezed,
    Object? department = freezed,
    Object? name = freezed,
  }) {
    return _then(_$RegisterIntermediatePageStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RegisterIntermediatePageStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>,
      departments: null == departments
          ? _value._departments
          : departments // ignore: cast_nullable_to_non_nullable
              as List<Department>,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RegisterIntermediatePageStateImpl
    implements _RegisterIntermediatePageState {
  const _$RegisterIntermediatePageStateImpl(
      {this.status = RegisterIntermediatePageStatus.initial,
      this.errorMessage = '',
      final List<Group> groups = const [],
      final List<Department> departments = const [],
      this.group,
      this.department,
      this.name})
      : _groups = groups,
        _departments = departments;

  @override
  @JsonKey()
  final RegisterIntermediatePageStatus status;
  @override
  @JsonKey()
  final String errorMessage;
  final List<Group> _groups;
  @override
  @JsonKey()
  List<Group> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  final List<Department> _departments;
  @override
  @JsonKey()
  List<Department> get departments {
    if (_departments is EqualUnmodifiableListView) return _departments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_departments);
  }

  @override
  final Group? group;
  @override
  final Department? department;
  @override
  final String? name;

  @override
  String toString() {
    return 'RegisterIntermediatePageState(status: $status, errorMessage: $errorMessage, groups: $groups, departments: $departments, group: $group, department: $department, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterIntermediatePageStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            const DeepCollectionEquality()
                .equals(other._departments, _departments) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      errorMessage,
      const DeepCollectionEquality().hash(_groups),
      const DeepCollectionEquality().hash(_departments),
      group,
      department,
      name);

  /// Create a copy of RegisterIntermediatePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterIntermediatePageStateImplCopyWith<
          _$RegisterIntermediatePageStateImpl>
      get copyWith => __$$RegisterIntermediatePageStateImplCopyWithImpl<
          _$RegisterIntermediatePageStateImpl>(this, _$identity);
}

abstract class _RegisterIntermediatePageState
    implements RegisterIntermediatePageState {
  const factory _RegisterIntermediatePageState(
      {final RegisterIntermediatePageStatus status,
      final String errorMessage,
      final List<Group> groups,
      final List<Department> departments,
      final Group? group,
      final Department? department,
      final String? name}) = _$RegisterIntermediatePageStateImpl;

  @override
  RegisterIntermediatePageStatus get status;
  @override
  String get errorMessage;
  @override
  List<Group> get groups;
  @override
  List<Department> get departments;
  @override
  Group? get group;
  @override
  Department? get department;
  @override
  String? get name;

  /// Create a copy of RegisterIntermediatePageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterIntermediatePageStateImplCopyWith<
          _$RegisterIntermediatePageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
