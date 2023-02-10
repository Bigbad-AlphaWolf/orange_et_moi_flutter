import 'package:flutter/material.dart';
import 'package:orange_et_moi/pages/DashboardScreen/dashboard_screen.dart';

class AppNavigation {
  static final AppNavigation _instance = AppNavigation._internal();

  factory AppNavigation() {
    return _instance;
  }
  AppNavigation._internal();

  void goToDashboard(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => DashboardScreen()));
  }
}
