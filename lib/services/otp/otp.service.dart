import 'dart:developer';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:orange_et_moi/model/otp_generate.dart';
import 'package:orange_et_moi/model/validate_otp_oem.dart';
import 'package:orange_et_moi/pages/utils/index.dart';
import 'package:orange_et_moi/services/interceptor/auth_interceptor.dart';
import 'package:orange_et_moi/services/micro_services.dart';
import 'package:orange_et_moi/services/secure_storage/secure_storage.service.dart';

class OTPService {
  final SecureStorage storage = SecureStorage();
  OTPService() {
    client.interceptors.add(AuthInterceptor());
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
  }
  static final client = Dio();
  final urlGenerateAuthenticationOTP = Uri.parse(
      "${ApiConstants.baseUrl}/${MicroService.Otp}/api/v2/code-otp-infos/generate");
  final urlCheckAuthenticationOTP = Uri.parse(
      "${ApiConstants.baseUrl}/${MicroService.Otp}/api/code-otp-infos/check");

  Future<OtpOemGenerate> generateOTPForLogin(
      String msisdn, String captchaToken) async {
    try {
      Response<dynamic> response = await client.post(
          urlGenerateAuthenticationOTP.toString(),
          data: {"msisdn": msisdn, "token": captchaToken});
      OtpOemGenerate model = otpOemGenerateFromJsonDecoded(response.data);
      return model;
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  Future<ValidateOtpOem> validateOTPForLogin(String msisdn, String code) async {
    final String? storedUUID = await storage.getValue(StorageKeys.UUID.name);
    try {
      Response<dynamic> response = await client.post(
          urlCheckAuthenticationOTP.toString(),
          data: {"uuid": storedUUID, "msisdn": msisdn, "code": code});
      ValidateOtpOem model = validateOtpOemFromDecodedJson(response.data);
      return model;
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
