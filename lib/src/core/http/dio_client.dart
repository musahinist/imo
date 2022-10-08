import 'dart:io';

import 'package:dio/dio.dart';

import '../constant/api_config.dart';
import 'dio_logger.dart';

class DioClient {
  static String? lang;
  static String? token;
  String? baseUrl;
  late final Dio _dio;
  DioClient._() {
    _dio = Dio(
      BaseOptions(
        responseType: ResponseType.json,
        baseUrl: baseUrl ?? ApiConfig.baseUrl,
        connectTimeout: 5000,
        // receiveTimeout: 5000,
        // validateStatus: (status) {
        //   return status! >= 200 && status < 300;
        // },
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
      ),
    );

    // _dio.interceptors.add(RetryInterceptor());
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) {
          if (token != null) options.headers['Authorization'] = 'Bearer $token';
          if (lang != null) options.headers['Language'] = lang;
          DioLogger().onSend(options);
          return handler.next(options);
        },
        onResponse: (Response<dynamic> response, handler) {
          DioLogger().onSuccess(response);
          return handler.next(response);
        },
        onError: (DioError error, handler) {
          DioLogger().onError(error);
          //       print(error.response);
          // if (error.response?.statusCode == 403 ||
          //  error.response?.statusCode == 401) {
          // await refreshToken(jwt);
          // return _retry(error.request, dio);
          //  }
          return handler.next(error);
        },
      ),
    );
  }

  static DioClient get _instance => DioClient._();

  Dio get client => _dio;

  factory DioClient({baseUrl}) {
    _instance.baseUrl = baseUrl;
    return _instance;
  }
}
