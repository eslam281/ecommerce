import 'package:ecommercecourse/core/constant/routes.dart';
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
  view();
}
class CartControllerImp extends CartController{

  CartData cartData = CartData(Get.find());
  List<CartModel> data =[];
  dynamic priceorder=0;
  int totalcountitems=0;
  late TextEditingController controllercoupon;

  StatusRequest statusRequest=StatusRequest.onitnial ;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    controllercoupon=TextEditingController();
    view();
    super.onInit();
  }

  @override
  add(String itemsId) async{
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
  remove(String itemsId) async{
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

  @override
  view()async {
    statusRequest =StatusRequest.loading;
    update();
    var response =await cartData.viewCart(
        myServices.sharedPreferences.getString("id")!);
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"&&response["datacart"]['status']=="success"&&response["datacountprice"]!=false){
        List responsedata=response["datacart"]['data'];
       data.addAll(responsedata.map((e) => CartModel.fromJson(e)));
       totalcountitems = int.parse( response["datacountprice"]["totalcount"]);
       priceorder = response["datacountprice"]["totalprice"];
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  resetVarCart(){
    totalcountitems=0;
    priceorder=0;
    data.clear();
  }

  void refreshPage() {
    resetVarCart();
    view();
  }
  goToBack(){
    Get.offNamed(AppRoute.home);
  }

}