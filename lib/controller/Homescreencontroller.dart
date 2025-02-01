import 'package:ecommercecourse/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screen/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listpage = [
    const Home(),
    const Center(
      child: Text("3"),
    ),
    const Center(
      child: Text("4"),
    ),
    const Settings(),
  ];
  List<Map> bottomappbat = [
    {"title": "home", "icon": Icons.home},
    {"title": "ca", "icon": Icons.notifications_active_outlined},
    {"title": "profile", "icon": Icons.person},
    {"title": "settings", "icon": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
