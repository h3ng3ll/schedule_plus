import 'package:dio/dio.dart';

import '../../model/android_notification_channel_dto/android_notification_channel_dto.dart';
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
}
