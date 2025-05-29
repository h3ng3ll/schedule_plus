part of 'notification_page_bloc.dart';

@freezed
class NotificationPageEvent with _$NotificationPageEvent {
  const factory NotificationPageEvent.loadNotifications() = _LoadNotifications;

  const factory NotificationPageEvent.loadUnreadMessagesCount() =
      _LoadUnreadMessagesCount;

  const factory NotificationPageEvent.markAsReadMessages() =
      _MarkAsReadMessages;

  const factory NotificationPageEvent.updateMessages({
    required NotificationPaginationState notificationPgState,
  }) = _UpdateMessages;

  const factory NotificationPageEvent.updateUnreadMessageCount({
    required int unreadMessageCount,
  }) = _UpdateUnreadMessageCount;
}
