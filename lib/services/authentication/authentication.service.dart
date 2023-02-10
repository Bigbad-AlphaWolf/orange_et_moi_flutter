import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:orange_et_moi/model/check_number.dart';
import 'package:orange_et_moi/model/confirm_msisdn.dart';
import 'package:orange_et_moi/model/customer_offer.dart';
import 'package:orange_et_moi/model/token_response.dart';
import 'package:orange_et_moi/services/interceptor/auth_interceptor.dart';
import 'package:orange_et_moi/services/micro_services.dart';

class AuthenticationService {
  AuthenticationService() {
    client.interceptors.add(AuthInterceptor());
  }
  static final client = Dio();
  final urlGetMsisdn = Uri.parse(ApiConstants.OM_GET_MSISDN);
  final urlConfirmGetMsisdn = Uri.parse(ApiConstants.OM_CONFIRM_GET_MSISDN);
  final urlGetServiceToken =
      Uri.parse("${ApiConstants.baseUrl}/auth/get-service-token");
  final urlGetCustomerOfferForOther = Uri.parse(
      "${ApiConstants.baseUrl}/${MicroService.AccountManagement}/api/abonne/v2/customerOffer");
  final urlCheckNumber = Uri.parse(
      "${ApiConstants.baseUrl}/${MicroService.AccountManagement}/api/account-management/v3/check_number");

  Future<Response<dynamic>> getMsisdn() async {
    try {
      Response<dynamic> response = await client.get(urlGetMsisdn.toString());
      return response;
    } catch (e) {
      log(e.toString());
      throw Error();
    }
  }

  Future<Response<dynamic>> confirmGetMsisdn(String msisdn) async {
    try {
      Response<dynamic> response =
          await client.get("${urlConfirmGetMsisdn.toString()}/$msisdn");
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
      return _model;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<TokenResponse> getServiceToken() async {
    try {
      Response<dynamic> response =
          await client.get(urlGetServiceToken.toString());
      TokenResponse model = tokenResponseFromJson(response.data);
      return model;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<CustomerOffer> getCustomerOfferForOther(String msisdn) async {
    try {
      Response<dynamic> response =
          await client.get("${urlGetCustomerOfferForOther.toString()}/$msisdn");
      return customerOfferFromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<CheckNumber> checkNumber(String msisdn) async {
    try {
      Response<dynamic> response = await client
          .post(urlCheckNumber.toString(), data: {msisdn: "221$msisdn"});
      return checkNumberFromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
