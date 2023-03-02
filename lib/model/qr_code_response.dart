import 'dart:convert';

QrCodeResponse qrCodeResponseFromDecodedJson(Map<String, dynamic> str) =>
    QrCodeResponse.fromJson(str);

String qrCodeResponseToJson(QrCodeResponse data) => json.encode(data.toJson());

class QrCodeResponse {
  QrCodeResponse({
    required this.id,
    required this.qrCode,
    required this.validity,
  });

  String id;
  String qrCode;
  int validity;

  factory QrCodeResponse.fromJson(Map<String, dynamic> json) => QrCodeResponse(
      id: json["id"], qrCode: json["qrCode"], validity: json["validity"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "qrCode": qrCode, "validity": validity};
}
