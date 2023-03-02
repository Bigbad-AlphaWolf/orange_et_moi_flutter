import 'dart:convert';

AccountOeMInfos accountOeMInfosFromDecodedJson(Map<String, dynamic> str) =>
    AccountOeMInfos.fromJson(str);

String accountOeMInfosToJson(AccountOeMInfos data) =>
    json.encode(data.toJson());

class AccountOeMInfos {
  AccountOeMInfos({
    required this.id,
    required this.numero,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageProfil,
    this.clientId,
    this.hashMsisdn,
    this.activationKey,
    this.langKey,
    required this.attempts,
    required this.createdDate,
    this.users,
    this.sponsees,
    this.deviceInfos,
    required this.derniereConnnexionDate,
    required this.tutoViewed,
    required this.emailActivated,
    this.notificationInformations,
    required this.accountStatus,
  });

  int id;
  String numero;
  String firstName;
  String lastName;
  String email;
  String imageProfil;
  dynamic clientId;
  dynamic hashMsisdn;
  dynamic activationKey;
  dynamic langKey;
  int attempts;
  DateTime createdDate;
  dynamic users;
  dynamic sponsees;
  dynamic deviceInfos;
  DateTime derniereConnnexionDate;
  bool tutoViewed;
  bool emailActivated;
  dynamic notificationInformations;
  String accountStatus;

  factory AccountOeMInfos.fromJson(Map<String, dynamic> json) =>
      AccountOeMInfos(
        id: json["id"],
        numero: json["numero"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        imageProfil: json["imageProfil"],
        clientId: json["clientId"],
        hashMsisdn: json["hashMsisdn"],
        activationKey: json["activationKey"],
        langKey: json["langKey"],
        attempts: json["attempts"],
        createdDate: DateTime.parse(json["createdDate"]),
        users: json["users"],
        sponsees: json["sponsees"],
        deviceInfos: json["deviceInfos"],
        derniereConnnexionDate: DateTime.parse(json["derniereConnnexionDate"]),
        tutoViewed: json["tutoViewed"],
        emailActivated: json["emailActivated"],
        notificationInformations: json["notificationInformations"],
        accountStatus: json["accountStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "numero": numero,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "imageProfil": imageProfil,
        "clientId": clientId,
        "hashMsisdn": hashMsisdn,
        "activationKey": activationKey,
        "langKey": langKey,
        "attempts": attempts,
        "createdDate": createdDate.toIso8601String(),
        "users": users,
        "sponsees": sponsees,
        "deviceInfos": deviceInfos,
        "derniereConnnexionDate": derniereConnnexionDate.toIso8601String(),
        "tutoViewed": tutoViewed,
        "emailActivated": emailActivated,
        "notificationInformations": notificationInformations,
        "accountStatus": accountStatus,
      };
}
