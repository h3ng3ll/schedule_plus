import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import '../../firebase_options.dart';
import '../notification_service/notification_service.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if(kDebugMode) {
    debugPrint("Handling a background message: ${message.messageId}");
  }

}

Future<void> backgroundHandler(RemoteMessage message) async {}

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final NotificationService _notificationService = NotificationService.instance;

  static final instance = FirebaseMessagingService._();

  FirebaseMessagingService._();

  Future<void> init() async {
    await _firebaseMessaging.requestPermission();
    final String? token = await _firebaseMessaging.getToken();
    if (kDebugMode) {
      print(token);
    }
    _firebaseMessaging.requestPermission();
    FirebaseMessaging.onMessage.listen(
      onMessage,
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
      onMessageOpenedApp,
    );
    FirebaseMessaging.onBackgroundMessage(
      _firebaseMessagingBackgroundHandler,
    );
  }

  void onMessage(RemoteMessage message) {
    print("Message data: ${message.data}");
    if (message.notification != null) {
      print("Message also contain  a notification ${message.notification}");
      _notificationService.showNotifications(
        message.notification?.android?.channelId ?? "id",
        message.notification?.android?.imageUrl ?? "name",
        message.notification?.title ?? 'title',
        message.notification?.body ?? 'body',
      );
    }
  }

  void onMessageOpenedApp(RemoteMessage message) {
    print('message clicked! ${message.messageId}');
  }
}
