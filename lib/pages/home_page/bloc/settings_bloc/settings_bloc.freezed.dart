// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) update,
    required TResult Function() fetchUnReadMessagesCount,
    required TResult Function() incrementUnReadMessagesCount,
    required TResult Function(int counts) unReadLastMessages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? update,
    TResult? Function()? fetchUnReadMessagesCount,
    TResult? Function()? incrementUnReadMessagesCount,
    TResult? Function(int counts)? unReadLastMessages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? update,
    TResult Function()? fetchUnReadMessagesCount,
    TResult Function()? incrementUnReadMessagesCount,
    TResult Function(int counts)? unReadLastMessages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Update value) update,
    required TResult Function(_FetchUnReadMessagesCount value)
        fetchUnReadMessagesCount,
    required TResult Function(_IncrementUnReadMessagesCount value)
        incrementUnReadMessagesCount,
    required TResult Function(_UnReadLastMessages value) unReadLastMessages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Update value)? update,
    TResult? Function(_FetchUnReadMessagesCount value)?
        fetchUnReadMessagesCount,
    TResult? Function(_IncrementUnReadMessagesCount value)?
        incrementUnReadMessagesCount,
    TResult? Function(_UnReadLastMessages value)? unReadLastMessages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_FetchUnReadMessagesCount value)? fetchUnReadMessagesCount,
    TResult Function(_IncrementUnReadMessagesCount value)?
        incrementUnReadMessagesCount,
    TResult Function(_UnReadLastMessages value)? unReadLastMessages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res, SettingsEvent>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res, $Val extends SettingsEvent>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UpdateImplCopyWith<$Res> {
  factory _$$UpdateImplCopyWith(
          _$UpdateImpl value, $Res Function(_$UpdateImpl) then) =
      __$$UpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$UpdateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$UpdateImpl implements _Update {
  const _$UpdateImpl({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'SettingsEvent.update(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      __$$UpdateImplCopyWithImpl<_$UpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) update,
    required TResult Function() fetchUnReadMessagesCount,
    required TResult Function() incrementUnReadMessagesCount,
    required TResult Function(int counts) unReadLastMessages,
  }) {
    return update(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? update,
    TResult? Function()? fetchUnReadMessagesCount,
    TResult? Function()? incrementUnReadMessagesCount,
    TResult? Function(int counts)? unReadLastMessages,
  }) {
    return update?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? update,
    TResult Function()? fetchUnReadMessagesCount,
    TResult Function()? incrementUnReadMessagesCount,
    TResult Function(int counts)? unReadLastMessages,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Update value) update,
    required TResult Function(_FetchUnReadMessagesCount value)
        fetchUnReadMessagesCount,
    required TResult Function(_IncrementUnReadMessagesCount value)
        incrementUnReadMessagesCount,
    required TResult Function(_UnReadLastMessages value) unReadLastMessages,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Update value)? update,
    TResult? Function(_FetchUnReadMessagesCount value)?
        fetchUnReadMessagesCount,
    TResult? Function(_IncrementUnReadMessagesCount value)?
        incrementUnReadMessagesCount,
    TResult? Function(_UnReadLastMessages value)? unReadLastMessages,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_FetchUnReadMessagesCount value)? fetchUnReadMessagesCount,
    TResult Function(_IncrementUnReadMessagesCount value)?
        incrementUnReadMessagesCount,
    TResult Function(_UnReadLastMessages value)? unReadLastMessages,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements SettingsEvent {
  const factory _Update({required final User user}) = _$UpdateImpl;

  User get user;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchUnReadMessagesCountImplCopyWith<$Res> {
  factory _$$FetchUnReadMessagesCountImplCopyWith(
          _$FetchUnReadMessagesCountImpl value,
          $Res Function(_$FetchUnReadMessagesCountImpl) then) =
      __$$FetchUnReadMessagesCountImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchUnReadMessagesCountImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$FetchUnReadMessagesCountImpl>
    implements _$$FetchUnReadMessagesCountImplCopyWith<$Res> {
  __$$FetchUnReadMessagesCountImplCopyWithImpl(
      _$FetchUnReadMessagesCountImpl _value,
      $Res Function(_$FetchUnReadMessagesCountImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchUnReadMessagesCountImpl implements _FetchUnReadMessagesCount {
  const _$FetchUnReadMessagesCountImpl();

  @override
  String toString() {
    return 'SettingsEvent.fetchUnReadMessagesCount()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchUnReadMessagesCountImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) update,
    required TResult Function() fetchUnReadMessagesCount,
    required TResult Function() incrementUnReadMessagesCount,
    required TResult Function(int counts) unReadLastMessages,
  }) {
    return fetchUnReadMessagesCount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? update,
    TResult? Function()? fetchUnReadMessagesCount,
    TResult? Function()? incrementUnReadMessagesCount,
    TResult? Function(int counts)? unReadLastMessages,
  }) {
    return fetchUnReadMessagesCount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? update,
    TResult Function()? fetchUnReadMessagesCount,
    TResult Function()? incrementUnReadMessagesCount,
    TResult Function(int counts)? unReadLastMessages,
    required TResult orElse(),
  }) {
    if (fetchUnReadMessagesCount != null) {
      return fetchUnReadMessagesCount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Update value) update,
    required TResult Function(_FetchUnReadMessagesCount value)
        fetchUnReadMessagesCount,
    required TResult Function(_IncrementUnReadMessagesCount value)
        incrementUnReadMessagesCount,
    required TResult Function(_UnReadLastMessages value) unReadLastMessages,
  }) {
    return fetchUnReadMessagesCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Update value)? update,
    TResult? Function(_FetchUnReadMessagesCount value)?
        fetchUnReadMessagesCount,
    TResult? Function(_IncrementUnReadMessagesCount value)?
        incrementUnReadMessagesCount,
    TResult? Function(_UnReadLastMessages value)? unReadLastMessages,
  }) {
    return fetchUnReadMessagesCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_FetchUnReadMessagesCount value)? fetchUnReadMessagesCount,
    TResult Function(_IncrementUnReadMessagesCount value)?
        incrementUnReadMessagesCount,
    TResult Function(_UnReadLastMessages value)? unReadLastMessages,
    required TResult orElse(),
  }) {
    if (fetchUnReadMessagesCount != null) {
      return fetchUnReadMessagesCount(this);
    }
    return orElse();
  }
}

