import 'dart:convert';

List<OffreService> offreServiceFromDecodedJson(List<dynamic> str) =>
    List<OffreService>.from(str.map((x) => OffreService.fromJson(x)));

List<OffreService> offreServiceFromJson(String str) => List<OffreService>.from(
    json.decode(str).map((x) => OffreService.fromJson(x)));

String offreServiceToJson(List<OffreService> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OffreService {
  OffreService({
    required this.id,
    required this.titre,
    required this.shortDescription,
    this.duree,
    required this.activated,
    required this.fullDescription,
    this.tariff,
    this.banniere,
    required this.typeService,
    required this.code,
    required this.formules,
    required this.description,
    required this.icone,
    this.iconeBackground,
    required this.ordre,
    required this.libelle,
    this.passUsage,
    this.question,
    this.reponse,
    required this.iconev1,
    this.iconev2,
    required this.newLabel,
    required this.categorieOffreServices,
    required this.redirectionType,
    required this.redirectionPath,
    this.reasonDeactivation,
    this.newOffer,
    this.versionMinimal,
    required this.besoinAide,
  });

  int id;
  String titre;
  String shortDescription;
  dynamic duree;
  bool activated;
  String fullDescription;
  dynamic tariff;
  dynamic banniere;
  String typeService;
  String code;
  List<String> formules;
  String description;
  String icone;
  dynamic iconeBackground;
  int ordre;
  String libelle;
  dynamic passUsage;
  dynamic question;
  dynamic reponse;
  String iconev1;
  dynamic iconev2;
  String newLabel;
  List<CategorieOffreService> categorieOffreServices;
  String? redirectionType;
  String? redirectionPath;
  dynamic reasonDeactivation;
  dynamic newOffer;
  dynamic versionMinimal;
  bool besoinAide;

  factory OffreService.fromJson(Map<String, dynamic> json) => OffreService(
        id: json["id"],
        titre: json["titre"],
        shortDescription: json["shortDescription"],
        duree: json["duree"],
        activated: json["activated"],
        fullDescription: json["fullDescription"],
        tariff: json["tariff"],
        banniere: json["banniere"],
        typeService: json["typeService"],
        code: json["code"],
        formules: List<String>.from(json["formules"].map((x) => x)),
        description: json["description"],
        icone: json["icone"],
        iconeBackground: json["iconeBackground"],
        ordre: json["ordre"],
        libelle: json["libelle"],
        passUsage: json["passUsage"],
        question: json["question"],
        reponse: json["reponse"],
        iconev1: json["iconev1"],
        iconev2: json["iconev2"],
        newLabel: json["newLabel"],
        categorieOffreServices: List<CategorieOffreService>.from(
            json["categorieOffreServices"]
                .map((x) => CategorieOffreService.fromJson(x))),
        redirectionType: json["redirectionType"],
        redirectionPath: json["redirectionPath"],
        reasonDeactivation: json["reasonDeactivation"],
        newOffer: json["newOffer"],
        versionMinimal: json["versionMinimal"],
        besoinAide: json["besoinAide"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titre": titre,
        "shortDescription": shortDescription,
        "duree": duree,
        "activated": activated,
        "fullDescription": fullDescription,
        "tariff": tariff,
        "banniere": banniere,
        "typeService": typeService,
        "code": code,
        "formules": List<dynamic>.from(formules.map((x) => x)),
        "description": description,
        "icone": icone,
        "iconeBackground": iconeBackground,
        "ordre": ordre,
        "libelle": libelle,
        "passUsage": passUsage,
        "question": question,
        "reponse": reponse,
        "iconev1": iconev1,
        "iconev2": iconev2,
        "newLabel": newLabel,
        "categorieOffreServices":
            List<dynamic>.from(categorieOffreServices.map((x) => x.toJson())),
        "redirectionType": redirectionType,
        "redirectionPath": redirectionPath,
        "reasonDeactivation": reasonDeactivation,
        "newOffer": newOffer,
        "versionMinimal": versionMinimal,
        "besoinAide": besoinAide,
      };
}

class CategorieOffreService {
  CategorieOffreService({
    required this.id,
    required this.libelle,
    this.description,
    required this.niveau,
    required this.ordre,
    required this.code,
    this.image,
    this.zoneAffichage,
    this.categorieOffreServices,
  });

  int id;
  String libelle;
  String? description;
  String niveau;
  int ordre;
  String code;
  dynamic image;
  dynamic zoneAffichage;
  dynamic categorieOffreServices;

  factory CategorieOffreService.fromJson(Map<String, dynamic> json) =>
      CategorieOffreService(
        id: json["id"],
        libelle: json["libelle"],
        description: json["description"],
        niveau: json["niveau"],
        ordre: json["ordre"],
        code: json["code"],
        image: json["image"],
        zoneAffichage: json["zoneAffichage"],
        categorieOffreServices: json["categorieOffreServices"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
        "description": description,
        "niveau": niveau,
        "ordre": ordre,
        "code": code,
        "image": image,
        "zoneAffichage": zoneAffichage,
        "categorieOffreServices": categorieOffreServices,
      };
}
