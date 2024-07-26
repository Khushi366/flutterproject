import 'package:dio/dio.dart';

class ApiHandler {
  final Dio _dio = Dio();

  // Singleton pattern to ensure a single instance of ApiHandler
  // static final ApiHandler _instance = ApiHandler._internal();
  // factory ApiHandler() {
  //   return _instance;
  // }
 // ApiHandler._internal();
  // ApiHandler._internal() {
  //   // You can set up default configurations here
  //   _dio.options.baseUrl = 'https://dummyjson.com';
  //   _dio.options.connectTimeout = Duration(seconds: 5); // 5 seconds
  //   _dio.options.receiveTimeout = Duration(seconds: 3); // 3 seconds
  // }

  // GET request
  Future<Response> getRequest(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // POST request
  Future<Response> postRequest(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // Handle Dio errors
  Response _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionError:
        return Response(
          requestOptions: error.requestOptions,
          statusMessage: 'Connection Error',
        );
      case DioExceptionType.connectionTimeout:
      // Handle connection timeout
        return Response(
          requestOptions: error.requestOptions,
          statusMessage: 'Connection Timeout',
        );
      case DioExceptionType.sendTimeout:
      // Handle send timeout
        return Response(
          requestOptions: error.requestOptions,
          statusMessage: 'Send Timeout',
        );
      case DioExceptionType.receiveTimeout:
      // Handle receive timeout
        return Response(
          requestOptions: error.requestOptions,
          statusMessage: 'Receive Timeout',
        );
      case DioExceptionType.badResponse:
      // Handle received invalid status code
        return error.response!;
      case DioExceptionType.cancel:
      // Handle request cancellation
        return Response(
          requestOptions: error.requestOptions,
          statusMessage: 'Request Cancelled',
        );
      case DioExceptionType.unknown:
      // Handle other errors
        return Response(
          requestOptions: error.requestOptions,
          statusMessage: 'Something went wrong',
        );
      default:
        return Response(
          requestOptions: error.requestOptions,
          statusMessage: 'Unknown error occurred',
        );
    }
  }
}
