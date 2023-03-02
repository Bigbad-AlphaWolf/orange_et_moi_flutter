import 'dart:convert';

SargalOeMInfos sargalOeMInfosFromDecodedJson(Map<String, dynamic> str) =>
    SargalOeMInfos.fromJson(str);

String sargalOeMInfosToJson(SargalOeMInfos data) => json.encode(data.toJson());

class SargalOeMInfos {
  SargalOeMInfos({
    required this.msisdn,
    required this.status,
    required this.totalPoints,
    this.lastUpdate,
    this.lastUpdateFormatted,
  });

  String msisdn;
  String status;
  String totalPoints;
  dynamic lastUpdate;
  dynamic lastUpdateFormatted;

  factory SargalOeMInfos.fromJson(Map<String, dynamic> json) => SargalOeMInfos(
        msisdn: json["msisdn"],
        status: json["status"],
        totalPoints: json["totalPoints"],
        lastUpdate: json["lastUpdate"],
        lastUpdateFormatted: json["lastUpdateFormatted"],
      );

  Map<String, dynamic> toJson() => {
        "msisdn": msisdn,
        "status": status,
        "totalPoints": totalPoints,
        "lastUpdate": lastUpdate,
        "lastUpdateFormatted": lastUpdateFormatted,
      };
}
