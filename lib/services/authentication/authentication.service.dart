import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:orange_et_moi/model/check_number.dart';
import 'package:orange_et_moi/model/confirm_msisdn.dart';
import 'package:orange_et_moi/model/customer_offer.dart';
import 'package:orange_et_moi/model/token_response.dart';
import 'package:orange_et_moi/services/oem_http_client.dart';
import 'package:orange_et_moi/utils/index.dart';
import 'package:orange_et_moi/utils/mehod_utils.dart';
import 'package:orange_et_moi/utils/pipes.dart';
import 'package:orange_et_moi/services/micro_services.dart';
import 'package:orange_et_moi/services/secure_storage/secure_storage.service.dart';

class AuthenticationService {
  final SecureStorage storage = SecureStorage();
  static final client = OemHttpClient();
  final urlGetMsisdn = Uri.parse(ApiConstants.OM_GET_MSISDN);
  final urlConfirmGetMsisdn = Uri.parse(ApiConstants.OM_CONFIRM_GET_MSISDN);
  final urlGetServiceToken =
      Uri.parse("${ApiConstants.baseUrl}/auth/get-service-token");
  final urlGetCustomerOfferForOther = Uri.parse(
      "${ApiConstants.baseUrl}/${MicroService.AccountManagement}/api/abonne/v2/customerOffer");
  final urlCheckNumber = Uri.parse(
      "${ApiConstants.baseUrl}/${MicroService.AccountManagement}/api/account-management/v3/check_number");
  final urlResetPwdLite = Uri.parse(
      "${ApiConstants.baseUrl}/${MicroService.AccountManagement}/api/account-management/v1/lite/reset-password");

  Future<Response<dynamic>> getMsisdn() async {
    try {
      Response<dynamic> response =
          await client.request.get(urlGetMsisdn.toString());
      return response;
    } catch (e) {
      log(e.toString());
      throw Error();
    }
  }

  Future<Response<dynamic>> confirmGetMsisdn(String msisdn) async {
    try {
      Response<dynamic> response =
          await client.request.get("${urlConfirmGetMsisdn.toString()}/$msisdn");
      return response;
    } catch (e) {
      log(e.toString());
      throw Error();
    }
  }

  Future<ConfirmMsisdnNetwork?> getNumberFromNetwork() async {
    try {
      final msisdnResponse = await getMsisdn();
      final msisdn = json.decode(msisdnResponse.data)['msisdn'];
      final confirmMsisdn = await confirmGetMsisdn(msisdn);
      ConfirmMsisdnNetwork _model =
          confirmMsisdnNetworkFromJson(confirmMsisdn.data);
      saveInfosNetwork(_model);
      return _model;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future saveInfosNetwork(ConfirmMsisdnNetwork info) async {
    await storage.save(StorageKeys.HMAC.name, info.hmac);
    await storage.save(
        StorageKeys.MSISDN_NETWORK.name, formatGetMsisdn(info.msisdn));
  }

  Future<TokenResponse> getServiceToken() async {
    try {
      Response<dynamic> response =
          await client.request.get(urlGetServiceToken.toString());
      TokenResponse model = tokenResponseFromJson(response.data);
      return model;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<CustomerOffer> getCustomerOfferForOther(String msisdn) async {
    try {
      Response<dynamic> response = await client.request
          .get("${urlGetCustomerOfferForOther.toString()}/$msisdn");
      return customerOfferFromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<CheckNumber> checkNumber(String msisdn) async {
    final hmacNetwork = (await storage.getValue(StorageKeys.HMAC.name));
    try {
      Response<dynamic> response = await client.request.post(
          urlCheckNumber.toString(),
          data: {"msisdn": "221$msisdn", "hmac": hmacNetwork});
      return checkNumberFromDecodedJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<TokenResponse> resetPasswordLite(String login) async {
    final hmacNetwork = (await storage.getValue(StorageKeys.HMAC.name));
    try {
      Response<dynamic> response = await client.request
          .put(urlResetPwdLite.toString(), data: {
        "login": login,
        "hmac": hmacNetwork,
        "newPassword": generateRandomString(10)
      });
      TokenResponse model = tokenResponseFromDecodedJson(response.data);
      print(json.encode(response.data.toString()));
      (await storage.save(
          StorageKeys.TOKEN_INFOS.name, tokenResponseToJson(model)));
      return model;
    } catch (e) {
      throw Exception(e);
    }
  }
}
