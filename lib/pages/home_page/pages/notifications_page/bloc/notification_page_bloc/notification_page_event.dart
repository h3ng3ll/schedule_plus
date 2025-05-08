part of 'notification_page_bloc.dart';

@freezed
class NotificationPageEvent with _$NotificationPageEvent {
  const factory NotificationPageEvent.loadNotifications() = _LoadNotifications;

  const factory NotificationPageEvent.markAsReadMessages({
    required List<int> notificationIds,
  }) = _MarkAsReadMessages;
}
