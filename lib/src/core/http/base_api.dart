import 'package:dio/dio.dart';

import 'dio_client.dart';
import 'http_exception.dart';

class BaseApi {
  final String? path;
  final String? baseUrl;
  final Dio _client;

  BaseApi({
    this.path = '',
    this.baseUrl,
  }) : _client = DioClient(baseUrl: baseUrl).client;

  Future<Response> get({
    String innerPath = '',
    CancelToken? cancelToken,
    Map<String, dynamic> queryParams = const <String, dynamic>{},
  }) async {
    try {
      final Response response = await _client.get(
        '/$path/$innerPath',
        queryParameters: queryParams,
        cancelToken: cancelToken,
      );
      throwIfNoSuccess(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> post({
    String innerPath = '',
    CancelToken? cancelToken,
    required dynamic data,
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Options? options,
  }) async {
    assert(data != null);
    try {
      final Response<dynamic> response = await _client.post(
        '/$path/$innerPath',
        queryParameters: queryParameters,
        data: data,
        options: options,
        cancelToken: cancelToken,
      );
      throwIfNoSuccess(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> put({
    required dynamic data,
    String innerPath = '',
    CancelToken? cancelToken,
    Map<String, String> queryParameters = const <String, String>{},
  }) async {
    try {
      final Response<dynamic> response = await _client.put(
        '/$path/$innerPath',
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      throwIfNoSuccess(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> patch({
    required dynamic data,
    String innerPath = '',
    CancelToken? cancelToken,
    Map<String, String> queryParameters = const <String, String>{},
  }) async {
    try {
      final Response<dynamic> response = await _client.patch(
        '/$path/$innerPath',
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      throwIfNoSuccess(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> delete({
    String innerPath = '',
    CancelToken? cancelToken,
    Map<String, String> queryParameters = const <String, String>{},
  }) async {
    try {
      final Response<dynamic> response = await _client.delete(
        '/$path/$innerPath',
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      throwIfNoSuccess(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  void throwIfNoSuccess(Response<dynamic> response) {
    if (response.statusCode! < 200 || response.statusCode! > 299) {
      throw DataException(response.data['message']);
    }
  }
}

//  _client ??= Dio(
//       BaseOptions(
//         connectTimeout: 30000, // 30 seconds
//         receiveTimeout: 30000, // 30 seconds
//         responseType: ResponseType.json,
//         baseUrl: baseUrl ?? ApiConfig.baseUrl,
//         headers: <String, dynamic>{
//           HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
//           HttpHeaders.acceptHeader: 'application/json; charset=UTF-8',
//           'Authorization': 'Bearer $token',
//           'Accept-Language': lang ?? 'tr',
//         },
//       ),
//     )..interceptors.add(
//         InterceptorsWrapper(
//           onRequest: (RequestOptions options, handler) {
//             // options.headers['Authorization'] = 'Bearer $token';
//             // options.headers['Language'] = lang;
//             DioLogger().onSend(options);
//             return handler.next(options);
//           },
//           onResponse: (Response<dynamic> response, handler) {
//             DioLogger().onSuccess(response);
//             return handler.next(response);
//           },
//           onError: (DioError error, handler) {
//             DioLogger().onError(error);
//             return handler.next(error);
//           },
//         ),
//       );