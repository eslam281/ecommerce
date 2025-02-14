import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/homedata.dart';
import '../../data/model/itemsmodel.dart';
import '../../test.dart';

abstract class HomeContorller extends SearchMixController{
  initalData();
  getData();
  goToItems(List categories ,int selectedCat);
  goToPageProductDetails(ItemsModel itemsmodel);
}

class HomeControllerImp extends HomeContorller{
  MyServices myServices = Get.find();
  String? username;
  String? id;
  late String lang;

  List data =[];
  List categories =[];
  List items =[];

  @override
  initalData(){
    lang = myServices.sharedPreferences.getString("lang")!;
    username =myServices.sharedPreferences.getString("username");
    id =myServices.sharedPreferences.getString("id");
  }
  @override
  void onInit() {
    getData();
    initalData();
    super.onInit();
  }

  sendMessages()async{
    String? accesstoken = await getAccessToken();
     homeData.accessToken(accesstoken??"");
  }

  @override
  getData()async{
    statusRequest =StatusRequest.loading;
    var response =await homeData.getData();
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
  goToPageProductDetails(ItemsModel itemsmodel) {
    Get.toNamed(AppRoute.productdetails,arguments: {'itemsmodel':itemsmodel});
  }
  
}

class SearchMixController extends GetxController{
  late TextEditingController search;
  bool isSearch = false;
  List<ItemsModel> listData=[];
  late StatusRequest statusRequest = StatusRequest.onitnial;

  HomeData homeData = HomeData(Get.find());

  @override
  void onInit() {
    search =TextEditingController();
    super.onInit();
  }
  checkSearch(String val){
    if (val.isNotEmpty) {
      isSearch=true;
    }else{
      statusRequest = StatusRequest.onitnial;
      isSearch =false;
    }
    update();
  }

  onSearchItems(){
    isSearch=true;
    searchData();
    update();
  }

  searchData()async{
    statusRequest =StatusRequest.loading;
    listData.clear();
    var response =await homeData.search(search.text);
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        List responsedata =response["data"];
        listData.addAll(responsedata.map(
              (e) => ItemsModel.fromJson(e),));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}