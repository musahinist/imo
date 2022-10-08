import 'dart:io';

class ApiConfig {
  static String get baseUrl => Platform.isWindows
      ? "http://[::1]:3000//api"
      : "http://10.0.2.2:3000/api";
//  static const String baseUrl = 'https://api.shrtco.de/v2';
}