abstract class _FetchUnReadMessagesCount implements SettingsEvent {
  const factory _FetchUnReadMessagesCount() = _$FetchUnReadMessagesCountImpl;
}

/// @nodoc
abstract class _$$IncrementUnReadMessagesCountImplCopyWith<$Res> {
  factory _$$IncrementUnReadMessagesCountImplCopyWith(
          _$IncrementUnReadMessagesCountImpl value,
          $Res Function(_$IncrementUnReadMessagesCountImpl) then) =
      __$$IncrementUnReadMessagesCountImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IncrementUnReadMessagesCountImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res,
        _$IncrementUnReadMessagesCountImpl>
    implements _$$IncrementUnReadMessagesCountImplCopyWith<$Res> {
  __$$IncrementUnReadMessagesCountImplCopyWithImpl(
      _$IncrementUnReadMessagesCountImpl _value,
      $Res Function(_$IncrementUnReadMessagesCountImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IncrementUnReadMessagesCountImpl
    implements _IncrementUnReadMessagesCount {
  const _$IncrementUnReadMessagesCountImpl();

  @override
  String toString() {
    return 'SettingsEvent.incrementUnReadMessagesCount()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncrementUnReadMessagesCountImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) update,
    required TResult Function() fetchUnReadMessagesCount,
    required TResult Function() incrementUnReadMessagesCount,
    required TResult Function(int counts) unReadLastMessages,
  }) {
    return incrementUnReadMessagesCount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? update,
    TResult? Function()? fetchUnReadMessagesCount,
    TResult? Function()? incrementUnReadMessagesCount,
    TResult? Function(int counts)? unReadLastMessages,
  }) {
    return incrementUnReadMessagesCount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? update,
    TResult Function()? fetchUnReadMessagesCount,
    TResult Function()? incrementUnReadMessagesCount,
    TResult Function(int counts)? unReadLastMessages,
    required TResult orElse(),
  }) {
    if (incrementUnReadMessagesCount != null) {
      return incrementUnReadMessagesCount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Update value) update,
    required TResult Function(_FetchUnReadMessagesCount value)
        fetchUnReadMessagesCount,
    required TResult Function(_IncrementUnReadMessagesCount value)
        incrementUnReadMessagesCount,
    required TResult Function(_UnReadLastMessages value) unReadLastMessages,
  }) {
    return incrementUnReadMessagesCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Update value)? update,
    TResult? Function(_FetchUnReadMessagesCount value)?
        fetchUnReadMessagesCount,
    TResult? Function(_IncrementUnReadMessagesCount value)?
        incrementUnReadMessagesCount,
    TResult? Function(_UnReadLastMessages value)? unReadLastMessages,
  }) {
    return incrementUnReadMessagesCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_FetchUnReadMessagesCount value)? fetchUnReadMessagesCount,
    TResult Function(_IncrementUnReadMessagesCount value)?
        incrementUnReadMessagesCount,
    TResult Function(_UnReadLastMessages value)? unReadLastMessages,
    required TResult orElse(),
  }) {
    if (incrementUnReadMessagesCount != null) {
      return incrementUnReadMessagesCount(this);
    }
    return orElse();
  }
}

abstract class _IncrementUnReadMessagesCount implements SettingsEvent {
  const factory _IncrementUnReadMessagesCount() =
      _$IncrementUnReadMessagesCountImpl;
}

/// @nodoc
abstract class _$$UnReadLastMessagesImplCopyWith<$Res> {
  factory _$$UnReadLastMessagesImplCopyWith(_$UnReadLastMessagesImpl value,
          $Res Function(_$UnReadLastMessagesImpl) then) =
      __$$UnReadLastMessagesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int counts});
}

