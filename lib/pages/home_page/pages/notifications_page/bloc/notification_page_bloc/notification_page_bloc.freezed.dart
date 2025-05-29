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
    required TResult Function() loadUnreadMessagesCount,
    required TResult Function() markAsReadMessages,
    required TResult Function(NotificationPaginationState notificationPgState)
        updateMessages,
    required TResult Function(int unreadMessageCount) updateUnreadMessageCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadNotifications,
    TResult? Function()? loadUnreadMessagesCount,
    TResult? Function()? markAsReadMessages,
    TResult? Function(NotificationPaginationState notificationPgState)?
        updateMessages,
    TResult? Function(int unreadMessageCount)? updateUnreadMessageCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadNotifications,
    TResult Function()? loadUnreadMessagesCount,
    TResult Function()? markAsReadMessages,
    TResult Function(NotificationPaginationState notificationPgState)?
        updateMessages,
    TResult Function(int unreadMessageCount)? updateUnreadMessageCount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotifications value) loadNotifications,
    required TResult Function(_LoadUnreadMessagesCount value)
        loadUnreadMessagesCount,
    required TResult Function(_MarkAsReadMessages value) markAsReadMessages,
    required TResult Function(_UpdateMessages value) updateMessages,
    required TResult Function(_UpdateUnreadMessageCount value)
        updateUnreadMessageCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotifications value)? loadNotifications,
    TResult? Function(_LoadUnreadMessagesCount value)? loadUnreadMessagesCount,
    TResult? Function(_MarkAsReadMessages value)? markAsReadMessages,
    TResult? Function(_UpdateMessages value)? updateMessages,
    TResult? Function(_UpdateUnreadMessageCount value)?
        updateUnreadMessageCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotifications value)? loadNotifications,
    TResult Function(_LoadUnreadMessagesCount value)? loadUnreadMessagesCount,
    TResult Function(_MarkAsReadMessages value)? markAsReadMessages,
    TResult Function(_UpdateMessages value)? updateMessages,
    TResult Function(_UpdateUnreadMessageCount value)? updateUnreadMessageCount,
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
    required TResult Function() loadUnreadMessagesCount,
    required TResult Function() markAsReadMessages,
    required TResult Function(NotificationPaginationState notificationPgState)
        updateMessages,
    required TResult Function(int unreadMessageCount) updateUnreadMessageCount,
  }) {
    return loadNotifications();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadNotifications,
    TResult? Function()? loadUnreadMessagesCount,
    TResult? Function()? markAsReadMessages,
    TResult? Function(NotificationPaginationState notificationPgState)?
        updateMessages,
    TResult? Function(int unreadMessageCount)? updateUnreadMessageCount,
  }) {
    return loadNotifications?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadNotifications,
    TResult Function()? loadUnreadMessagesCount,
    TResult Function()? markAsReadMessages,
    TResult Function(NotificationPaginationState notificationPgState)?
        updateMessages,
    TResult Function(int unreadMessageCount)? updateUnreadMessageCount,
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
    required TResult Function(_LoadUnreadMessagesCount value)
        loadUnreadMessagesCount,
    required TResult Function(_MarkAsReadMessages value) markAsReadMessages,
    required TResult Function(_UpdateMessages value) updateMessages,
    required TResult Function(_UpdateUnreadMessageCount value)
        updateUnreadMessageCount,
  }) {
    return loadNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotifications value)? loadNotifications,
    TResult? Function(_LoadUnreadMessagesCount value)? loadUnreadMessagesCount,
    TResult? Function(_MarkAsReadMessages value)? markAsReadMessages,
    TResult? Function(_UpdateMessages value)? updateMessages,
    TResult? Function(_UpdateUnreadMessageCount value)?
        updateUnreadMessageCount,
  }) {
    return loadNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotifications value)? loadNotifications,
    TResult Function(_LoadUnreadMessagesCount value)? loadUnreadMessagesCount,
    TResult Function(_MarkAsReadMessages value)? markAsReadMessages,
    TResult Function(_UpdateMessages value)? updateMessages,
    TResult Function(_UpdateUnreadMessageCount value)? updateUnreadMessageCount,
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
abstract class _$$LoadUnreadMessagesCountImplCopyWith<$Res> {
  factory _$$LoadUnreadMessagesCountImplCopyWith(
          _$LoadUnreadMessagesCountImpl value,
          $Res Function(_$LoadUnreadMessagesCountImpl) then) =
      __$$LoadUnreadMessagesCountImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadUnreadMessagesCountImplCopyWithImpl<$Res>
    extends _$NotificationPageEventCopyWithImpl<$Res,
        _$LoadUnreadMessagesCountImpl>
    implements _$$LoadUnreadMessagesCountImplCopyWith<$Res> {
  __$$LoadUnreadMessagesCountImplCopyWithImpl(
      _$LoadUnreadMessagesCountImpl _value,
      $Res Function(_$LoadUnreadMessagesCountImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadUnreadMessagesCountImpl implements _LoadUnreadMessagesCount {
  const _$LoadUnreadMessagesCountImpl();

  @override
  String toString() {
    return 'NotificationPageEvent.loadUnreadMessagesCount()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadUnreadMessagesCountImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadNotifications,
    required TResult Function() loadUnreadMessagesCount,
    required TResult Function() markAsReadMessages,
    required TResult Function(NotificationPaginationState notificationPgState)
        updateMessages,
    required TResult Function(int unreadMessageCount) updateUnreadMessageCount,
  }) {
    return loadUnreadMessagesCount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadNotifications,
    TResult? Function()? loadUnreadMessagesCount,
    TResult? Function()? markAsReadMessages,
    TResult? Function(NotificationPaginationState notificationPgState)?
        updateMessages,
    TResult? Function(int unreadMessageCount)? updateUnreadMessageCount,
  }) {
    return loadUnreadMessagesCount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadNotifications,
    TResult Function()? loadUnreadMessagesCount,
    TResult Function()? markAsReadMessages,
    TResult Function(NotificationPaginationState notificationPgState)?
        updateMessages,
    TResult Function(int unreadMessageCount)? updateUnreadMessageCount,
    required TResult orElse(),
  }) {
    if (loadUnreadMessagesCount != null) {
      return loadUnreadMessagesCount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotifications value) loadNotifications,
    required TResult Function(_LoadUnreadMessagesCount value)
        loadUnreadMessagesCount,
    required TResult Function(_MarkAsReadMessages value) markAsReadMessages,
    required TResult Function(_UpdateMessages value) updateMessages,
    required TResult Function(_UpdateUnreadMessageCount value)
        updateUnreadMessageCount,
  }) {
    return loadUnreadMessagesCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotifications value)? loadNotifications,
    TResult? Function(_LoadUnreadMessagesCount value)? loadUnreadMessagesCount,
    TResult? Function(_MarkAsReadMessages value)? markAsReadMessages,
    TResult? Function(_UpdateMessages value)? updateMessages,
    TResult? Function(_UpdateUnreadMessageCount value)?
        updateUnreadMessageCount,
  }) {
    return loadUnreadMessagesCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotifications value)? loadNotifications,
    TResult Function(_LoadUnreadMessagesCount value)? loadUnreadMessagesCount,
    TResult Function(_MarkAsReadMessages value)? markAsReadMessages,
    TResult Function(_UpdateMessages value)? updateMessages,
    TResult Function(_UpdateUnreadMessageCount value)? updateUnreadMessageCount,
    required TResult orElse(),
  }) {
    if (loadUnreadMessagesCount != null) {
      return loadUnreadMessagesCount(this);
    }
    return orElse();
  }
}

