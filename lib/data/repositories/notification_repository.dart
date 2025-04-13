import '../../model/android_notification_channel_dto/android_notification_channel_dto.dart';
import '../api/notification_api.dart';

class NotificationRepository {
  final NotificationApi _notificationApi = NotificationApi.instance();
  static final NotificationRepository instance = NotificationRepository._();

  NotificationRepository._();

  Future<List<AndroidNotificationChannelDTO>>
      fetchNotificationChannelConfig() async {
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
  }
}
