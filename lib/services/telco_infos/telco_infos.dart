import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:orange_et_moi/model/account_oem_infos.dart';
import 'package:orange_et_moi/model/customer_offer.dart';
import 'package:orange_et_moi/services/micro_services.dart';
import 'package:orange_et_moi/services/oem_http_client.dart';
import 'package:orange_et_moi/services/secure_storage/secure_storage.service.dart';
import 'package:orange_et_moi/utils/index.dart';

class TelcoInfosService {
  static final client = OemHttpClient();
  static final _storage = SecureStorage();

  final String _baseUrlCustomerOfferV1 =
      "${ApiConstants.baseUrl}/${MicroService.AccountManagement}/api/abonne/v1/customerOffer";

  final String _baseUrlgetAbonneInfos =
      "${ApiConstants.baseUrl}/${MicroService.AccountManagement}/api/account-management/account";

  Future<CustomerOffer> getCustomerOfferInfos(String msisdn) async {
    // OemHttpClient httpClient = client;
    // httpClient.request.interceptors.add(DioCacheManager(CacheConfig()).interceptor);
    client.request.interceptors.add(DioCacheManager(CacheConfig()).interceptor);
    Options _cacheOptions = buildCacheOptions(Duration(hours: 1),
        maxStale: Duration(days: 1), forceRefresh: false);
    Response<dynamic> resp = await client.request
        .get("$_baseUrlCustomerOfferV1/$msisdn", options: _cacheOptions);
    return customerOfferFromDecodedJson(resp.data);
  }

  Future<AccountOeMInfos> getAccountInfos(bool refresh) async {
    String currentMsisdn =
        await _storage.getValue(StorageKeys.MSISDN_NETWORK.name);
    Options cacheOptions = buildCacheOptions(Duration(days: 1),
        maxStale: Duration(days: 7), forceRefresh: false);
    client.request.interceptors.add(DioCacheManager(CacheConfig()).interceptor);
    final path = "$_baseUrlgetAbonneInfos/$currentMsisdn";
    if (refresh) {
      await DioCacheManager(CacheConfig()).delete(path);
    }
    Response<dynamic> resp =
        await client.request.get(path, options: cacheOptions);
    return accountOeMInfosFromDecodedJson(resp.data);
  }
}