abstract class _LoadUnreadMessagesCount implements NotificationPageEvent {
  const factory _LoadUnreadMessagesCount() = _$LoadUnreadMessagesCountImpl;
}

/// @nodoc
abstract class _$$MarkAsReadMessagesImplCopyWith<$Res> {
  factory _$$MarkAsReadMessagesImplCopyWith(_$MarkAsReadMessagesImpl value,
          $Res Function(_$MarkAsReadMessagesImpl) then) =
      __$$MarkAsReadMessagesImplCopyWithImpl<$Res>;
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
}

/// @nodoc

class _$MarkAsReadMessagesImpl implements _MarkAsReadMessages {
  const _$MarkAsReadMessagesImpl();

  @override
  String toString() {
    return 'NotificationPageEvent.markAsReadMessages()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MarkAsReadMessagesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadNotifications,
    required TResult Function() loadUnreadMessagesCount,
    required TResult Function() markAsReadMessages,
    required TResult Function(NotificationPaginationState notificationPgState)
        updateMessages,
    required TResult Function(int unreadMessageCount) updateUnreadMessageCount,
  }) {
    return markAsReadMessages();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadNotifications,
    TResult? Function()? loadUnreadMessagesCount,
    TResult? Function()? markAsReadMessages,
    TResult? Function(NotificationPaginationState notificationPgState)?
        updateMessages,
    TResult? Function(int unreadMessageCount)? updateUnreadMessageCount,
  }) {
    return markAsReadMessages?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadNotifications,
    TResult Function()? loadUnreadMessagesCount,
    TResult Function()? markAsReadMessages,
    TResult Function(NotificationPaginationState notificationPgState)?
        updateMessages,
    TResult Function(int unreadMessageCount)? updateUnreadMessageCount,
    required TResult orElse(),
  }) {
    if (markAsReadMessages != null) {
      return markAsReadMessages();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotifications value) loadNotifications,
    required TResult Function(_LoadUnreadMessagesCount value)
        loadUnreadMessagesCount,
    required TResult Function(_MarkAsReadMessages value) markAsReadMessages,
    required TResult Function(_UpdateMessages value) updateMessages,
    required TResult Function(_UpdateUnreadMessageCount value)
        updateUnreadMessageCount,
  }) {
    return markAsReadMessages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotifications value)? loadNotifications,
    TResult? Function(_LoadUnreadMessagesCount value)? loadUnreadMessagesCount,
    TResult? Function(_MarkAsReadMessages value)? markAsReadMessages,
    TResult? Function(_UpdateMessages value)? updateMessages,
    TResult? Function(_UpdateUnreadMessageCount value)?
        updateUnreadMessageCount,
  }) {
    return markAsReadMessages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotifications value)? loadNotifications,
    TResult Function(_LoadUnreadMessagesCount value)? loadUnreadMessagesCount,
    TResult Function(_MarkAsReadMessages value)? markAsReadMessages,
    TResult Function(_UpdateMessages value)? updateMessages,
    TResult Function(_UpdateUnreadMessageCount value)? updateUnreadMessageCount,
    required TResult orElse(),
  }) {
    if (markAsReadMessages != null) {
      return markAsReadMessages(this);
    }
    return orElse();
  }
}

