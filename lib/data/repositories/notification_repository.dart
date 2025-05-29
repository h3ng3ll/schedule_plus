import 'package:dio/dio.dart';

import '../../model/android_notification_channel_dto/android_notification_channel_dto.dart';
import '../../model/notification/notification.dart';
import '../../model/notification_pagination_state/notification_pagination_state.dart';
import '../api/notification_api.dart';

class NotificationRepository {
  final NotificationApi _notificationApi = NotificationApi.instance();
  static final NotificationRepository instance = NotificationRepository._();

  NotificationRepository._();

  Future<List<AndroidNotificationChannelDTO>>
      fetchNotificationChannelConfig() async {
    try {
      final notificationChannels =
          await _notificationApi.fetchNotificationChannelConfig();

      final List<AndroidNotificationChannelDTO> androidNotificationChannels =
          (notificationChannels['android'] as List<dynamic>)
              .map(
                (e) => AndroidNotificationChannelDTO.fromJson(
                  e,
                ),
              )
              .toList();

      return androidNotificationChannels;
    } on DioException {
      rethrow;
    }
  }

  Future<void> registerUserToken(String fcmToken) async {
    try {
      await _notificationApi.registerUserToken(
        fcmToken,
      );
    } on DioException {
      rethrow;
    }
  }

  Future<NotificationPaginationState> fetchNotifications(
    NotificationPaginationState state,
  ) async {
    try {
      final res = await _notificationApi.fetchNotifications(
        state.limit,
        state.page,
      );
      final notifications = List<Notification>.from(
        (res.data['notifications'] as List<dynamic>).map(
          (e) => Notification.fromJson(e),
        ),
      );
      return state.copyWith(
        notifications: notifications,
        total: res.data['total'],
        page: res.data['page'],
      );
    } on DioException {
      rethrow;
    }
  }

  Future<void> markAsReadMessages(
    List<int> notificationIds,
  ) async {
    try {
      await _notificationApi.markAsReadMessages(
        notificationIds,
      );
    } on DioException {
      rethrow;
    }
  }

  Future<int> unReadMessagesCount() async {
    try {
      final res = await _notificationApi.unReadMessagesCount();
      return res.data;
    } on DioException {
      rethrow;
    }
  }

  Future<Notification> getLastNotification() async {
    try {
      final res = await _notificationApi.lastNotification();
      final notification = Notification.fromJson(
        res.data,
      );

      return notification;
    } on DioException {
      rethrow;
    }
  }
}
