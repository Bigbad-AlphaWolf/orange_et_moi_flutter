import 'dart:io' show HttpClient, X509Certificate;

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:orange_et_moi/services/interceptor/auth_interceptor.dart';

class OemHttpClient {
  OemHttpClient() {
    request.interceptors.add(AuthInterceptor());
    (request.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
  }
  final request = Dio();
}
