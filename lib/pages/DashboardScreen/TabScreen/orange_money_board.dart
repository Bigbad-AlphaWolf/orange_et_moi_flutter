import 'package:flutter/material.dart';
import 'package:orange_et_moi/model/offer_services.dart';
import 'package:orange_et_moi/pages/DashboardScreen/TabScreen/components/contact_item.dart';
import 'package:orange_et_moi/pages/DashboardScreen/TabScreen/components/ibouSection/ibou_section.dart';
import 'package:orange_et_moi/pages/DashboardScreen/TabScreen/components/list_details_transactions.dart';
import 'package:orange_et_moi/pages/DashboardScreen/TabScreen/components/om_card_for_dashboard.dart';
import 'package:orange_et_moi/pages/DashboardScreen/TabScreen/components/qr_code_for_dashboard.dart';
import 'package:orange_et_moi/services/file_manager/file_manager.service.dart';
import 'package:orange_et_moi/services/navigation/app_navigation.dart';
import 'package:orange_et_moi/services/oem_offres_service/oem_offre_services.service.dart';
import 'package:orange_et_moi/utils/index.dart';

class OrangeMoneyBoard extends StatefulWidget {
  const OrangeMoneyBoard({super.key});

  @override
  State<OrangeMoneyBoard> createState() => _OrangeMoneyBoardState();
}

class _OrangeMoneyBoardState extends State<OrangeMoneyBoard> {
  List<dynamic> topServices = [
    {
      "icon": "assets/images/dashboard-om/icons-cartes-transfert-v-2.png",
      "label": "Transfert"
    },
    {
      "icon": "assets/images/dashboard-om/icons-cartes-depot-v-2.png",
      "label": "Dépot"
    },
    {
      "icon": "assets/images/dashboard-om/icons-cartes-achat.png",
      "label": "Achat"
    },
    {
      "icon": "assets/images/dashboard-om/icons-cartes-facture.png",
      "label": "Facture"
    },
  ];

  List<Map<String, String?>> listContacts = [
    {"avatar": null, "initial": "MD", "fullName": "Mariama Diallo"},
    {"avatar": null, "initial": "MD", "fullName": "Mariama Diallo"},
    {"avatar": null, "initial": "MD", "fullName": "Mariama Diallo"},
    {"avatar": null, "initial": "MD", "fullName": "Mariama Diallo"},
  ];

  List<Map<String, String?>> listServices = [
    {"image": null, "label": "Sen Eau"},
    {"image": null, "label": "Senelec"},
    {"image": null, "label": "Woyofal"},
    {"image": null, "label": "Canal+"},
  ];

  List<Map<String, dynamic>> listTransactions = [
    {
      "icone": null,
      "labelTrx": "Sen Eau",
      "dateTrx": "19h40",
      "amount": "+19000 Fcfa",
      "fullNameRecipient": "Vieux Mamadou Kassé"
    },
    {
      "icone": null,
      "labelTrx": "Achat Crédit",
      "dateTrx": "00h40",
      "amount": "+25000 Fcfa",
      "fullNameRecipient": "Vieux Mamadou Kassé"
    },
    {
      "icone": null,
      "labelTrx": "Transfert",
      "dateTrx": "1h40",
      "amount": "+9000 Fcfa",
      "fullNameRecipient": "Vieux Mamadou Kassé"
    },
    {
      "icone": null,
      "labelTrx": "Achat de Pass",
      "dateTrx": "1h40",
      "amount": "1000 Fcfa",
      "fullNameRecipient": "Vieux Mamadou Kassé"
    }
  ];
  OemOffreService oemOffreService = OemOffreService();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OMCardForDashboard(topServices: topServices),
          SizedBox(
            height: 15,
          ),
          QRCodeForDashboard(),
          SizedBox(
            height: 30,
          ),
          RecentsTransferOMSection(listContacts: listContacts),
          SizedBox(
            height: 30,
          ),
          BillServicesSection(futureListServices: getBillsOffreService()),
          SizedBox(height: 30),
          Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: [
              Text(
                "Transactions",
                style: TextStyle(
                    fontFamily: "HelveticaNeueLTStd-Bd", fontSize: 14),
              ),
              GestureDetector(
                onTap: (() {
                  AppNavigation().goToOMTabDashboard(context);
                }),
                child: Text(
                  "Afficher tout",
                  style: TextStyle(
                      fontFamily: "HelveticaNeueLTStd-Bd",
                      decoration: TextDecoration.underline,
                      color: Color(0xffff7900)),
                ),
              ),
            ],
          ),
          ListDetailsTransaction(listTransactions: listTransactions),
          IbouSection()
        ],
      ),
    );
  }

  Future<List<OffreService>> getBillsOffreService() async {
    return await oemOffreService
        .getCurrentUserServicesByCategorie(HubActions.HUB_BILLS.name);
  }
}

class BillServicesSection extends StatelessWidget {
  const BillServicesSection({
    Key? key,
    required this.futureListServices,
  }) : super(key: key);

  final Future<List<OffreService>> futureListServices;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payer une facture",
          style: TextStyle(fontFamily: "HelveticaNeueLTStd-Bd", fontSize: 16),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xffdddddd), width: 1)),
          child: FutureBuilder(
              future: futureListServices,
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<OffreService> resp = snapshot.data!.sublist(0, 4);
                    print("list $resp");
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: resp
                              .map((elt) => SizedBox(
                                      // width: MediaQuery.of(context).size.width * 0.20,
                                      child: Flex(
                                    direction: Axis.vertical,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        child: elt.iconev1.isNotEmpty
                                            ? Image.network(FileManagerService()
                                                .getImageUrl(elt.iconev1))
                                            : Text("Pas de photo"),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        elt.fullDescription.isNotEmpty
                                            ? elt.fullDescription
                                            : "",
                                        textAlign: TextAlign.center,
                                        softWrap: false,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily:
                                                "HelveticaNeueLTStd-Roman",
                                            fontSize: 12),
                                      )
                                    ],
                                  )))
                              .toList()),
                    );
                  }
                }
                return Text("Une erreur est survenue");
              })),
        ),
      ],
    );
  }
}

class RecentsTransferOMSection extends StatelessWidget {
  const RecentsTransferOMSection({
    Key? key,
    required this.listContacts,
  }) : super(key: key);

  final List<Map<String, String?>> listContacts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Envoyer de l’argent",
          style: TextStyle(fontFamily: "HelveticaNeueLTStd-Bd", fontSize: 16),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xffdddddd), width: 1)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var elt in listContacts)
                  ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.21,
                          minWidth: MediaQuery.of(context).size.width * 0.20),
                      child: ContactItem(elt: elt)),
              ]),
        ),
      ],
    );
  }
}
