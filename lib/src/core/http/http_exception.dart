import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../product/app.dart';

class DataException implements Exception {
  DataException(
    this.response,
  );
  dynamic response;
  @override
  String toString() {
    return 'DataException{response: $response}';
  }

  static String handleError(dynamic error) {
    String errorDescription = '';
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.cancel:
        case DioErrorType.other:
          errorDescription = error.message;
          break;
        case DioErrorType.response:
          errorDescription = error.response!.data['message'] is List
              ? (error.response!.data['message'] as List).join('\n')
              : error.response!.data['message'];
          break;
      }
    } else if (error is TypeError) {
      errorDescription = error.toString();
    } else {
      errorDescription = error.toString();
    }
    scaffoldMessengerKey.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(DataException.handleError(errorDescription)),
        ),
      );
    return errorDescription;
  }
}
