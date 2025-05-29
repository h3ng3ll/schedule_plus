import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../data/repositories/notification_repository.dart';
import '../../model/notification/notification.dart';
import '../../model/notification_pagination_state/notification_pagination_state.dart';
import '../firebase/firebase_messaging_service.dart';

class NotificationService {
  final NotificationRepository _notificationRepository =
      NotificationRepository.instance;

  final FirebaseMessagingService _firebaseMessagingService =
      FirebaseMessagingService.instance;

  NotificationPaginationState _notificationPaginationState =
      NotificationPaginationState();

  int _unreadMessagesCount = 0;

  late final StreamController<NotificationPaginationState>
      _notificationsController = StreamController();

  late final Stream<NotificationPaginationState> notificationsStream =
      _notificationsController.stream.asBroadcastStream();

  late final StreamSink<NotificationPaginationState> _notificationSink =
      _notificationsController.sink;

  late final StreamController<int> _unreadMessagesCountController =
      StreamController();

  late final Stream<int> unreadMessagesCountStream =
      _unreadMessagesCountController.stream.asBroadcastStream();

  late final StreamSink<int> _unreadMessagesCountSink =
      _unreadMessagesCountController.sink;

  static final instance = NotificationService._();

  NotificationService._(){
    initFCMListener();
  }

  void initFCMListener() {
    _firebaseMessagingService.remoteMessageStream.listen(
      (message) async {
        final Notification newNotification =
            await _notificationRepository.getLastNotification();

        _notificationPaginationState = _notificationPaginationState.copyWith(
          total: _notificationPaginationState.total + 1,
          notifications: [
            ..._notificationPaginationState.notifications,
            newNotification,
          ],
        );
        _unreadMessagesCount += 1;

        _notificationSink.add(
          _notificationPaginationState,
        );

        _unreadMessagesCountSink.add(
          _unreadMessagesCount,
        );
      },
    );
  }

  Future<void> fetchNotifications() async {
    if (_notificationPaginationState.page >=
        _notificationPaginationState.total) {
      return;
    }

    final newState = await _notificationRepository.fetchNotifications(
      _notificationPaginationState.copyWith(
        page: _notificationPaginationState.page + 1,
      ),
    );
    _notificationSink.add(
      newState,
    );
  }

  Future<void> markAsReadMessages(List<int> notificationIds) async {
    await _notificationRepository.markAsReadMessages(
      notificationIds,
    );
    _unreadMessagesCount -= notificationIds.length;

    _unreadMessagesCountSink.add(
      _unreadMessagesCount,
    );
  }

  Future<void> loadUnreadMessagesCount() async {
    final count = await _notificationRepository.unReadMessagesCount();
    _unreadMessagesCount = count;

    _unreadMessagesCountSink.add(
      _unreadMessagesCount,
    );
  }

  Future<void> saveToken() async {
    final String? token = _firebaseMessagingService.deviceToken;
    if (kDebugMode) {
      print(token);
    }
    if (token != null) {
      await _notificationRepository.registerUserToken(
        token,
      );
    }
  }
}
