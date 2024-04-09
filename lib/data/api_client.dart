import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../utils/constants/app_constants.dart';

class ApiClient {
  ApiClient() {
    _init();
  }

  late Dio dio;

  void _init() {
    dio = Dio();

    dio.options = BaseOptions(
      queryParameters: {},
      baseUrl: AppConstants.baseUrl,
      receiveTimeout: const Duration(seconds: 2),
      headers: {
        "Authorization": "Bearer ${AppConstants.token}",
        "Content-Type": "application/Json"
      },

    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onResponse:
            (Response<dynamic> response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (
          DioException error,
          ErrorInterceptorHandler handler,
        ) {
          return handler.next(error);
        },
      ),
    );
  }
}
