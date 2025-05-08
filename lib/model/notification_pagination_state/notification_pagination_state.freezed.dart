// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_pagination_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationPaginationState {
  int get limit => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  List<Notification> get notifications => throw _privateConstructorUsedError;

  /// Create a copy of NotificationPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationPaginationStateCopyWith<NotificationPaginationState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPaginationStateCopyWith<$Res> {
  factory $NotificationPaginationStateCopyWith(
          NotificationPaginationState value,
          $Res Function(NotificationPaginationState) then) =
      _$NotificationPaginationStateCopyWithImpl<$Res,
          NotificationPaginationState>;
  @useResult
  $Res call({int limit, int page, int total, List<Notification> notifications});
}

/// @nodoc
class _$NotificationPaginationStateCopyWithImpl<$Res,
        $Val extends NotificationPaginationState>
    implements $NotificationPaginationStateCopyWith<$Res> {
  _$NotificationPaginationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? page = null,
    Object? total = null,
    Object? notifications = null,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationPaginationStateImplCopyWith<$Res>
    implements $NotificationPaginationStateCopyWith<$Res> {
  factory _$$NotificationPaginationStateImplCopyWith(
          _$NotificationPaginationStateImpl value,
          $Res Function(_$NotificationPaginationStateImpl) then) =
      __$$NotificationPaginationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, int page, int total, List<Notification> notifications});
}

/// @nodoc
class __$$NotificationPaginationStateImplCopyWithImpl<$Res>
    extends _$NotificationPaginationStateCopyWithImpl<$Res,
        _$NotificationPaginationStateImpl>
    implements _$$NotificationPaginationStateImplCopyWith<$Res> {
  __$$NotificationPaginationStateImplCopyWithImpl(
      _$NotificationPaginationStateImpl _value,
      $Res Function(_$NotificationPaginationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? page = null,
    Object? total = null,
    Object? notifications = null,
  }) {
    return _then(_$NotificationPaginationStateImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>,
    ));
  }
}

/// @nodoc

class _$NotificationPaginationStateImpl
    implements _NotificationPaginationState {
  const _$NotificationPaginationStateImpl(
      {this.limit = 8,
      this.page = 0,
      this.total = 1,
      final List<Notification> notifications = const []})
      : _notifications = notifications;

  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int total;
  final List<Notification> _notifications;
  @override
  @JsonKey()
  List<Notification> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  String toString() {
    return 'NotificationPaginationState(limit: $limit, page: $page, total: $total, notifications: $notifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationPaginationStateImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, page, total,
      const DeepCollectionEquality().hash(_notifications));

  /// Create a copy of NotificationPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationPaginationStateImplCopyWith<_$NotificationPaginationStateImpl>
      get copyWith => __$$NotificationPaginationStateImplCopyWithImpl<
          _$NotificationPaginationStateImpl>(this, _$identity);
}

abstract class _NotificationPaginationState
    implements NotificationPaginationState {
  const factory _NotificationPaginationState(
          {final int limit,
          final int page,
          final int total,
          final List<Notification> notifications}) =
      _$NotificationPaginationStateImpl;

  @override
  int get limit;
  @override
  int get page;
  @override
  int get total;
  @override
  List<Notification> get notifications;

  /// Create a copy of NotificationPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationPaginationStateImplCopyWith<_$NotificationPaginationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
