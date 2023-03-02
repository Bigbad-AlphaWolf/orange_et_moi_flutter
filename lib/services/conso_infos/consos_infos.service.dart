
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:orange_et_moi/services/micro_services.dart';
import 'package:orange_et_moi/services/oem_http_client.dart';
import 'package:orange_et_moi/services/secure_storage/secure_storage.service.dart';
import 'package:orange_et_moi/utils/index.dart';

class ConsoInfosService {
  Options _cacheOptions = buildCacheOptions(Duration(minutes: 5),
      maxStale: Duration(days: 1), forceRefresh: true);
  final _client = OemHttpClient();
  final SecureStorage _storage = SecureStorage();
  final urlGetUserTelcoProfile = Uri.parse(
      "${ApiConstants.baseUrl}/${MicroService.Consos}/api/suivi-conso");

  Future<dynamic> getCurrentUserTelcoConso() async {
    final currentUserMsisdn =
        await _storage.getValue(StorageKeys.MSISDN_NETWORK.name);
    _client.request.interceptors
        .add(DioCacheManager(CacheConfig()).interceptor);
    Response<dynamic> response = await _client.request.get(
        "${urlGetUserTelcoProfile.toString()}/$currentUserMsisdn",
        options: _cacheOptions);
    return response;
  }
}
