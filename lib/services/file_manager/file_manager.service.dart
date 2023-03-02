import 'package:orange_et_moi/services/micro_services.dart';

class FileManagerService {
  final _urlGetB2cImageEndpoint =
      Uri.parse("${ApiConstants.baseUrl}/${MicroService.FileManager}");

  String getImageUrl(String imgName) {
    return "$_urlGetB2cImageEndpoint/$imgName";
  }
}
