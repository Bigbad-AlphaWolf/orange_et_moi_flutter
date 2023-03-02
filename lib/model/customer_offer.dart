import 'dart:convert';

CustomerOffer customerOfferFromDecodedJson(Map<String, dynamic> str) =>
    CustomerOffer.fromJson(str);

CustomerOffer customerOfferFromJson(String str) =>
    CustomerOffer.fromJson(json.decode(str));

String customerOfferToJson(CustomerOffer data) => json.encode(data.toJson());

class CustomerOffer {
  CustomerOffer({
    required this.clientCode,
    required this.offerId,
    required this.createDate,
    this.data,
    required this.endUserId,
    this.offerCode,
    required this.offerGamme,
    required this.offerName,
    required this.offerStatus,
    required this.offerType,
    this.sms,
    this.voice,
  });

  String clientCode;
  String offerId;
  DateTime createDate;
  dynamic data;
  String endUserId;
  dynamic offerCode;
  String offerGamme;
  String offerName;
  String offerStatus;
  String offerType;
  dynamic sms;
  dynamic voice;

  factory CustomerOffer.fromJson(Map<String, dynamic> json) => CustomerOffer(
        clientCode: json["clientCode"],
        offerId: json["offerId"],
        createDate: DateTime.parse(json["createDate"]),
        data: json["data"],
        endUserId: json["endUserId"],
        offerCode: json["offerCode"],
        offerGamme: json["offerGamme"],
        offerName: json["offerName"],
        offerStatus: json["offerStatus"],
        offerType: json["offerType"],
        sms: json["sms"],
        voice: json["voice"],
      );

  Map<String, dynamic> toJson() => {
        "clientCode": clientCode,
        "offerId": offerId,
        "createDate": createDate.toIso8601String(),
        "data": data,
        "endUserId": endUserId,
        "offerCode": offerCode,
        "offerGamme": offerGamme,
        "offerName": offerName,
        "offerStatus": offerStatus,
        "offerType": offerType,
        "sms": sms,
        "voice": voice,
      };
}
