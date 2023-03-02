import 'package:dio/dio.dart';
import 'package:orange_et_moi/model/token_response.dart';
import 'package:orange_et_moi/utils/index.dart';
import 'package:orange_et_moi/services/secure_storage/secure_storage.service.dart';

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
    final token = (await getAccessToken())?.accessToken;
    final uuid = await getUUID();
    options.headers.addAll({
      'uuid': uuid.toString(),
      'X-Selfcare-Uuid': uuid.toString(),
      "content-type": "application/json"
    });
    if (token != null) {
      options.headers['Authorization'] = "Bearer $token";
    }
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

  Future<String?> getUUID() async {
    return await SecureStorage().getValue(StorageKeys.UUID.name);
  }

  Future<TokenResponse?> getAccessToken() async {
    String? value =
        await SecureStorage().getValue(StorageKeys.TOKEN_INFOS.name);
    if (value != null) {
      return tokenResponseFromJson(value);
    } else {
      return null;
    }
  }
}
