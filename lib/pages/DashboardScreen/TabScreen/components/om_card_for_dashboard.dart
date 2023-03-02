import 'package:flutter/material.dart';
import 'package:orange_et_moi/model/om_wallet_infos.dart';
import 'package:orange_et_moi/services/orange-money/orange_money.service.dart';
import 'package:orange_et_moi/services/secure_storage/secure_storage.service.dart';
import 'package:orange_et_moi/utils/index.dart';
import 'package:skeletons/skeletons.dart';

class OMCardForDashboard extends StatefulWidget {
  const OMCardForDashboard({
    Key? key,
    required this.topServices,
  }) : super(key: key);

  final List topServices;

  @override
  State<OMCardForDashboard> createState() => _OMCardForDashboardState();
}

class _OMCardForDashboardState extends State<OMCardForDashboard> {
  final OrangeMoneyService omService = OrangeMoneyService();
  bool hideSolde = true;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 345 / 205,
      child: Container(
        padding: EdgeInsets.only(top: 25, bottom: 20, left: 15, right: 15),
        // height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  "assets/images/dashboard-om/background-01-money.png")),
        ),
        child: Column(
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Image(
                    image:
                        AssetImage("assets/images/dashboard-om/group-28.png")),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Orange Money",
                  style: TextStyle(
                      fontFamily: "HelveticaNeueLTStd-Bd", fontSize: 14),
                )
              ],
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(0),
                foregroundColor: Colors.black, // Text Color
              ),
              onPressed: _changeVisibility,
              child: Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  hideSolde == false
                      ? FutureBuilder(
                          future: getOMWalletInfos(),
                          builder: ((context, snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.active ||
                                snapshot.connectionState ==
                                    ConnectionState.waiting) {
                              return SkeletonLine(
                                style: SkeletonLineStyle(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    borderRadius: BorderRadius.circular(10),
                                    height: 50),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                final OmWalletInfos data = snapshot.data;
                                return Row(children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.7),
                                    child: Text(
                                      "${data.balance.toString()} FCFA",
                                      softWrap: false,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: "HelveticaNeueLTStd-Bd",
                                          fontSize: 34),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.visibility,
                                    size: 25,
                                  )
                                ]);
                              } else if (snapshot.hasError) {
                                return Text("Une erreur est survenue");
                              } else {
                                return Text("Une autre erreur");
                              }
                            } else {
                              return Text("${snapshot.connectionState}");
                            }
                          }))
                      : Row(
                          children: [
                            SizedBox(
                              width: 150,
                              height: 10,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) => Container(
                                      width: 10.0,
                                      height: 10.0,
                                      margin: EdgeInsets.only(right: 5),
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,
                                      ),
                                    )),
                                itemCount: 10,
                              ),
                            ),
                            Icon(Icons.visibility_off)
                          ],
                        ),
                ],
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var elt in widget.topServices)
                  Flex(
                    direction: Axis.vertical,
                    children: [
                      IconButton(
                          iconSize: 55,
                          splashColor: Colors.blue,
                          onPressed: () {
                            print("click");
                          },
                          icon: Image.asset(elt["icon"]!)),
                      Text(
                        elt["label"]!,
                        style: TextStyle(
                            fontFamily: "HelveticaNeueLTStd-Bd",
                            decoration: TextDecoration.underline),
                      )
                    ],
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future getOMWalletInfos() async {
    String currentMsisdn =
        await SecureStorage().getValue(StorageKeys.MSISDN_NETWORK.name);
    return omService.getOMWalletInfos(currentMsisdn);
  }

  void _changeVisibility() {
    setState(() {
      hideSolde = !hideSolde;
    });
  }
}
