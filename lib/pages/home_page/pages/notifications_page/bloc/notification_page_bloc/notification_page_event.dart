part of 'notification_page_bloc.dart';

@freezed
class NotificationPageEvent with _$NotificationPageEvent {
  const factory NotificationPageEvent.loadNotifications() = _LoadNotifications;
}
