import 'dart:convert';

OtpOemGenerate otpOemGenerateFromJsonDecoded(Map<String, dynamic> str) {
  return OtpOemGenerate.fromJson(str);
}

OtpOemGenerate otpOemGenerateFromJson(String str) =>
    OtpOemGenerate.fromJson(json.decode(str));

String otpOemGenerateToJson(OtpOemGenerate data) => json.encode(data.toJson());

class OtpOemGenerate {
  OtpOemGenerate({
    required this.msisdn,
    required this.token,
    this.ip,
    required this.otpMessageSent,
    required this.duration,
  });

  String msisdn;
  String token;
  dynamic ip;
  bool otpMessageSent;
  int duration;

  factory OtpOemGenerate.fromJson(Map<String, dynamic> json) => OtpOemGenerate(
        msisdn: json["msisdn"],
        token: json["token"],
        ip: json["ip"],
        otpMessageSent: json["otpMessageSent"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "msisdn": msisdn,
        "token": token,
        "ip": ip,
        "otpMessageSent": otpMessageSent,
        "duration": duration,
      };
}
