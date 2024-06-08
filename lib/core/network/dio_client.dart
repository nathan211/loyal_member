import 'package:dio/dio.dart';

class DioClient {
  // Private constructor
  DioClient._internal() {
    _dio = Dio()
      ..options.baseUrl = 'https://jsonplaceholder.typicode.com/'
      ..options.connectTimeout = const Duration(seconds: 60)
      ..options.receiveTimeout = const Duration(seconds: 60)
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  // The single instance
  static final DioClient _instance = DioClient._internal();

  // Factory constructor
  factory DioClient() => _instance;

  late final Dio _dio;

  Dio get client => _dio;
}