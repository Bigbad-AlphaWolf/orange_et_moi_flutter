import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:orange_et_moi/model/om_wallet_infos.dart';
import 'package:orange_et_moi/model/qr_code_response.dart';
import 'package:orange_et_moi/services/micro_services.dart';
import 'package:orange_et_moi/services/oem_http_client.dart';
import 'package:orange_et_moi/services/secure_storage/secure_storage.service.dart';
import 'package:orange_et_moi/utils/index.dart';

class OrangeMoneyService {
  OemHttpClient client = OemHttpClient();
  final String omWalletInfosEndpoint =
      "${ApiConstants.baseUrl}/${MicroService.OrangeMoney}/api/ekalpay/v1/account";

  final String omQRCodeEndpoint =
      "${ApiConstants.baseUrl}/${MicroService.OrangeMoney}/api/v1/qrcode";

  Future<OmWalletInfos> getOMWalletInfos(String msisdn) async {
    final Response<dynamic> resp = await client.request.get(
        "$omWalletInfosEndpoint?msisdn=$msisdn&type=customer&walletType=principal");
    return omWalletInfosFromDecodedJson(resp.data);
  }

  Future<QrCodeResponse> generateQRCode() async {
    Options cacheOptions =
        buildCacheOptions(Duration(minutes: 59), forceRefresh: false);
    client.request.interceptors.add(DioCacheManager(CacheConfig()).interceptor);
    String currentMsisdn =
        await SecureStorage().getValue(StorageKeys.MSISDN_NETWORK.name);
    final Response<dynamic> resp = await client.request.post(
        "$omQRCodeEndpoint/$currentMsisdn?validity=3600",
        options: cacheOptions);
    return qrCodeResponseFromDecodedJson(resp.data);
  }
}
