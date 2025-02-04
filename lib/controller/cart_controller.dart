import 'package:ecommercecourse/data/datasource/remote/cart_data.dart';
import 'package:ecommercecourse/data/model/cartmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';

abstract class CartController extends GetxController {
  add(String itemsId);
  remove(String itemsId);
  getCountItems(String itemsId);
  view();
}
class CartControllerImp extends CartController{
  CartData cartData = CartData(Get.find());

  List<CartModel> data =[];
  dynamic priceorder=0.0;
  int totalcountitems=0;

  StatusRequest statusRequest=StatusRequest.onitnial ;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    view();
    super.onInit();
  }

  @override
  add(String itemsId) async{
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
  remove(String itemsId) async{
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
  view()async {
    statusRequest =StatusRequest.loading;
    var response =await cartData.viewCart(
        myServices.sharedPreferences.getString("id")!);
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        List responsedata=response["datacart"];
       data.addAll(responsedata.map((e) => CartModel.fromJson(e)));
       totalcountitems = int.parse( response["datacountprice"]["totalcount"]);
       priceorder = response["datacountprice"]["SUM(itemsprice)"];
       print(totalcountitems);
       print(priceorder);
       print(data);

      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}