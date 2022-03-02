import 'package:dio/dio.dart';
import 'package:imo/src/core/http/http_client.dart';

import 'http_exception.dart';

abstract class BaseApi {
  BaseApi({
    this.path = '',
    this.baseUrl,
  }) : _client = Client(
          tag: path.toUpperCase(),
          baseUrl: baseUrl,
        ).client;
  final String path;
  final String? baseUrl;
  late final Dio _client;

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
      throw DataException(response);
    }
  }
}
