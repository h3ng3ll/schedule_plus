import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../database/local_database/secure_storage_database.dart';
import '../../utils/extensions/response_ext.dart';

class BaseRepository {
  final SecureStorageDatabase _secureStorageDatabase =
      SecureStorageDatabase.instance;

  static final instance = BaseRepository._();

  static const String apiBaseUrl = '$baseUrl/api';
  static const String baseUrl = 'http://192.168.0.80:5243';
  // static const String baseUrl = 'https://schedule-plus.onrender.com';

  late final Dio api;

  BaseRepository._() {
    api = Dio(
      BaseOptions(
        baseUrl: apiBaseUrl,
        validateStatus: (_) => true,
        // validateStatus: (status) => status! < 500,
      ),
    );

    api.interceptors.addAll(
      [
        PrettyDioLogger(
          requestBody: true,
        ),
        InterceptorsWrapper(
          onRequest: (
            RequestOptions options,
            RequestInterceptorHandler handler,
          ) async {
            final String? token = await _secureStorageDatabase.getJwtToken();
            if (token != null) {
              if (JwtDecoder.isExpired(token)) {
                deleteToken();
              } else {
                options.headers['Authorization'] = 'Bearer $token';
              }
            }
            return handler.next(options);
          },
          onResponse: (Response response, handler) async {
            if (response.isNotFound) {
              return handler.reject(
                DioException(
                  requestOptions: response.requestOptions,
                  response: response,
                  type: DioExceptionType.badResponse,
                  error: response.data['error'],
                  // message: response.data['error']
                ),
              );
            }
            return handler.next(
              response,
            );
          },
          onError: (DioException error, handler) {
            /// 401 logout issue token
            return handler.next(error);
          },
        )
      ],
    );
  }

  Future<void> saveToken(String token) async {
    await _secureStorageDatabase.setJwtToken(
      token,
    );
  }

  Future<void> deleteToken() async {
    await _secureStorageDatabase.deleteJwtToken();
  }
}
