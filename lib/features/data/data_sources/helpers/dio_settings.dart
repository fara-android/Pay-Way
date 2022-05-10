import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_ui/service_locator.dart';

class DioSettings {
  DioSettings() {
    setup();
  }

  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://atlasdemo.space/paywayback/api/',
      contentType: 'application/json',
      headers: {'Accept': 'application/json'},
      connectTimeout: 20000,
      receiveTimeout: 20000,
    ),
  );

  String getToken() {
    final prefs = sl<SharedPreferences>();
    final token = prefs.getString('token');
    return token ?? '';
  }

  void setup() async {
    final interceptors = dio.interceptors;

    interceptors.clear();

    final logInterceptor = LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );

    final headerInterceptors = QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        String token = getToken();
        if (token != '') {
          options.headers["Authorization"] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioError error, handler) {
        handler.next(error);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
    );

    interceptors.addAll([
      if (kDebugMode) logInterceptor,
      headerInterceptors,
    ]);
  }
}
