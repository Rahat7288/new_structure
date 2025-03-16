import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:new_structure/core/services/network_services/app_urls.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../local_data_services/session_manager.dart';

class ApiClient {
  static const bool isDebug = true;
  static final ApiClient _singleton = ApiClient._internal();

  Dio dio = Dio(
    BaseOptions(
      baseUrl: AppUrls.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  bool _isRefreshing = false; // Lock for refresh token
  final List<Function> _retryQueue = []; // Queue for pending requests

  ApiClient._internal() {
    initApiClient();
  }

  factory ApiClient() => _singleton;

  static ApiClient get shared => _singleton;

  /// Refresh the access token
  Future<bool> refreshToken() async {
    final token = await SessionManager.getAccessToken();
    final refreshToken = await SessionManager.getRefreshToken();
    final response = await dio.post(
      AppUrls.getRefreshTokenPath(),
      data: {
        'token': token,
        'refreshToken': refreshToken,
      },
    );

    if (response.statusCode == 200) {
      // Successfully refreshed the token
      print("Refresh Token Res ${response.data['token']}");
      await SessionManager.setToken(
          response.data['token'], response.data['refreshToken']);
      return true;
    } else {
      // Handle token refresh failure
      _retryQueue.clear();
      await SessionManager.removeAll();
      // Get.offAll(LoginScreen());
      throw Exception('Failed to refresh token');
    }
  }

  /// Initialize Dio interceptors
  void initApiClient() async {
    if (isDebug) {
      dio.interceptors.add(PrettyDioLogger(
        request: isDebug,
        requestHeader: isDebug,
        requestBody: isDebug,
        responseBody: isDebug,
        responseHeader: isDebug,
        error: isDebug,
        compact: isDebug,
      ));
    }
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String token = await SessionManager.getAccessToken();
          if (token.isNotEmpty) {
            options.headers.putIfAbsent('Authorization', () => 'Bearer $token');
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            // Token expired, refresh it
            return _handle401Error(error, handler);
          }
        },
      ),
    );
  }

  /// Handle 401 errors and queue failed requests
  Future<void> _handle401Error(
      DioException error, ErrorInterceptorHandler handler) async {
    final requestOptions = error.response?.requestOptions;

    if (!_isRefreshing) {
      // If no refresh is currently happening, start the refresh process
      _isRefreshing = true;

      try {
        print("Call from here 1");
        await refreshToken(); // Refresh the token
        _isRefreshing = false;

        // Retry the failed requests in the queue
        for (var retryRequest in _retryQueue) {
          retryRequest(); // Execute the queued request
        }
        _retryQueue.clear(); // Clear the queue after retrying
      } catch (e) {
        _isRefreshing = false;
        _retryQueue.clear();
        await SessionManager.removeAll();
        // Get.offAll(() => LoginScreen());
        // Refresh failed, redirect to login or show error
        return handler.reject(error);
      }
    }

    // Add the current request to the queue to be retried later
    final retryFunction = () {
      dio
          .request(
        requestOptions?.path ?? "",
        options: Options(
          method: requestOptions?.method,
          // headers: requestOptions?.headers,
        ),
        data: requestOptions?.data,
        queryParameters: requestOptions?.queryParameters,
      )
          .then(
            (response) => handler.resolve(response),
      )
          .catchError(
            (e) => handler.reject(e),
      );
    };

    _retryQueue.add(retryFunction);
  }

  static Dio createSimpleDio() {
    Dio dio = Dio();
    return dio;
  }

  _parseAndDecode(String response) {
    return jsonDecode(response);
  }

  parseJson(String text) {
    return compute(_parseAndDecode, text);
  }

  ///Network calling hellper methods===
  ///
  ///GET
  Future<dynamic> get(String url,
      {Map<String, dynamic>? params, context}) async {
    try {
      final response = await dio.get(url, queryParameters: params);
      return response.data;
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  ///POST
  ///
  Future<dynamic> post(String url, {dynamic data, context, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.post(url, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  ///PUT
  ///
  Future<dynamic> put(String url, {Map<String, dynamic>? data, context}) async {
    try {
      final response = await dio.put(url, data: data);
      return response.data;
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  ///DELETE
  ///
  Future<dynamic> delete(String url,
      {Map<String, dynamic>? data, context, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.delete(url, data: data,queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  dynamic _handleError(dynamic error) {
    if (error is DioException) {
      return {
        'statusCode': error.response?.statusCode ?? 500,
        'message': error.response?.statusMessage ?? 'An error occurred',
        'data': error.response?.data,
      };
    }
    return {'statusCode': 500, 'message': 'Unexpected error occurred'};
  }
}