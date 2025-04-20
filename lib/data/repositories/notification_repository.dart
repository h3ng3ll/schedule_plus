import '../../model/android_notification_channel_dto/android_notification_channel_dto.dart';
import '../api/notification_api.dart';
import '../local/auth_local.dart';

class NotificationRepository {
  final NotificationApi _notificationApi = NotificationApi.instance();
  static final NotificationRepository instance = NotificationRepository._();

  NotificationRepository._();

  final AuthLocal authLocal = AuthLocal.instance;

  Future<List<AndroidNotificationChannelDTO>>
      fetchNotificationChannelConfig() async {
    final String? token = await authLocal.getToken();
    if (token == null) return [];

    final notificationChannels =
        await _notificationApi.fetchNotificationChannelConfig(
      token,
    );

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

  Future<void> registerUserToken(String fcmToken) async {
    final String? token = await authLocal.getToken();
    if (token == null) return;
    await _notificationApi.registerUserToken(
      fcmToken,
      token,
    );
  }
}
