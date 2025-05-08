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
        data: jsonEncode(
          fcmToken,
        ),
      );
    } on DioException {
      rethrow;
    }
  }
}
