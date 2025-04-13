import 'dart:convert';

import 'package:dio/dio.dart';

import '../../utils/client/dio_client.dart';

class NotificationApi {
  final Dio _dio;

  static instance([Dio? dio]) => NotificationApi._(dio);

  NotificationApi._([Dio? dio]) : _dio = dio ?? DioClient.instance.dio;

  Future<Map<String, dynamic>> fetchNotificationChannelConfig() async {
    final res = await _dio.get(
      '/Notification/config',
    );
    return jsonDecode(
      res.data,
    );
  }
  Future<void> registerUserToken(String token) async {
    /// Todo: Implement It later
  }
}
