import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/cart_data.dart';
import '../../data/model/itemsmodel.dart';

abstract class ProductDetailsController extends GetxController{
  intialData();
  getCountItems(String itemsId);
  addItems(String itemsId);
  removeItems(String itemsId);
  colorOnChange(int index);
}

class ProductDetailsControllerImp extends ProductDetailsController{

  CartData cartData = CartData(Get.find());
  StatusRequest statusRequest=StatusRequest.onitnial ;
  int countitems =0;
  MyServices myServices = Get.find();

  late ItemsModel itemsModel;
  List subitems= [
    {"name":"Red","active":true},
    {"name":"Black","active":false},
    {"name":"Yellow","active":false},
   ];
  @override
  intialData()async{
    statusRequest=StatusRequest.loading ;
    itemsModel =Get.arguments['itemsmodel'];
    countitems= await getCountItems(itemsModel.itemsId.toString());
    statusRequest=StatusRequest.success ;
    update();
  }
  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  getCountItems(String itemsId) async{
    statusRequest =StatusRequest.loading;
    var response =await cartData.getCountItems(
        itemsId,myServices.sharedPreferences.getString("id")!);
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        return response["data"];
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
  }
  @override
  addItems(String itemsId) async{
    statusRequest =StatusRequest.loading;
    var response =await cartData.addCart(
        itemsId,myServices.sharedPreferences.getString("id")!);
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        Get.rawSnackbar(title:"Alert" ,messageText:const Text("Don"));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  removeItems(String itemsId) async{
    statusRequest =StatusRequest.loading;
    var response =await cartData.removeCart(
        itemsId,myServices.sharedPreferences.getString("id")!);
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        Get.rawSnackbar(title:"Alert" ,messageText:const Text("Don"));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  add(){
    countitems++;
    addItems(itemsModel.itemsId.toString());
    update();
  }

  remove(){
    if(countitems>0) {
      countitems--;
      removeItems(itemsModel.itemsId.toString());
      update();
    }
  }

  @override
  colorOnChange(int index) {
    subitems[index]["active"]=
    subitems[index]["active"]?false:true;
    update();
  }

}