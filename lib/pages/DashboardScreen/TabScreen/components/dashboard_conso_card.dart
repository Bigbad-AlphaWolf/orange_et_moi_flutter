import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:orange_et_moi/model/user_telco_conso.dart';
import 'package:orange_et_moi/utils/index.dart';
import 'package:skeletons/skeletons.dart';

class DashboardConsoCard extends StatelessWidget {
  const DashboardConsoCard({
    required this.futureConso,
    Key? key,
  }) : super(key: key);

  final Future<Response<dynamic>> futureConso;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 250,
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage("assets/images/background-02-conso.png"),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: Icon(
                  Icons.call_sharp,
                  size: 16,
                ),
              ),
              Text(
                "Crédit global",
                style: TextStyle(
                    fontSize: 14, fontFamily: "HelveticaNeueLTStd-Bd"),
              ),
            ],
          ),
          Row(
            children: [
              FutureBuilder(
                future: futureConso,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          lines: 1,
                          lineStyle: SkeletonLineStyle(
                            randomLength: true,
                            height: 30,
                            minLength: MediaQuery.of(context).size.width / 4,
                            maxLength: MediaQuery.of(context).size.width / 3,
                          )),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Text('Error');
                    } else if (snapshot.hasData) {
                      final bool fromCache = snapshot.data!.headers
                                  .value(DIO_CACHE_HEADER_KEY_DATA_SOURCE) !=
                              null
                          ? true
                          : false;
                      final List<TelcoConsoModel> response =
                          telcoConsoModelFromJson(snapshot.data!.data);
                      final int creditGlobal = setConsoCardValue(response);

                      return Flex(
                        direction: Axis.horizontal,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: formatNumber.format(creditGlobal),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "HelveticaNeueLTStd-Bd",
                                      fontSize: 34),
                                  children: [
                                TextSpan(
                                    text: " FCFA",
                                    style: TextStyle(fontSize: 24)),
                              ])),
                          SizedBox(
                            width: 10,
                          ),
                          fromCache == true
                              ? Text("Mettre à jour",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline))
                              : Text(""),
                        ],
                      );
                    } else {
                      return const Text('Empty data');
                    }
                  } else {
                    return Text('State: ${snapshot.connectionState}');
                  }
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(80, 190, 135, 0.4),
                              blurRadius: 14,
                              offset: Offset(5, 5), // Shadow position
                            ),
                          ]),
                      child: IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () => {},
                          icon: Image.asset(
                            "assets/images/dashboard-conso/icons-cartes-credit.png",
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Crédit",
                      style: TextStyle(
                          fontFamily: "HelveticaNeueLTStd-Bd",
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
              ),
              SizedBox(
                // width: 55,
                // height: 55,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(75, 180, 230, 0.4),
                              blurRadius: 14,
                              offset: Offset(5, 5), // Shadow position
                            ),
                          ]),
                      child: IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () => {},
                          icon: Image.asset(
                            "assets/images/dashboard-conso/icons-cartes-internet.png",
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Internet",
                      style: TextStyle(
                          fontFamily: "HelveticaNeueLTStd-Bd",
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
              ),
              SizedBox(
                // width: 55,
                // height: 55,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(208, 172, 219, 0.4),
                              blurRadius: 14,
                              offset: Offset(5, 5), // Shadow position
                            ),
                          ]),
                      child: IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () => {},
                          icon: Image.asset(
                            "assets/images/dashboard-conso/icons-cartes-illimix.png",
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Illimix",
                      style: TextStyle(
                          fontFamily: "HelveticaNeueLTStd-Bd",
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(255, 180, 0, 0.4),
                              blurRadius: 14,
                              offset: Offset(5, 5), // Shadow position
                            ),
                          ]),
                      child: IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () => {},
                          icon: Image.asset(
                            "assets/images/dashboard-conso/icons-cartes-illiflex.png",
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Illiflex",
                      style: TextStyle(
                          fontFamily: "HelveticaNeueLTStd-Bd",
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  int setConsoCardValue(List<TelcoConsoModel>? userConso) {
    final creditGlobalCompteurs = userConso
        ?.where((value) => value.codeCompteur == 1 || value.codeCompteur == 6)
        .toList();
    int creditGlobalValue = 0;
    for (var element in creditGlobalCompteurs!) {
      creditGlobalValue += element.montantRestantBrut;
    }
    return creditGlobalValue;
  }
}
