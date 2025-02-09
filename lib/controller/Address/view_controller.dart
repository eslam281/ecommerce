import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/addressdata.dart';
import '../../data/model/addressmodel.dart';

abstract class AddressViewController extends GetxController{
  getData();
}

class AddressViewControllerImp extends AddressViewController{

  StatusRequest statusRequest = StatusRequest.onitnial;
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());

  List<AddressModel> dataAddress=[];

  @override
  void onInit() {
   getData();
    super.onInit();
  }

  @override
  getData() async {
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

        print(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}