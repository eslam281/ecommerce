import 'package:ecommercecourse/view/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/home/settings.dart';
import '../../view/screen/orders/orders.dart';



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
    const Orders(),
    const Settings(),
  ];
  List<Map> bottomappbat = [
    {"title": "home", "icon": Icons.home},
    {"title": "Notifications", "icon": Icons.notifications_active_outlined},
    {"title": "Orders", "icon": Icons.card_giftcard},
    {"title": "settings", "icon": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
