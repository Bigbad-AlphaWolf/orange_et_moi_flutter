import 'dart:convert';

import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // create a list of the endpoints where you don't need to pass a token.
    final listOfPaths = <String>[
      '/send-otp',
      '/validate-otp',
    ];

    // Check if the requested endpoint match in the
    if (listOfPaths.contains(options.path.toString())) {
      // if the endpoint is matched then skip adding the token.
      return handler.next(options);
    }

    // Load your token here and pass to the header
    var token = '';
    options.headers.addAll({
      // 'Authorization': token,
      'uuid': "f7006881-4229-4613-9e14-8744bdaacc42",
      'X-Selfcare-Uuid': "f7006881-4229-4613-9e14-8744bdaacc42",
      "content-type": "application/json"
    });
    return handler.next(options);
  }

  // You can also perform some actions in the response or onError.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}
