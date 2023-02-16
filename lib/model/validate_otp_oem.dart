import 'dart:convert';

ValidateOtpOem validateOtpOemFromDecodedJson(Map<String, dynamic> str) =>
    ValidateOtpOem.fromJson(str);

ValidateOtpOem validateOtpOemFromJson(String str) =>
    ValidateOtpOem.fromJson(json.decode(str));

String validateOtpOemToJson(ValidateOtpOem data) => json.encode(data.toJson());

class ValidateOtpOem {
  ValidateOtpOem({
    required this.msisdn,
    required this.code,
    required this.valid,
    required this.uuid,
    this.hmac,
  });

  String msisdn;
  String code;
  bool valid;
  String uuid;
  dynamic hmac;

  factory ValidateOtpOem.fromJson(Map<String, dynamic> json) => ValidateOtpOem(
        msisdn: json["msisdn"],
        code: json["code"],
        valid: json["valid"],
        uuid: json["uuid"],
        hmac: json["hmac"],
      );

  Map<String, dynamic> toJson() => {
        "msisdn": msisdn,
        "code": code,
        "valid": valid,
        "uuid": uuid,
        "hmac": hmac,
      };
}
