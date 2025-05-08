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
    required TResult Function(List<int> notificationIds) markAsReadMessages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadNotifications,
    TResult? Function(List<int> notificationIds)? markAsReadMessages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadNotifications,
    TResult Function(List<int> notificationIds)? markAsReadMessages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotifications value) loadNotifications,
    required TResult Function(_MarkAsReadMessages value) markAsReadMessages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotifications value)? loadNotifications,
    TResult? Function(_MarkAsReadMessages value)? markAsReadMessages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotifications value)? loadNotifications,
    TResult Function(_MarkAsReadMessages value)? markAsReadMessages,
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
    required TResult Function(List<int> notificationIds) markAsReadMessages,
  }) {
    return loadNotifications();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadNotifications,
    TResult? Function(List<int> notificationIds)? markAsReadMessages,
  }) {
    return loadNotifications?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadNotifications,
    TResult Function(List<int> notificationIds)? markAsReadMessages,
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
    required TResult Function(_MarkAsReadMessages value) markAsReadMessages,
  }) {
    return loadNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotifications value)? loadNotifications,
    TResult? Function(_MarkAsReadMessages value)? markAsReadMessages,
  }) {
    return loadNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotifications value)? loadNotifications,
    TResult Function(_MarkAsReadMessages value)? markAsReadMessages,
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
abstract class _$$MarkAsReadMessagesImplCopyWith<$Res> {
  factory _$$MarkAsReadMessagesImplCopyWith(_$MarkAsReadMessagesImpl value,
          $Res Function(_$MarkAsReadMessagesImpl) then) =
      __$$MarkAsReadMessagesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<int> notificationIds});
}

/// @nodoc
class __$$MarkAsReadMessagesImplCopyWithImpl<$Res>
    extends _$NotificationPageEventCopyWithImpl<$Res, _$MarkAsReadMessagesImpl>
    implements _$$MarkAsReadMessagesImplCopyWith<$Res> {
  __$$MarkAsReadMessagesImplCopyWithImpl(_$MarkAsReadMessagesImpl _value,
      $Res Function(_$MarkAsReadMessagesImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationIds = null,
  }) {
    return _then(_$MarkAsReadMessagesImpl(
      notificationIds: null == notificationIds
          ? _value._notificationIds
          : notificationIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$MarkAsReadMessagesImpl implements _MarkAsReadMessages {
  const _$MarkAsReadMessagesImpl({required final List<int> notificationIds})
      : _notificationIds = notificationIds;

  final List<int> _notificationIds;
  @override
  List<int> get notificationIds {
    if (_notificationIds is EqualUnmodifiableListView) return _notificationIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notificationIds);
  }

  @override
  String toString() {
    return 'NotificationPageEvent.markAsReadMessages(notificationIds: $notificationIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkAsReadMessagesImpl &&
            const DeepCollectionEquality()
                .equals(other._notificationIds, _notificationIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notificationIds));

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkAsReadMessagesImplCopyWith<_$MarkAsReadMessagesImpl> get copyWith =>
      __$$MarkAsReadMessagesImplCopyWithImpl<_$MarkAsReadMessagesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadNotifications,
    required TResult Function(List<int> notificationIds) markAsReadMessages,
  }) {
    return markAsReadMessages(notificationIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadNotifications,
    TResult? Function(List<int> notificationIds)? markAsReadMessages,
  }) {
    return markAsReadMessages?.call(notificationIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadNotifications,
    TResult Function(List<int> notificationIds)? markAsReadMessages,
    required TResult orElse(),
  }) {
    if (markAsReadMessages != null) {
      return markAsReadMessages(notificationIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotifications value) loadNotifications,
    required TResult Function(_MarkAsReadMessages value) markAsReadMessages,
  }) {
    return markAsReadMessages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotifications value)? loadNotifications,
    TResult? Function(_MarkAsReadMessages value)? markAsReadMessages,
  }) {
    return markAsReadMessages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotifications value)? loadNotifications,
    TResult Function(_MarkAsReadMessages value)? markAsReadMessages,
    required TResult orElse(),
  }) {
    if (markAsReadMessages != null) {
      return markAsReadMessages(this);
    }
    return orElse();
  }
}

abstract class _MarkAsReadMessages implements NotificationPageEvent {
  const factory _MarkAsReadMessages(
      {required final List<int> notificationIds}) = _$MarkAsReadMessagesImpl;

  List<int> get notificationIds;

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkAsReadMessagesImplCopyWith<_$MarkAsReadMessagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotificationPageState {
  NotificationPageStatus get status => throw _privateConstructorUsedError;
  NotificationPaginationState get paginationState =>
      throw _privateConstructorUsedError;
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
      NotificationPaginationState paginationState,
      dynamic errorMessage});

  $NotificationPaginationStateCopyWith<$Res> get paginationState;
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
    Object? paginationState = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NotificationPageStatus,
      paginationState: null == paginationState
          ? _value.paginationState
          : paginationState // ignore: cast_nullable_to_non_nullable
              as NotificationPaginationState,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  /// Create a copy of NotificationPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationPaginationStateCopyWith<$Res> get paginationState {
    return $NotificationPaginationStateCopyWith<$Res>(_value.paginationState,
        (value) {
      return _then(_value.copyWith(paginationState: value) as $Val);
    });
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
      NotificationPaginationState paginationState,
      dynamic errorMessage});

  @override
  $NotificationPaginationStateCopyWith<$Res> get paginationState;
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
    Object? paginationState = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$NotificationPageStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NotificationPageStatus,
      paginationState: null == paginationState
          ? _value.paginationState
          : paginationState // ignore: cast_nullable_to_non_nullable
              as NotificationPaginationState,
      errorMessage:
          freezed == errorMessage ? _value.errorMessage! : errorMessage,
    ));
  }
}

/// @nodoc

class _$NotificationPageStateImpl implements _NotificationPageState {
  const _$NotificationPageStateImpl(
      {this.status = NotificationPageStatus.initial,
      this.paginationState = const NotificationPaginationState(),
      this.errorMessage = ''});

  @override
  @JsonKey()
  final NotificationPageStatus status;
  @override
  @JsonKey()
  final NotificationPaginationState paginationState;
  @override
  @JsonKey()
  final dynamic errorMessage;

  @override
  String toString() {
    return 'NotificationPageState(status: $status, paginationState: $paginationState, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationPageStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paginationState, paginationState) ||
                other.paginationState == paginationState) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, paginationState,
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
      final NotificationPaginationState paginationState,
      final dynamic errorMessage}) = _$NotificationPageStateImpl;

  @override
  NotificationPageStatus get status;
  @override
  NotificationPaginationState get paginationState;
  @override
  dynamic get errorMessage;

  /// Create a copy of NotificationPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationPageStateImplCopyWith<_$NotificationPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
