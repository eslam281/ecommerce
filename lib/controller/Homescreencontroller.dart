import 'package:ecommercecourse/view/screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController{
  changePage(int currentpage);
}
class HomeScreenControllerImp extends HomeScreenController{

  int currentpage =0;
  List<Widget> listpage =[
    const Home(),
    const Center(child:Text("2"),),
    const Center(child:Text("3"),),
    const Center(child:Text("4"),),
  ];

  @override
  changePage(int i) {
    currentpage=i;
    update();
  }

}