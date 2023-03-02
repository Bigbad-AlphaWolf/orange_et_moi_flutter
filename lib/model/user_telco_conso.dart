import 'dart:convert';

List<TelcoConsoModel> telcoConsoModelFromJson(List<dynamic> str) {
  return List<TelcoConsoModel>.from(
      str.map((x) => TelcoConsoModel.fromJson(x)));
}

String telcoConsoModelToJson(List<TelcoConsoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TelcoConsoModel {
  TelcoConsoModel({
    required this.codeCompteur,
    required this.name,
    required this.montantRestant,
    required this.montantRestantBrut,
    this.ordre,
    required this.dateEffet,
    required this.montantConsomme,
    required this.montantConsommeBrut,
    required this.montantTotal,
    required this.montantTotalBrut,
    required this.unite,
    required this.dateExpiration,
    this.inactif,
    required this.typeCompteur,
  });

  int codeCompteur;
  String name;
  String montantRestant;
  int montantRestantBrut;
  int? ordre;
  String dateEffet;
  String montantConsomme;
  int montantConsommeBrut;
  String montantTotal;
  int montantTotalBrut;
  String unite;
  String dateExpiration;
  dynamic inactif;
  String typeCompteur;

  factory TelcoConsoModel.fromJson(Map<String, dynamic> json) =>
      TelcoConsoModel(
        codeCompteur: json["codeCompteur"],
        name: json["name"],
        montantRestant: json["montantRestant"],
        montantRestantBrut: json["montantRestantBrut"],
        ordre: json["ordre"],
        dateEffet: json["dateEffet"],
        montantConsomme: json["montantConsomme"],
        montantConsommeBrut: json["montantConsommeBrut"],
        montantTotal: json["montantTotal"],
        montantTotalBrut: json["montantTotalBrut"],
        unite: json["unite"],
        dateExpiration: json["dateExpiration"],
        inactif: json["inactif"],
        typeCompteur: json["typeCompteur"],
      );

  Map<String, dynamic> toJson() => {
        "codeCompteur": codeCompteur,
        "name": name,
        "montantRestant": montantRestant,
        "montantRestantBrut": montantRestantBrut,
        "ordre": ordre,
        "dateEffet": dateEffet,
        "montantConsomme": montantConsomme,
        "montantConsommeBrut": montantConsommeBrut,
        "montantTotal": montantTotal,
        "montantTotalBrut": montantTotalBrut,
        "unite": unite,
        "dateExpiration": dateExpiration,
        "inactif": inactif,
        "typeCompteur": typeCompteur,
      };
}
