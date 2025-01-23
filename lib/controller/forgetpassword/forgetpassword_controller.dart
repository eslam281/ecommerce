import 'package:ecommercecourse/data/datasource/remote/forgetpassword/forgetpassword_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';

abstract class ForgetPasswordController extends GetxController{
  checkEmail();
  goToVerfiyCode();
}
class ForgetPasswordControllerImp extends ForgetPasswordController{
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late StatusRequest statusRequest=StatusRequest.onitnial ;
  ForgetPasswordData ForgetPassworData = ForgetPasswordData(Get.find());

  @override
  goToVerfiyCode() {
    Get.toNamed(AppRoute.verFiyCode);
  }

  @override
  checkEmail() async{
    if(formstate.currentState!.validate()){
      statusRequest =StatusRequest.loading;
      update();
      var response =await ForgetPassworData.
      postData(email.text);
      statusRequest =handlingData(response);
      print(response);
      if(statusRequest == StatusRequest.success){
        if(response['status']=="success"){
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.verFiyCode,arguments:{
            "email":email.text
          });
        }else{
          Get.defaultDialog(title:"Warning"
              ,middleText:"Email Not found");
          statusRequest = StatusRequest.failure;
        }
      }}else{
      print("Not valid");
    }
    update();
  }
  @override
  void onInit() {
    email =TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

}