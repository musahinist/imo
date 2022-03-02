import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

final Logger logger = Logger(
  filter: DevelopmentFilter(),
  printer: PrettyPrinter(
      methodCount: 0, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: false, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
      ),
);

class DioLogger {
  static void onSend(String tag, RequestOptions options) {
    logger.d(
      '''
🔄  Req Path: $tag - [${options.method}] ${options.baseUrl}${options.path}
🔄  Req Header: ${options.headers}
🔄  Req QueryParams: ${options.queryParameters}  
🔄  Req Data: ${options.data}''',
    );
  }

  static void onSuccess(String tag, Response<dynamic> response) {
    logger.i(
      '''
🐢↩ Res Data: 🧶''',
    );
    logger.i(response.data);
    logger.i(
      '''
🐢↩ Res Path: $tag - [${response.requestOptions.method}] ${response.requestOptions.baseUrl}${response.requestOptions.path} 
🐢↩ Res StatusCode: ${response.statusCode}🟢 ⚡✨✨✨''',
    );
  }

  static void onError(String tag, DioError error) {
    logger.e(
      '''
🔴 Err Path: $tag -  [${error.response!.requestOptions.method}] ${error.response!.requestOptions.baseUrl}${error.response!.requestOptions.path}
🔴 Err StatusCode: ${error.response!.statusCode} 🔴
🔴 Error Message : ${error.message}''',
    );
//     if (null != error.response) {
//       logger.e('''
// $tag - Error Path : [${error.response!.requestOptions.method}] ${error.response!.requestOptions.baseUrl}${error.response!.requestOptions.path} Request Data : ${error.response!.requestOptions.data.toString()}''');
//       logger.e('$tag - Error statusCode : ${error.response!.statusCode}');
//       logger.e('''
// $tag - Error data : ${null != error.response!.data ? error.response!.data.toString() : ''}''');
//     }
//     logger.e('$tag - Error Message : ${error.message}');
  }
}
