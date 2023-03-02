import 'package:flutter/material.dart';
import 'package:orange_et_moi/pages/DashboardScreen/Header/header.dart';
import 'package:orange_et_moi/pages/DashboardScreen/SideBarNavigation/side_bar_navigation.dart';
import 'package:orange_et_moi/pages/DashboardScreen/TabScreen/conso_board.dart';
import 'package:orange_et_moi/pages/DashboardScreen/TabScreen/orange_money_board.dart';
import 'package:orange_et_moi/pages/DashboardScreen/TabScreen/services_board.dart';
import 'package:orange_et_moi/pages/DashboardScreen/TabScreen/transactions_board.dart';
import 'package:orange_et_moi/services/secure_storage/secure_storage.service.dart';
import 'package:orange_et_moi/services/telco_infos/telco_infos.dart';
import 'package:orange_et_moi/utils/index.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();

  static Route route() {
    return MaterialPageRoute(builder: (_) => DashboardScreen());
  }
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  static const List<Widget> _pages = <Widget>[
    OrangeMoneyBoard(),
    ConsoBoard(),
    ServicesBoard(),
    TransactionsBoard(),
    ConsoBoard()
  ];
  @override
  void initState() {
    super.initState();
  }

  List<Map<String, String>> listbottomMenu = [
    {
      "icon":
          "assets/images/tabbar_icons/navigation-bar-orange-money-inactive.png",
      "selected_icon":
          "assets/images/tabbar_icons/navigation-bar-orange-money-active.png",
      "label": "Money"
    },
    {
      "icon": "assets/images/tabbar_icons/navigation-bar-conso-inactive.png",
      "selected_icon":
          "assets/images/tabbar_icons/navigation-bar-conso-active.png",
      "label": "Conso"
    },
    {
      "icon": "assets/images/tabbar_icons/navigation-bar-services-inactive.png",
      "selected_icon":
          "assets/images/tabbar_icons/navigation-bar-services-active.png",
      "label": "Services"
    },
    {
      "icon":
          "assets/images/tabbar_icons/navigation-bar-transactions-inactive.png",
      "selected_icon":
          "assets/images/tabbar_icons/navigation-bar-transactions-active.png",
      "label": "Transactions"
    },
  ];

  @override
  Widget build(BuildContext context) {
    print("build data");
    return Scaffold(
        drawer: SideBarNavigation(),
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              FutureBuilder(
                  future: getMainAccountInfos(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active ||
                        snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox();
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Flexible(
                            child: ListView(
                          padding: EdgeInsets.only(top: 15),
                          children: [_pages.elementAt(_currentIndex)],
                        ));
                      } else {
                        return Text("Vérifier votre connexion internet");
                      }
                    } else {
                      return Text("Vérifier votre connexion internet");
                    }
                  })),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                    blurRadius: 20,
                    offset: Offset(0, -10))
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              onTap: _onItemTap,
              currentIndex: _currentIndex,
              fixedColor: Color(0xffff7900),
              showUnselectedLabels: true,
              selectedFontSize: 10,
              unselectedItemColor: Color(0xff666666),
              items: <BottomNavigationBarItem>[
                for (var elt in listbottomMenu)
                  BottomNavigationBarItem(
                    activeIcon: Image(image: AssetImage(elt["selected_icon"]!)),
                    icon: Image(image: AssetImage(elt["icon"]!)),
                    label: elt["label"],
                  ),
                BottomNavigationBarItem(
                  activeIcon: Image(
                      image: AssetImage(
                          "assets/images/tabbar_icons/navigation-bar-autres-active.png")),
                  icon: Image(
                      image: AssetImage(
                          "assets/images/tabbar_icons/navigation-bar-autres-inactive.png")),
                  label: 'Autres',
                ),
              ],
            ),
          ),
        ));
  }

  void _onItemTap(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  Future getMainAccountInfos() async {
    final TelcoInfosService telcoInfosService = TelcoInfosService();
    String currentMsisdn =
        await SecureStorage().getValue(StorageKeys.MSISDN_NETWORK.name);
    return telcoInfosService.getCustomerOfferInfos(currentMsisdn);
  }
}
