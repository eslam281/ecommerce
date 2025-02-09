import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/datasource/remote/addressdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';

abstract class AddAddressController extends GetxController {}

class AddAddressControllerImp extends AddAddressController {
  AddressData addressData = AddressData(Get.find());

  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;
  GlobalKey<FormState> addressform = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.onitnial;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    super.onInit();
  }

  @override
  dispose(){
    name.dispose();
    city.dispose();
    street.dispose();
    super.dispose();
  }

  getdata() async {
    statusRequest = StatusRequest.loading;
    Map<String, dynamic> data = {
      "userid": myServices.sharedPreferences.getString("id")!,
      "name": name.text,
      "city": city.text,
      "street": street.text
    };
    var response = await addressData.addData(data);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.rawSnackbar(title: "Alert", messageText: const Text("Don"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  add() async {
    if(addressform.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map<String, dynamic> data = {
        "userid": myServices.sharedPreferences.getString("id")!,
        "name": name.text,
        "city": city.text,
        "street": street.text
      };
      var response = await addressData.addData(data);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.rawSnackbar(title: "Alert", messageText: const Text("Don"));
          Get.offNamed(AppRoute.home);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }
  remove() async {
    statusRequest = StatusRequest.loading;
    Map<String, dynamic> data = {
      "userid": myServices.sharedPreferences.getString("id")!,
      "name": name.text,
      "city": city.text,
      "street": street.text
    };
    var response = await addressData.addData(data);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.rawSnackbar(title: "Alert", messageText: const Text("Don"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
