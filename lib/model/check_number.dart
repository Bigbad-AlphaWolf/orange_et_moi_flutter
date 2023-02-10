import 'dart:convert';

CheckNumber checkNumberFromJson(String str) =>
    CheckNumber.fromJson(json.decode(str));

String checkNumberToJson(CheckNumber data) => json.encode(data.toJson());

class CheckNumber {
  CheckNumber({
    required this.accountStatus,
  });

  String accountStatus;

  factory CheckNumber.fromJson(Map<String, dynamic> json) => CheckNumber(
        accountStatus: json["accountStatus"],
      );

  Map<String, dynamic> toJson() => {
        "accountStatus": accountStatus,
      };
}
