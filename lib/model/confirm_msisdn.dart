import 'dart:convert';

ConfirmMsisdnNetwork confirmMsisdnNetworkFromJson(String str) =>
    ConfirmMsisdnNetwork.fromJson(json.decode(str));

String confirmMsisdnNetworkToJson(ConfirmMsisdnNetwork data) =>
    json.encode(data.toJson());

class ConfirmMsisdnNetwork {
  ConfirmMsisdnNetwork({
    required this.apiKey,
    required this.hmac,
    required this.msisdn,
    required this.status,
  });

  String apiKey;
  String hmac;
  String msisdn;
  bool status;

  factory ConfirmMsisdnNetwork.fromJson(Map<String, dynamic> json) =>
      ConfirmMsisdnNetwork(
        apiKey: json["api_key"],
        hmac: json["hmac"],
        msisdn: json["msisdn"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "api_key": apiKey,
        "hmac": hmac,
        "msisdn": msisdn,
        "status": status,
      };
}
