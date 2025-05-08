import 'package:freezed_annotation/freezed_annotation.dart';

import '../notification/notification.dart';

part 'notification_pagination_state.freezed.dart';


@freezed
sealed class NotificationPaginationState with _$NotificationPaginationState{
  const factory NotificationPaginationState({
    @Default(8) int limit,
    @Default(0) int page,
    @Default(1) int total,
    @Default([]) List<Notification> notifications,
  }) = _NotificationPaginationState;

}
