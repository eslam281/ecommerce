import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/data/datasource/remote/addressdata.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/model/addressmodel.dart';

abstract class CheckoutController extends GetxController{
  choosePaymentMethod(String val);
  chooseDeliveryType(String val);
  chooseShippingAddress(int val);
  getShippingAddress();
}
class CheckoutControllerImp extends CheckoutController{

  AddressData addressData = Get.put(AddressData(Get.find()));

  StatusRequest statusRequest =StatusRequest.onitnial;
  MyServices myServices = Get.find();
  List<AddressModel> dataAddress=[];

  String? paymentMethod;
  String? deliveryType;
  int? addressId;

  late String couponId;
  late String priceorder;

  @override
  void onInit() {
    couponId = Get.arguments["couponid"];
    priceorder = Get.arguments["priceorder"];
    getShippingAddress();
    super.onInit();
  }


  @override
  choosePaymentMethod(String val){
    paymentMethod= val;
    update();
  }
  @override
  chooseDeliveryType(String val){
    deliveryType= val;
    update();
  }
  @override
  chooseShippingAddress(int val){
    addressId= val;
    update();
  }

  @override
  getShippingAddress()async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.getData(
        myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responsedata=response['data'];
        dataAddress.addAll(responsedata.map((e) =>
            AddressModel.fromJson(e),));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}