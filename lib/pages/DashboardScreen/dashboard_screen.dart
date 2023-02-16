import 'package:flutter/material.dart';
import 'package:orange_et_moi/pages/DashboardScreen/Header/header.dart';
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
        body: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              Flexible(
                  child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ListView(
                    padding: EdgeInsets.only(top: 15),
                    // shrinkWrap: true,
                    children: [_pages.elementAt(_currentIndex)],
                  )
                ],
              ))
            ],
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