abstract class _MarkAsReadMessages implements NotificationPageEvent {
  const factory _MarkAsReadMessages() = _$MarkAsReadMessagesImpl;
}

/// @nodoc
abstract class _$$UpdateMessagesImplCopyWith<$Res> {
  factory _$$UpdateMessagesImplCopyWith(_$UpdateMessagesImpl value,
          $Res Function(_$UpdateMessagesImpl) then) =
      __$$UpdateMessagesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NotificationPaginationState notificationPgState});

  $NotificationPaginationStateCopyWith<$Res> get notificationPgState;
}

/// @nodoc
class __$$UpdateMessagesImplCopyWithImpl<$Res>
    extends _$NotificationPageEventCopyWithImpl<$Res, _$UpdateMessagesImpl>
    implements _$$UpdateMessagesImplCopyWith<$Res> {
  __$$UpdateMessagesImplCopyWithImpl(
      _$UpdateMessagesImpl _value, $Res Function(_$UpdateMessagesImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationPgState = null,
  }) {
    return _then(_$UpdateMessagesImpl(
      notificationPgState: null == notificationPgState
          ? _value.notificationPgState
          : notificationPgState // ignore: cast_nullable_to_non_nullable
              as NotificationPaginationState,
    ));
  }

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationPaginationStateCopyWith<$Res> get notificationPgState {
    return $NotificationPaginationStateCopyWith<$Res>(
        _value.notificationPgState, (value) {
      return _then(_value.copyWith(notificationPgState: value));
    });
  }
}

/// @nodoc

class _$UpdateMessagesImpl implements _UpdateMessages {
  const _$UpdateMessagesImpl({required this.notificationPgState});

  @override
  final NotificationPaginationState notificationPgState;

