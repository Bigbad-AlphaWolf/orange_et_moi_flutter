import 'package:flutter/material.dart';
import 'package:orange_et_moi/model/sargal_oem_infos.dart';
import 'package:orange_et_moi/utils/index.dart';
import 'package:skeletons/skeletons.dart';

class OrangeSargalDashboardCard extends StatelessWidget {
  const OrangeSargalDashboardCard({
    required this.futureSargal,
    Key? key,
  }) : super(key: key);

  final Future<SargalOeMInfos> futureSargal;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 111,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(
                  "assets/images/dashboard-conso/illustrations-sargal-gift.png"),
              alignment: Alignment.bottomRight),
          gradient: Gradient.lerp(
              LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromRGBO(255, 255, 255, 0.8),
                  Color.fromRGBO(255, 255, 255, 0.58),
                ],
              ),
              LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  Color(0xFFff7900),
                  Color(0xFFffe6d0),
                ],
              ),
              0.6)),
      child: FutureBuilder(
          future: futureSargal,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.waiting) {
              return Flex(
                direction: Axis.vertical,
                children: [
                  SkeletonLine(
                    style: SkeletonLineStyle(width: 100),
                  )
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                SargalOeMInfos infos = snapshot.data!;
                if (infos.status == 'SUBSCRIBED') {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Flex(
                            direction: Axis.vertical,
                            children: [
                              Text(
                                "Orange Sargal",
                                style: TextStyle(
                                    fontFamily: "HelveticaNeueLTStd-Bd",
                                    fontSize: 14),
                              ),
                              Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Image(
                                      image: AssetImage(
                                          "assets/images/dashboard-conso/icons-sargal-star-basic.png")),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flex(
                                    mainAxisSize: MainAxisSize.max,
                                    direction: Axis.vertical,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    // textDirection: TextDirection.ltr,
                                    children: [
                                      Text(
                                        formatNumber.format(
                                            int.parse(infos.totalPoints)),
                                        style: TextStyle(
                                            fontFamily: "HelveticaNeueLTStd-Bd",
                                            fontSize: 24),
                                      ),
                                      Text(
                                        "Points",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily:
                                                "HelveticaNeueLTStd-Roman"),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Text(
                        "Convertir mes points",
                        style: TextStyle(
                            color: Color(0xFFff7900),
                            fontFamily: "HelveticaNeueLTStd-Bd",
                            fontSize: 14,
                            decoration: TextDecoration.underline),
                      )
                    ],
                  );
                }
              }
            }
            return Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Sargal Indisponible"),
              ],
            );
          })),
    );
  }
}
