import 'package:intl/intl.dart';

final RegExp regexValideMobileNumber = RegExp(
    r'^((\+221|00221|221) ?)?(7(0|6|7|8){1}) ?([0-9]{3}) ?([0-9]{2}) ?([0-9]{2})$');

enum StorageKeys { HMAC, MSISDN_NETWORK, UUID, TOKEN_INFOS, ACCOUNT_OEM_INFOS }

enum HubActions {
  HUB_ACHAT,
  HUB_TRANSFER,
  HUB_BILLS,
  HUB_OM,
  HUB_FIXE,
  HUB_OFFRES_FIXE,
}

var formatNumber = NumberFormat("###,###,###", "fr_FR");
