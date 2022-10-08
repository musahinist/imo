import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioLogger {
  DioLogger._();

  static final DioLogger _instance = DioLogger._();
  factory DioLogger() {
    return _instance;
  }
  final Logger _logger = Logger(
    filter: DevelopmentFilter(),
    printer: PrettyPrinter(
        lineLength: 80,
        methodCount: 0,
        colors: true, // Colorful log messages
        printEmojis: false, // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        ),
  );
  void onSend(RequestOptions options) {
    _logger.v(
      '''
🔄  Req Path: ${options.path.toUpperCase()} [${options.method}]-> ${options.baseUrl}${options.path}
🔄  Req Token: ${options.headers['Authorization']}
🔄  Req QueryParams: ${options.queryParameters}  
🔄  Req Data: ${options.data}
      ''',
    );
  }

  void onSuccess(Response<dynamic> response) {
    _logger.i(
      '''
🟢↩ Res Data: 🧶 ${response.data} 🧶
🟢↩ Res Path: ${response.requestOptions.path.toUpperCase()} [${response.requestOptions.method}]<- ${response.requestOptions.baseUrl}${response.requestOptions.path} 
🟢↩ Res StatusCode: ${response.statusCode} 
🟢↩ Res StatusMessage: ${response.statusMessage}⚡✨✨
      ''',
    );
  }

  void onError(DioError error) {
    _logger.e(
      '''
🔴 Err Path: ${error.response!.requestOptions.path.toUpperCase()} [${error.response!.requestOptions.method}]<- ${error.response!.requestOptions.baseUrl}${error.response!.requestOptions.path}
🔴 Err Type : ${error.type} 
🔴 Err StatusCode: ${error.response!.statusCode} 
🔴 Err StatusMessage : ${error.response!.statusMessage} 
🔴 Err ResponseData: ${error.response!.data}
      ''',
    );
  }
}
