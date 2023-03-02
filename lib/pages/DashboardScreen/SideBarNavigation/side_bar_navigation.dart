import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orange_et_moi/model/account_oem_infos.dart';
import 'package:orange_et_moi/model/sidemenu_items.dart';
import 'package:orange_et_moi/services/file_manager/file_manager.service.dart';
import 'package:orange_et_moi/services/telco_infos/telco_infos.dart';
import 'package:skeletons/skeletons.dart';

class SideBarNavigation extends StatefulWidget {
  const SideBarNavigation({
    Key? key,
  }) : super(key: key);

  @override
  State<SideBarNavigation> createState() => _SideBarNavigationState();
}

class _SideBarNavigationState extends State<SideBarNavigation> {
  int _currentIndex = 0;
  bool _faceIDActive = true;
  List<SideMenuItem> items = [
    SideMenuItem(
        leadingIcon: "assets/images/sidemenu/icons-mon-compte.png",
        label: "Détails suivi conso"),
    SideMenuItem(
        leadingIcon: "assets/images/sidemenu/icons-mes-commandes.png",
        label: "Ma formule"),
    SideMenuItem(
        leadingIcon: "assets/images/sidemenu/icons-suivre-ma-commande.png",
        label: "Offres et Services"),
    SideMenuItem(
        leadingIcon: "assets/images/sidemenu/icons-facture.png",
        label: "Factures"),
    SideMenuItem(
        leadingIcon: "assets/images/sidemenu/icons-parrainage.png",
        label: "Mes parrainnages"),
    SideMenuItem(
        leadingIcon: "assets/images/sidemenu/icons-bons-plan.png",
        label: "Bons Plans"),
    SideMenuItem(
        leadingIcon: "assets/images/sidemenu/icons-urgence-et-depannage.png",
        label: "Assistances"),
  ];
  TelcoInfosService telcoInfosService = TelcoInfosService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      backgroundColor: Color(0xfff3f3f8),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.transparent,
                        child: FutureBuilder(
                            future: getAccountInfos(),
                            builder: ((context, snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.active ||
                                  snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                return SkeletonAvatar(
                                  style: SkeletonAvatarStyle(width: 40),
                                );
                              } else if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasData) {
                                  AccountOeMInfos infos = snapshot.data!;
                                  FileManagerService fileManagerService =
                                      FileManagerService();
                                  String imgUrl = fileManagerService
                                      .getImageUrl(infos.imageProfil);
                                  return AspectRatio(
                                    aspectRatio: 1,
                                    child: ClipOval(
                                      child: Image.network(
                                        imgUrl,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Icon(Icons.person);
                                        },
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                }
                              }
                              return Text("Une erreur est survenue");
                            })),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xfff3f3f8),
                          ),
                          child: IconButton(
                              icon: Icon(Icons.close_outlined),
                              onPressed: () => Navigator.pop(context)))
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Cheikh Ahmadou Bamba Kébé",
                    maxLines: 2,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 30, fontFamily: "HelveticaNeueLTStd-Bd"),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30, left: 15, bottom: 30),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mes lignes",
                      style: TextStyle(
                          fontFamily: "HelveticaNeueLTStd-Bd", fontSize: 24),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text(
                        "Gérer mes lignes",
                        style: TextStyle(
                            fontFamily: "HelveticaNeueLTStd-Bd",
                            color: Color(0xffff7900),
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                SingleChildScrollView(
                  padding: EdgeInsets.only(left: 0),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [0, 1, 2, 3]
                        .map((e) => Stack(
                              children: [
                                _currentIndex == e
                                    ? Positioned(
                                        top: 5,
                                        right: 20,
                                        child: Icon(
                                            color: Color(0xff32c832),
                                            Icons.check_circle_rounded))
                                    : SizedBox(),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: _currentIndex != e ? 1 : 2,
                                          color: _currentIndex != e
                                              ? Color(0xffeeeeee)
                                              : Color(0xff32c832)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.all(10),
                                          foregroundColor: Colors.black),
                                      onPressed: (() {
                                        setState(() {
                                          _currentIndex = e;
                                        });
                                      }),
                                      child: Column(
                                        children: [
                                          SvgPicture.asset(
                                              fit: BoxFit.cover,
                                              "assets/images/sidemenu/sim-card-solid-new.svg"),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("77 441 16 50",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                      "HelveticaNeueLTStd-Bd")),
                                          Text("New S'cool",
                                              style: TextStyle(
                                                  color: Color(0xff999999),
                                                  fontSize: 12,
                                                  fontFamily:
                                                      "HelveticaNeueLTStd-Roman"))
                                        ],
                                      )),
                                )
                              ],
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            // height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                        ),
                        horizontalTitleGap: 0,
                        leading:
                            Image(image: AssetImage(items[index].leadingIcon)),
                        title: Text(
                          items.elementAt(index).label,
                          style: TextStyle(fontSize: 16),
                        ),
                        onTap: () {
                          // Update the state of the app
                          // ...
                          // Then close the drawer
                          Navigator.pop(context);
                        },
                      );
                    }),
                    separatorBuilder: ((context, index) {
                      return Divider(color: Color(0xffeeeeee));
                    }),
                    itemCount: items.length)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Sécurité",
                    style: TextStyle(
                        fontFamily: "HelveticaNeueLTStd-Bd", fontSize: 24)),
                Row(
                  children: [
                    Image(
                        image: AssetImage(
                            "assets/images/sidemenu/icons-faceid.png")),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flex(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                direction: Axis.vertical,
                                children: [
                                  Text(
                                    "Face ID",
                                    style: TextStyle(
                                        fontFamily: "HelveticaNeueLTStd-Roman",
                                        fontSize: 16),
                                  ),
                                  Text("Non disponible sur votre téléphone",
                                      style: TextStyle(
                                          fontFamily:
                                              "HelveticaNeueLTStd-Roman",
                                          fontSize: 12,
                                          color: Color(0xff999999)))
                                ]),
                            CupertinoSwitch(
                              activeColor: Color(0xffff7900),
                              value: _faceIDActive,
                              onChanged: ((value) {
                                setState(() {
                                  _faceIDActive = value;
                                });
                              }),
                            )
                          ],
                        ))
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("À propos",
                    style: TextStyle(
                        fontFamily: "HelveticaNeueLTStd-Bd", fontSize: 24)),
                ListTile(
                  title: Text(
                    "Version",
                    style: TextStyle(
                        fontFamily: "HelveticaNeueLTStd-Roman", fontSize: 16),
                  ),
                  trailing: Text(
                    "5.3.2",
                    style: TextStyle(color: Color(0xff666666)),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Informations générales",
                    style: TextStyle(
                        fontFamily: "HelveticaNeueLTStd-Roman", fontSize: 16),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.symmetric(vertical: 25),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  side: BorderSide(width: 2, color: Colors.black),
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.transparent, //<-- SEE HERE
                ),
                onPressed: (() {}),
                child: Text(
                  "Déconnexion",
                  style: TextStyle(fontFamily: "HelveticaNeueLTStd-Bd"),
                )),
          )
          // ListTile(
          //   title: Text('Item 1'),
          //   onTap: () {
          //     // Update the state of the app.
          //     // ...
          //   },
          // ),
          // ListTile(
          //   title: Text('Item 2'),
          //   onTap: () {
          //     // Update the state of the app.
          //     // ...
          //   },
          // ),
        ],
      ),
    );
  }

  Future<AccountOeMInfos> getAccountInfos() async {
    return await telcoInfosService.getAccountInfos(false);
  }
}
