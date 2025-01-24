import 'package:ecommercecourse/core/services/services.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';
import '../data/datasource/remote/homedata.dart';

abstract class HomeContorller extends GetxController{
  initalData();
  getData();
}

class HomeControllerImp extends HomeContorller{
  MyServices myServices = Get.find();
  String? username;
  String? id;
  late StatusRequest statusRequest;
  HomeData testData = HomeData(Get.find());
  List data =[];
  List categories =[];
  List items =[];

  @override
  initalData(){
    username =myServices.sharedPreferences.getString("username");
    id =myServices.sharedPreferences.getString("id");
  }
  @override
  void onInit() {
    getData();
    initalData();
    statusRequest =StatusRequest.onitnial;
    super.onInit();
  }

  @override
  getData()async{
    statusRequest =StatusRequest.loading;
    var response =await testData.getData();
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}