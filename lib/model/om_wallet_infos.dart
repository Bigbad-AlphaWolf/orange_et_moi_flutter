import 'dart:convert';

OmWalletInfos omWalletInfosFromDecodedJson(Map<String, dynamic> str) =>
    OmWalletInfos.fromJson(str);

OmWalletInfos omWalletInfosFromJson(String str) =>
    OmWalletInfos.fromJson(json.decode(str));

String omWalletInfosToJson(OmWalletInfos data) => json.encode(data.toJson());

class OmWalletInfos {
  OmWalletInfos({
    required this.balance,
    required this.barred,
    required this.frozenBalance,
    required this.grade,
    required this.suspended,
    required this.type,
  });

  double balance;
  String barred;
  double frozenBalance;
  String grade;
  String suspended;
  String type;

  factory OmWalletInfos.fromJson(Map<String, dynamic> json) => OmWalletInfos(
        balance: json["balance"]?.toDouble(),
        barred: json["barred"],
        frozenBalance: json["frozenBalance"],
        grade: json["grade"],
        suspended: json["suspended"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
        "barred": barred,
        "frozenBalance": frozenBalance,
        "grade": grade,
        "suspended": suspended,
        "type": type,
      };
}
