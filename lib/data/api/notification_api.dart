import 'dart:convert';

import 'package:dio/dio.dart';

import '../repositories/base_repository.dart';

class NotificationApi {
  final BaseRepository _baseRepository = BaseRepository.instance;

  static instance() => NotificationApi._();

  NotificationApi._();

  Future<Map<String, dynamic>> fetchNotificationChannelConfig() async {
    try {
      final res = await _baseRepository.api.get(
        '/Notification/config',
      );
      return jsonDecode(
        res.data,
      );
    } on DioException {
      rethrow;
    }
  }

  Future<void> registerUserToken(String fcmToken) async {
    try {
      await _baseRepository.api.post(
        '/Notification/saveToken',
        data: {
          'token': fcmToken,
        },
      );
    } on DioException {
      rethrow;
    }
  }

  Future<Response> fetchNotifications([
    int? limit,
    int? page,
  ]) async {
    return await _baseRepository.api.get(
      '/Notification/',
      data: {
        'limit': limit,
        'page': page,
      },
    );
  }

  Future<Response> markAsReadMessages(
    List<int> notificationIds,
  ) async {
    return await _baseRepository.api.post(
      '/Notification/markReadMessages',
      data: {
        'notificationIds': notificationIds,
      },
    );
  }

  Future<Response> unReadMessagesCount() async {
    return await _baseRepository.api.get(
      '/Notification/unReadMessagesCounts',
    );
  }

  Future<Response> lastNotification() async {
    return await _baseRepository.api.get(
      '/Notification/lastNotification',
    );
  }
}
