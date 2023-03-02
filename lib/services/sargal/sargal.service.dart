import 'package:dio/dio.dart';
import 'package:orange_et_moi/model/sargal_oem_infos.dart';
import 'package:orange_et_moi/services/micro_services.dart';
import 'package:orange_et_moi/services/oem_http_client.dart';
import 'package:orange_et_moi/services/secure_storage/secure_storage.service.dart';
import 'package:orange_et_moi/utils/index.dart';

class SargalService {
  OemHttpClient _client = OemHttpClient();
  SecureStorage _storage = SecureStorage();
  final String getSargalInfosEndpoint =
      "${ApiConstants.baseUrl}/${MicroService.Sargal}/api/sargal/v1/subscription-status";

  Future<SargalOeMInfos> getCurrentSargalInfos() async {
    String currentMsisdn =
        await _storage.getValue(StorageKeys.MSISDN_NETWORK.name);
    final Response<dynamic> resp =
        await _client.request.get("$getSargalInfosEndpoint/$currentMsisdn");
    return sargalOeMInfosFromDecodedJson(resp.data);
  }
}
