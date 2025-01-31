import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/favorite_data.dart';

abstract class FavoriteController extends GetxController{
  setFavorite(id,val);
  addFavorite(String itemsId);
  removeFavorite(String itemsId);
}

class FavoriteControllerImp extends FavoriteController{
  Map isFavorite = {};
  FavoriteData itemsData = FavoriteData(Get.find());
  List data =[];
  StatusRequest statusRequest=StatusRequest.onitnial ;
  MyServices myServices = Get.find();

  @override
  setFavorite(id, val) {
    isFavorite[id]=val;
    update();
  }

  @override
  addFavorite(String itemsId) async{
     statusRequest =StatusRequest.loading;
     var response =await itemsData.addFavorite(
         itemsId,myServices.sharedPreferences.getString("id")!);
     statusRequest =handlingData(response);
     if(statusRequest == StatusRequest.success){
       if(response['status']=="success"){
         Get.rawSnackbar(title:"Alert" ,messageText:const Text("Don"));
       }else{
         statusRequest = StatusRequest.failure;
       }
     }
  }

  @override
  removeFavorite(String itemsId) async{
    statusRequest =StatusRequest.loading;
    var response =await itemsData.removeFavorite(
        itemsId,myServices.sharedPreferences.getString("id")!);
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        Get.rawSnackbar(title:"Alert" ,messageText:const Text("Don"));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
  }

}