/// @nodoc
class __$$UnReadLastMessagesImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$UnReadLastMessagesImpl>
    implements _$$UnReadLastMessagesImplCopyWith<$Res> {
  __$$UnReadLastMessagesImplCopyWithImpl(_$UnReadLastMessagesImpl _value,
      $Res Function(_$UnReadLastMessagesImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counts = null,
  }) {
    return _then(_$UnReadLastMessagesImpl(
      counts: null == counts
          ? _value.counts
          : counts // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UnReadLastMessagesImpl implements _UnReadLastMessages {
  const _$UnReadLastMessagesImpl({required this.counts});

  @override
  final int counts;

  @override
  String toString() {
    return 'SettingsEvent.unReadLastMessages(counts: $counts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnReadLastMessagesImpl &&
            (identical(other.counts, counts) || other.counts == counts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, counts);

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnReadLastMessagesImplCopyWith<_$UnReadLastMessagesImpl> get copyWith =>
      __$$UnReadLastMessagesImplCopyWithImpl<_$UnReadLastMessagesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) update,
    required TResult Function() fetchUnReadMessagesCount,
    required TResult Function() incrementUnReadMessagesCount,
    required TResult Function(int counts) unReadLastMessages,
  }) {
    return unReadLastMessages(counts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? update,
    TResult? Function()? fetchUnReadMessagesCount,
    TResult? Function()? incrementUnReadMessagesCount,
    TResult? Function(int counts)? unReadLastMessages,
  }) {
    return unReadLastMessages?.call(counts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? update,
    TResult Function()? fetchUnReadMessagesCount,
    TResult Function()? incrementUnReadMessagesCount,
    TResult Function(int counts)? unReadLastMessages,
    required TResult orElse(),
  }) {
    if (unReadLastMessages != null) {
      return unReadLastMessages(counts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Update value) update,
    required TResult Function(_FetchUnReadMessagesCount value)
        fetchUnReadMessagesCount,
    required TResult Function(_IncrementUnReadMessagesCount value)
        incrementUnReadMessagesCount,
    required TResult Function(_UnReadLastMessages value) unReadLastMessages,
  }) {
    return unReadLastMessages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Update value)? update,
    TResult? Function(_FetchUnReadMessagesCount value)?
        fetchUnReadMessagesCount,
    TResult? Function(_IncrementUnReadMessagesCount value)?
        incrementUnReadMessagesCount,
    TResult? Function(_UnReadLastMessages value)? unReadLastMessages,
  }) {
    return unReadLastMessages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Update value)? update,
    TResult Function(_FetchUnReadMessagesCount value)? fetchUnReadMessagesCount,
    TResult Function(_IncrementUnReadMessagesCount value)?
        incrementUnReadMessagesCount,
    TResult Function(_UnReadLastMessages value)? unReadLastMessages,
    required TResult orElse(),
  }) {
    if (unReadLastMessages != null) {
      return unReadLastMessages(this);
    }
    return orElse();
  }
}

abstract class _UnReadLastMessages implements SettingsEvent {
  const factory _UnReadLastMessages({required final int counts}) =
      _$UnReadLastMessagesImpl;

  int get counts;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnReadLastMessagesImplCopyWith<_$UnReadLastMessagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SettingsState {
  User get user => throw _privateConstructorUsedError;
  int get unReadNotifications => throw _privateConstructorUsedError;
  SettingsStatus get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call(
      {User user,
      int unReadNotifications,
      SettingsStatus status,
      String message});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? unReadNotifications = null,
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      unReadNotifications: null == unReadNotifications
          ? _value.unReadNotifications
          : unReadNotifications // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SettingsStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SettingsStateImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$SettingsStateImplCopyWith(
          _$SettingsStateImpl value, $Res Function(_$SettingsStateImpl) then) =
      __$$SettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user,
      int unReadNotifications,
      SettingsStatus status,
      String message});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$SettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateImpl>
    implements _$$SettingsStateImplCopyWith<$Res> {
  __$$SettingsStateImplCopyWithImpl(
      _$SettingsStateImpl _value, $Res Function(_$SettingsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? unReadNotifications = null,
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_$SettingsStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      unReadNotifications: null == unReadNotifications
          ? _value.unReadNotifications
          : unReadNotifications // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SettingsStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SettingsStateImpl implements _SettingsState {
  const _$SettingsStateImpl(
      {required this.user,
      this.unReadNotifications = 0,
      this.status = SettingsStatus.initial,
      this.message = ''});

  @override
  final User user;
  @override
  @JsonKey()
  final int unReadNotifications;
  @override
  @JsonKey()
  final SettingsStatus status;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'SettingsState(user: $user, unReadNotifications: $unReadNotifications, status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.unReadNotifications, unReadNotifications) ||
                other.unReadNotifications == unReadNotifications) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, unReadNotifications, status, message);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      __$$SettingsStateImplCopyWithImpl<_$SettingsStateImpl>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  const factory _SettingsState(
      {required final User user,
      final int unReadNotifications,
      final SettingsStatus status,
      final String message}) = _$SettingsStateImpl;

  @override
  User get user;
  @override
  int get unReadNotifications;
  @override
  SettingsStatus get status;
  @override
  String get message;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