  @override
  String toString() {
    return 'NotificationPageEvent.updateMessages(notificationPgState: $notificationPgState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateMessagesImpl &&
            (identical(other.notificationPgState, notificationPgState) ||
                other.notificationPgState == notificationPgState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notificationPgState);

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateMessagesImplCopyWith<_$UpdateMessagesImpl> get copyWith =>
      __$$UpdateMessagesImplCopyWithImpl<_$UpdateMessagesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadNotifications,
    required TResult Function() loadUnreadMessagesCount,
    required TResult Function() markAsReadMessages,
    required TResult Function(NotificationPaginationState notificationPgState)
        updateMessages,
    required TResult Function(int unreadMessageCount) updateUnreadMessageCount,
  }) {
    return updateMessages(notificationPgState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadNotifications,
    TResult? Function()? loadUnreadMessagesCount,
    TResult? Function()? markAsReadMessages,
    TResult? Function(NotificationPaginationState notificationPgState)?
        updateMessages,
    TResult? Function(int unreadMessageCount)? updateUnreadMessageCount,
  }) {
    return updateMessages?.call(notificationPgState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadNotifications,
    TResult Function()? loadUnreadMessagesCount,
    TResult Function()? markAsReadMessages,
    TResult Function(NotificationPaginationState notificationPgState)?
        updateMessages,
    TResult Function(int unreadMessageCount)? updateUnreadMessageCount,
    required TResult orElse(),
  }) {
    if (updateMessages != null) {
      return updateMessages(notificationPgState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotifications value) loadNotifications,
    required TResult Function(_LoadUnreadMessagesCount value)
        loadUnreadMessagesCount,
    required TResult Function(_MarkAsReadMessages value) markAsReadMessages,
    required TResult Function(_UpdateMessages value) updateMessages,
    required TResult Function(_UpdateUnreadMessageCount value)
        updateUnreadMessageCount,
  }) {
    return updateMessages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotifications value)? loadNotifications,
    TResult? Function(_LoadUnreadMessagesCount value)? loadUnreadMessagesCount,
    TResult? Function(_MarkAsReadMessages value)? markAsReadMessages,
    TResult? Function(_UpdateMessages value)? updateMessages,
    TResult? Function(_UpdateUnreadMessageCount value)?
        updateUnreadMessageCount,
  }) {
    return updateMessages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotifications value)? loadNotifications,
    TResult Function(_LoadUnreadMessagesCount value)? loadUnreadMessagesCount,
    TResult Function(_MarkAsReadMessages value)? markAsReadMessages,
    TResult Function(_UpdateMessages value)? updateMessages,
    TResult Function(_UpdateUnreadMessageCount value)? updateUnreadMessageCount,
    required TResult orElse(),
  }) {
    if (updateMessages != null) {
      return updateMessages(this);
    }
    return orElse();
  }
}

abstract class _UpdateMessages implements NotificationPageEvent {
  const factory _UpdateMessages(
          {required final NotificationPaginationState notificationPgState}) =
      _$UpdateMessagesImpl;

  NotificationPaginationState get notificationPgState;

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateMessagesImplCopyWith<_$UpdateMessagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateUnreadMessageCountImplCopyWith<$Res> {
  factory _$$UpdateUnreadMessageCountImplCopyWith(
          _$UpdateUnreadMessageCountImpl value,
          $Res Function(_$UpdateUnreadMessageCountImpl) then) =
      __$$UpdateUnreadMessageCountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int unreadMessageCount});
}

