import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../data/repositories/notification_repository.dart';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  print('catch notification on background $notificationResponse');
}

class NotificationService {
  final NotificationRepository notificationRepository =
      NotificationRepository.instance;

  static final instance = NotificationService._();
  late final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  NotificationService._() {
    // _init();
  }

  Future<void> init() async {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      ),
    );

    final AndroidFlutterLocalNotificationsPlugin? plugin =
        _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    await plugin?.requestExactAlarmsPermission();
    await plugin?.requestNotificationsPermission();

    /// Fetch from BackEnd available channels and register it .
    final androidChannels =
        await notificationRepository.fetchNotificationChannelConfig();

    for (var channel in androidChannels) {
      final androidChannel = AndroidNotificationChannel(
        channel.id,
        channel.name,
        importance: Importance.max,
      );
      await plugin?.createNotificationChannel(
        androidChannel,
      );
    }

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: notificationResponse,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  void notificationResponse(NotificationResponse notificationResponse) {}

  Future<void> showNotifications(
    String channelId,
    String channelName,
    String title,
    String body,
  ) async {
    final androidNotificationDetails = AndroidNotificationDetails(
      channelId,
      channelName,
      importance: Importance.max,
      ticker: 'ticker',
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
      payload: 'item x',
    );
  }
}
