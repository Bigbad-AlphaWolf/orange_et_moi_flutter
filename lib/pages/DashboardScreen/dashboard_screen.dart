import 'package:flutter/material.dart';
import 'package:orange_et_moi/pages/DashboardScreen/TabScreen/conso_board.dart';
import 'package:orange_et_moi/pages/DashboardScreen/TabScreen/orange_money_board.dart';
import 'package:orange_et_moi/pages/DashboardScreen/TabScreen/services_board.dart';
import 'package:orange_et_moi/pages/DashboardScreen/TabScreen/transactions_board.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildHeader(), _pages.elementAt(_currentIndex)],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTap,
          currentIndex: _currentIndex,
          fixedColor: Color(0xffff7900),
          showUnselectedLabels: true,
          unselectedItemColor: Color(0xff666666),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: 'OM',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart),
              label: 'Conso',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Services',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.support),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Autres',
            ),
          ],
        ));
  }

  void _onItemTap(value) {
    setState(() {
      _currentIndex = value;
    });
  }
}

class _buildHeader extends StatelessWidget {
  const _buildHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                width: 40,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/icons-profil-profil.png"),
              ),
              GestureDetector(
                child: Row(
                  children: [
                    SizedBox(width: 5),
                    Text(
                      "78 121 09 42",
                      style: TextStyle(
                          fontFamily: "HelveticaNeueLTStd-Bd", fontSize: 14),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: (() {}),
                  icon: Icon(size: 30, Icons.notifications_none_outlined)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(size: 30, Icons.settings_outlined)),
              IconButton(
                  onPressed: () {}, icon: Icon(size: 30, Icons.qr_code_scanner))
            ],
          )
        ],
      ),
    );
  }
}
