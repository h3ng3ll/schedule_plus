// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationPageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadNotifications,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotifications value) loadNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotifications value)? loadNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotifications value)? loadNotifications,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPageEventCopyWith<$Res> {
  factory $NotificationPageEventCopyWith(NotificationPageEvent value,
          $Res Function(NotificationPageEvent) then) =
      _$NotificationPageEventCopyWithImpl<$Res, NotificationPageEvent>;
}

/// @nodoc
class _$NotificationPageEventCopyWithImpl<$Res,
        $Val extends NotificationPageEvent>
    implements $NotificationPageEventCopyWith<$Res> {
  _$NotificationPageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadNotificationsImplCopyWith<$Res> {
  factory _$$LoadNotificationsImplCopyWith(_$LoadNotificationsImpl value,
          $Res Function(_$LoadNotificationsImpl) then) =
      __$$LoadNotificationsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadNotificationsImplCopyWithImpl<$Res>
    extends _$NotificationPageEventCopyWithImpl<$Res, _$LoadNotificationsImpl>
    implements _$$LoadNotificationsImplCopyWith<$Res> {
  __$$LoadNotificationsImplCopyWithImpl(_$LoadNotificationsImpl _value,
      $Res Function(_$LoadNotificationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadNotificationsImpl implements _LoadNotifications {
  const _$LoadNotificationsImpl();

  @override
  String toString() {
    return 'NotificationPageEvent.loadNotifications()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadNotificationsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadNotifications,
  }) {
    return loadNotifications();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadNotifications,
  }) {
    return loadNotifications?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadNotifications,
    required TResult orElse(),
  }) {
    if (loadNotifications != null) {
      return loadNotifications();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotifications value) loadNotifications,
  }) {
    return loadNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotifications value)? loadNotifications,
  }) {
    return loadNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotifications value)? loadNotifications,
    required TResult orElse(),
  }) {
    if (loadNotifications != null) {
      return loadNotifications(this);
    }
    return orElse();
  }
}

abstract class _LoadNotifications implements NotificationPageEvent {
  const factory _LoadNotifications() = _$LoadNotificationsImpl;
}

/// @nodoc
mixin _$NotificationPageState {
  NotificationPageStatus get status => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  List<Notification> get notifications => throw _privateConstructorUsedError;
  dynamic get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of NotificationPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationPageStateCopyWith<NotificationPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPageStateCopyWith<$Res> {
  factory $NotificationPageStateCopyWith(NotificationPageState value,
          $Res Function(NotificationPageState) then) =
      _$NotificationPageStateCopyWithImpl<$Res, NotificationPageState>;
  @useResult
  $Res call(
      {NotificationPageStatus status,
      int limit,
      List<Notification> notifications,
      dynamic errorMessage});
}

/// @nodoc
class _$NotificationPageStateCopyWithImpl<$Res,
        $Val extends NotificationPageState>
    implements $NotificationPageStateCopyWith<$Res> {
  _$NotificationPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? limit = null,
    Object? notifications = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NotificationPageStatus,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationPageStateImplCopyWith<$Res>
    implements $NotificationPageStateCopyWith<$Res> {
  factory _$$NotificationPageStateImplCopyWith(
          _$NotificationPageStateImpl value,
          $Res Function(_$NotificationPageStateImpl) then) =
      __$$NotificationPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NotificationPageStatus status,
      int limit,
      List<Notification> notifications,
      dynamic errorMessage});
}

/// @nodoc
class __$$NotificationPageStateImplCopyWithImpl<$Res>
    extends _$NotificationPageStateCopyWithImpl<$Res,
        _$NotificationPageStateImpl>
    implements _$$NotificationPageStateImplCopyWith<$Res> {
  __$$NotificationPageStateImplCopyWithImpl(_$NotificationPageStateImpl _value,
      $Res Function(_$NotificationPageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? limit = null,
    Object? notifications = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$NotificationPageStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NotificationPageStatus,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>,
      errorMessage:
          freezed == errorMessage ? _value.errorMessage! : errorMessage,
    ));
  }
}

/// @nodoc

class _$NotificationPageStateImpl implements _NotificationPageState {
  const _$NotificationPageStateImpl(
      {this.status = NotificationPageStatus.initial,
      this.limit = 8,
      final List<Notification> notifications = const [],
      this.errorMessage = ''})
      : _notifications = notifications;

  @override
  @JsonKey()
  final NotificationPageStatus status;
  @override
  @JsonKey()
  final int limit;
  final List<Notification> _notifications;
  @override
  @JsonKey()
  List<Notification> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  @JsonKey()
  final dynamic errorMessage;

  @override
  String toString() {
    return 'NotificationPageState(status: $status, limit: $limit, notifications: $notifications, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationPageStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      limit,
      const DeepCollectionEquality().hash(_notifications),
      const DeepCollectionEquality().hash(errorMessage));

  /// Create a copy of NotificationPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationPageStateImplCopyWith<_$NotificationPageStateImpl>
      get copyWith => __$$NotificationPageStateImplCopyWithImpl<
          _$NotificationPageStateImpl>(this, _$identity);
}

abstract class _NotificationPageState implements NotificationPageState {
  const factory _NotificationPageState(
      {final NotificationPageStatus status,
      final int limit,
      final List<Notification> notifications,
      final dynamic errorMessage}) = _$NotificationPageStateImpl;

  @override
  NotificationPageStatus get status;
  @override
  int get limit;
  @override
  List<Notification> get notifications;
  @override
  dynamic get errorMessage;

  /// Create a copy of NotificationPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationPageStateImplCopyWith<_$NotificationPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
