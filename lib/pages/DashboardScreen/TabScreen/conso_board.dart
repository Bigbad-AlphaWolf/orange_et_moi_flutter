import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:orange_et_moi/model/sargal_oem_infos.dart';
import 'package:orange_et_moi/pages/DashboardScreen/TabScreen/components/dashboard_conso_card.dart';
import 'package:orange_et_moi/pages/DashboardScreen/TabScreen/components/dashboard_sargal_card.dart';
import 'package:orange_et_moi/pages/DashboardScreen/TabScreen/components/dashboard_suivi_conso.dart';
import 'package:orange_et_moi/pages/DashboardScreen/TabScreen/components/ibouSection/ibou_section.dart';
import 'package:orange_et_moi/services/conso_infos/consos_infos.service.dart';
import 'package:orange_et_moi/services/sargal/sargal.service.dart';

class ConsoBoard extends StatefulWidget {
  const ConsoBoard({super.key});

  @override
  State<ConsoBoard> createState() => _ConsoBoardState();

  static Route route() {
    return MaterialPageRoute(builder: (_) => ConsoBoard());
  }
}

class _ConsoBoardState extends State<ConsoBoard> {
  ConsoInfosService consoService = ConsoInfosService();
  SargalService sargalService = SargalService();
  bool hasErrorConso = false;
  late Future<Response<dynamic>> _userConso;
  @override
  void initState() {
    super.initState();
    _userConso = getConso();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffff7900), width: 2),
                      borderRadius: BorderRadius.circular(50)),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: (() {}),
                        icon: Image.asset(
                          "assets/images/photo-stories-promos.png",
                          // width: 85,
                          // fit: BoxFit.cover,
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffff7900), width: 2),
                      borderRadius: BorderRadius.circular(50)),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: (() {}),
                        icon: Image.asset(
                          "assets/images/photo-stories-promos.png",
                          // width: 85,
                          // fit: BoxFit.cover,
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffff7900), width: 2),
                      borderRadius: BorderRadius.circular(50)),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: (() {}),
                        icon: Image.asset(
                          "assets/images/photo-stories-promos.png",
                          // width: 85,
                          // fit: BoxFit.cover,
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffff7900), width: 2),
                      borderRadius: BorderRadius.circular(50)),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: (() {}),
                        icon: Image.asset(
                          "assets/images/photo-stories-promos.png",
                          // width: 85,
                          // fit: BoxFit.cover,
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffff7900), width: 2),
                      borderRadius: BorderRadius.circular(50)),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: (() {}),
                        icon: Image.asset(
                          "assets/images/photo-stories-promos.png",
                          // width: 85,
                          // fit: BoxFit.cover,
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: DashboardConsoCard(
              futureConso: _userConso,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: OrangeSargalDashboardCard(
              futureSargal: getSargalInfos(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Pass favoris",
              style:
                  TextStyle(fontSize: 16, fontFamily: "HelveticaNeueLTStd-Bd"),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.05),
                              blurRadius: 15,
                              offset: Offset(5, 5),
                            )
                          ],
                          gradient: LinearGradient(
                              stops: [0.03, 0.03],
                              colors: [Color(0xff4bb4e6), Colors.white]),
                          border:
                              Border.all(color: Color(0xffdddddd), width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 5),
                            margin: EdgeInsets.only(bottom: 9.5),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xffdddddd), width: 1))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image(
                                  image: AssetImage(
                                      "assets/images/dashboard-conso/icons-pass-internet.png"),
                                ),
                                Text(
                                  "Internet 7jours",
                                  style: TextStyle(
                                      height: 1,
                                      fontSize: 14,
                                      fontFamily: "HelveticaNeueLTStd-Roman"),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "5500 FCFA",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "HelveticaNeueLTStd-Bd"),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "2.5Go",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "Internet",
                            style: TextStyle(
                                color: Color(0xff666666), fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.05),
                              blurRadius: 15,
                              offset: Offset(5, 5),
                            )
                          ],
                          gradient: LinearGradient(
                              stops: [0.03, 0.03],
                              colors: [Color(0xff4bb4e6), Colors.white]),
                          border:
                              Border.all(color: Color(0xffdddddd), width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 5),
                            margin: EdgeInsets.only(bottom: 9.5),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xffdddddd), width: 1))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image(
                                  image: AssetImage(
                                      "assets/images/dashboard-conso/icons-pass-internet.png"),
                                ),
                                Text(
                                  "Internet 7jours",
                                  style: TextStyle(
                                      height: 1,
                                      fontSize: 14,
                                      fontFamily: "HelveticaNeueLTStd-Roman"),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "5500 FCFA",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "HelveticaNeueLTStd-Bd"),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "2.5Go",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "Internet",
                            style: TextStyle(
                                color: Color(0xff666666), fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.05),
                              blurRadius: 15,
                              offset: Offset(5, 5),
                            )
                          ],
                          gradient: LinearGradient(
                              stops: [0.03, 0.03],
                              colors: [Color(0xff4bb4e6), Colors.white]),
                          border:
                              Border.all(color: Color(0xffdddddd), width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 5),
                            margin: EdgeInsets.only(bottom: 9.5),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xffdddddd), width: 1))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image(
                                  image: AssetImage(
                                      "assets/images/dashboard-conso/icons-pass-internet.png"),
                                ),
                                Text(
                                  "Internet 7jours",
                                  style: TextStyle(
                                      height: 1,
                                      fontSize: 14,
                                      fontFamily: "HelveticaNeueLTStd-Roman"),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "5500 FCFA",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "HelveticaNeueLTStd-Bd"),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "2.5Go",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "Internet",
                            style: TextStyle(
                                color: Color(0xff666666), fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: DashboardSuiviConso(userConso: _userConso),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IbouSection(),
          )
        ],
      ),
    ]);
  }

  Future<Response<dynamic>> getConso() async {
    print("userConso call");
    return await consoService.getCurrentUserTelcoConso();
  }

  Future<SargalOeMInfos> getSargalInfos() async {
    print("userConso call");
    return await sargalService.getCurrentSargalInfos();
  }
}
