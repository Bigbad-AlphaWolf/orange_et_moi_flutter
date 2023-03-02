import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:orange_et_moi/model/customer_offer.dart';
import 'package:orange_et_moi/model/offer_services.dart';
import 'package:orange_et_moi/services/micro_services.dart';
import 'package:orange_et_moi/services/oem_http_client.dart';
import 'package:orange_et_moi/services/secure_storage/secure_storage.service.dart';
import 'package:orange_et_moi/services/telco_infos/telco_infos.dart';
import 'package:orange_et_moi/utils/index.dart';

class OemOffreService {
  OemHttpClient _client = OemHttpClient();
  TelcoInfosService _telcoInfosService = TelcoInfosService();
  final endpointGetOffreService =
      "${ApiConstants.baseUrl}/${MicroService.Services}/api/offre-services-by-formule";

  Future<List<OffreService>> getOffreServicesByCategorieAndByCodeFormule(
      String code, String hubCategory) async {
    Options cacheOptions = buildCacheOptions(Duration(minutes: 15),
        maxStale: Duration(days: 1), forceRefresh: false);
    _client.request.interceptors
        .add(DioCacheManager(CacheConfig()).interceptor);
    Response<dynamic> resp = await _client.request.get(
        "$endpointGetOffreService?code=$code&categorie=$hubCategory",
        options: cacheOptions);
    return offreServiceFromDecodedJson(resp.data);
  }

  Future<List<OffreService>> getCurrentUserServicesByCategorie(
      String hubCategory) async {
    String currentMsisdn =
        await SecureStorage().getValue(StorageKeys.MSISDN_NETWORK.name);
    CustomerOffer userTelCoInfos =
        await _telcoInfosService.getCustomerOfferInfos(currentMsisdn);
    return getOffreServicesByCategorieAndByCodeFormule(
        userTelCoInfos.offerId, hubCategory);
  }
}
