import 'package:dio/dio.dart';

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
          errorDescription = error.message;
          break;
        case DioErrorType.sendTimeout:
          errorDescription = error.message;
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = error.message;
          break;
        case DioErrorType.response:
          errorDescription = error.message;
          break;
        case DioErrorType.cancel:
          errorDescription = error.message;
          break;
        case DioErrorType.other:
          errorDescription = error.message;

          break;
      }
    } else if (error is TypeError) {
      errorDescription = error.toString();
    } else {
      errorDescription = error.response;
    }
    return errorDescription;
  }
}