/// @nodoc
class __$$UpdateUnreadMessageCountImplCopyWithImpl<$Res>
    extends _$NotificationPageEventCopyWithImpl<$Res,
        _$UpdateUnreadMessageCountImpl>
    implements _$$UpdateUnreadMessageCountImplCopyWith<$Res> {
  __$$UpdateUnreadMessageCountImplCopyWithImpl(
      _$UpdateUnreadMessageCountImpl _value,
      $Res Function(_$UpdateUnreadMessageCountImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unreadMessageCount = null,
  }) {
    return _then(_$UpdateUnreadMessageCountImpl(
      unreadMessageCount: null == unreadMessageCount
          ? _value.unreadMessageCount
          : unreadMessageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateUnreadMessageCountImpl implements _UpdateUnreadMessageCount {
  const _$UpdateUnreadMessageCountImpl({required this.unreadMessageCount});

  @override
  final int unreadMessageCount;

  @override
  String toString() {
    return 'NotificationPageEvent.updateUnreadMessageCount(unreadMessageCount: $unreadMessageCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUnreadMessageCountImpl &&
            (identical(other.unreadMessageCount, unreadMessageCount) ||
                other.unreadMessageCount == unreadMessageCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unreadMessageCount);

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUnreadMessageCountImplCopyWith<_$UpdateUnreadMessageCountImpl>
      get copyWith => __$$UpdateUnreadMessageCountImplCopyWithImpl<
          _$UpdateUnreadMessageCountImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadNotifications,
    required TResult Function() loadUnreadMessagesCount,
    required TResult Function() markAsReadMessages,
    required TResult Function(NotificationPaginationState notificationPgState)
        updateMessages,
    required TResult Function(int unreadMessageCount) updateUnreadMessageCount,
  }) {
    return updateUnreadMessageCount(unreadMessageCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadNotifications,
    TResult? Function()? loadUnreadMessagesCount,
    TResult? Function()? markAsReadMessages,
    TResult? Function(NotificationPaginationState notificationPgState)?
        updateMessages,
    TResult? Function(int unreadMessageCount)? updateUnreadMessageCount,
  }) {
    return updateUnreadMessageCount?.call(unreadMessageCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadNotifications,
    TResult Function()? loadUnreadMessagesCount,
    TResult Function()? markAsReadMessages,
    TResult Function(NotificationPaginationState notificationPgState)?
        updateMessages,
    TResult Function(int unreadMessageCount)? updateUnreadMessageCount,
    required TResult orElse(),
  }) {
    if (updateUnreadMessageCount != null) {
      return updateUnreadMessageCount(unreadMessageCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotifications value) loadNotifications,
    required TResult Function(_LoadUnreadMessagesCount value)
        loadUnreadMessagesCount,
    required TResult Function(_MarkAsReadMessages value) markAsReadMessages,
    required TResult Function(_UpdateMessages value) updateMessages,
    required TResult Function(_UpdateUnreadMessageCount value)
        updateUnreadMessageCount,
  }) {
    return updateUnreadMessageCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotifications value)? loadNotifications,
    TResult? Function(_LoadUnreadMessagesCount value)? loadUnreadMessagesCount,
    TResult? Function(_MarkAsReadMessages value)? markAsReadMessages,
    TResult? Function(_UpdateMessages value)? updateMessages,
    TResult? Function(_UpdateUnreadMessageCount value)?
        updateUnreadMessageCount,
  }) {
    return updateUnreadMessageCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotifications value)? loadNotifications,
    TResult Function(_LoadUnreadMessagesCount value)? loadUnreadMessagesCount,
    TResult Function(_MarkAsReadMessages value)? markAsReadMessages,
    TResult Function(_UpdateMessages value)? updateMessages,
    TResult Function(_UpdateUnreadMessageCount value)? updateUnreadMessageCount,
    required TResult orElse(),
  }) {
    if (updateUnreadMessageCount != null) {
      return updateUnreadMessageCount(this);
    }
    return orElse();
  }
}

abstract class _UpdateUnreadMessageCount implements NotificationPageEvent {
  const factory _UpdateUnreadMessageCount(
      {required final int unreadMessageCount}) = _$UpdateUnreadMessageCountImpl;

  int get unreadMessageCount;

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUnreadMessageCountImplCopyWith<_$UpdateUnreadMessageCountImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotificationPageState {
  NotificationPageStatus get status => throw _privateConstructorUsedError;
  NotificationPaginationState get paginationState =>
      throw _privateConstructorUsedError;
  int get unreadMessagesCount => throw _privateConstructorUsedError;
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
      int unreadMessagesCount,
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
    Object? unreadMessagesCount = null,
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
      unreadMessagesCount: null == unreadMessagesCount
          ? _value.unreadMessagesCount
          : unreadMessagesCount // ignore: cast_nullable_to_non_nullable
              as int,
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
      int unreadMessagesCount,
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
    Object? unreadMessagesCount = null,
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
      unreadMessagesCount: null == unreadMessagesCount
          ? _value.unreadMessagesCount
          : unreadMessagesCount // ignore: cast_nullable_to_non_nullable
              as int,
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
      this.unreadMessagesCount = 0,
      this.errorMessage = ''});

  @override
  @JsonKey()
  final NotificationPageStatus status;
  @override
  @JsonKey()
  final NotificationPaginationState paginationState;
  @override
  @JsonKey()
  final int unreadMessagesCount;
  @override
  @JsonKey()
  final dynamic errorMessage;

  @override
  String toString() {
    return 'NotificationPageState(status: $status, paginationState: $paginationState, unreadMessagesCount: $unreadMessagesCount, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationPageStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paginationState, paginationState) ||
                other.paginationState == paginationState) &&
            (identical(other.unreadMessagesCount, unreadMessagesCount) ||
                other.unreadMessagesCount == unreadMessagesCount) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, paginationState,
      unreadMessagesCount, const DeepCollectionEquality().hash(errorMessage));

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
      final int unreadMessagesCount,
      final dynamic errorMessage}) = _$NotificationPageStateImpl;

  @override
  NotificationPageStatus get status;
  @override
  NotificationPaginationState get paginationState;
  @override
  int get unreadMessagesCount;
  @override
  dynamic get errorMessage;

  /// Create a copy of NotificationPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationPageStateImplCopyWith<_$NotificationPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
