import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/homedata.dart';

abstract class HomeContorller extends GetxController{
  initalData();
  getData();
  goToItems(List categories ,int selectedCat);
  checkSearch(String val);
}

class HomeControllerImp extends HomeContorller{
  MyServices myServices = Get.find();
  String? username;
  String? id;
  late String lang;
  late TextEditingController search;
  bool isSearch = false;

  late StatusRequest statusRequest = StatusRequest.onitnial;
  HomeData testData = HomeData(Get.find());

  List data =[];
  List categories =[];
  List items =[];

  @override
  initalData(){
    search =TextEditingController();
    lang = myServices.sharedPreferences.getString("lang")!;
    username =myServices.sharedPreferences.getString("username");
    id =myServices.sharedPreferences.getString("id");
    statusRequest =StatusRequest.onitnial;
  }
  @override
  void onInit() {
    getData();
    initalData();
    super.onInit();
  }

  @override
  getData()async{
    statusRequest =StatusRequest.loading;
    var response =await testData.getData();
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        categories.addAll(response['categories']["data"]);
        items.addAll(response['items']["data"]);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(List categories ,int selectedCat) {
    Get.toNamed(AppRoute.items,arguments:{
      "categories":categories,
      "selectedcat":selectedCat
    });
  }

  @override
  checkSearch(String val){
    if (val.isNotEmpty) {
      isSearch=true;
    }else{
      isSearch =false;
    }
    update();
  }

  onSearchItems(){
    isSearch=true;
    update();
  }
}