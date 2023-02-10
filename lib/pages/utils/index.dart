final RegExp regexValideMobileNumber = RegExp(
    r'^((\+221|00221|221) ?)?(7(0|6|7|8){1}) ?([0-9]{3}) ?([0-9]{2}) ?([0-9]{2})$');

enum StorageKeys { HMAC, MSISDN_NETWORK, UUID, TOKEN_INFOS }
