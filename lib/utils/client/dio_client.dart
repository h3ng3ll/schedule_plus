import 'package:dio/dio.dart';

import '../config/app_config.dart';

class DioClient {
  late final Dio dio;
  static final instance = DioClient._();

  DioClient._() {
    createDio();
  }

  void createDio() {
    dio = Dio();

    dio.options.baseUrl = AppConfig.devBaseUrl;

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }
}
