import 'package:ecommercecourse/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/auth/login_data.dart';

abstract class LoginController extends GetxController{
  login();
  showPassword();
  goToSignUp();
  goToForgetPassword();
}
class LoginControllerImp extends LoginController{

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword=true;
  late StatusRequest statusRequest=StatusRequest.onitnial ;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices= Get.find();

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value){
      print("==$value");
      String? token =value;
    });
    email =TextEditingController();
    password =TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  login()async {
    if(formstate.currentState!.validate()){
      statusRequest =StatusRequest.loading;
      update();
      var response =await loginData.
      postData(password.text, email.text);
      statusRequest =handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status']=="success"){
          if (response["data"]["users_approve"]==1) {
            myServices.sharedPreferences.setString("id", response["data"]["users_id"].toString());
            myServices.sharedPreferences.setString("username", response["data"]["users_name"]);
            myServices.sharedPreferences.setString("email", response["data"]["users_email"]);
            myServices.sharedPreferences.setString("phone", response["data"]["users_phone"]);
            myServices.sharedPreferences.setString("step", "2");
            Get.offNamed(AppRoute.home,);
          }else{
            Get.offNamed(AppRoute.verFiyCodeSignUp,);
          }
          // myServices.sharedPreferences.setString("password", response["data"]["users_password"]);
        }else{
          Get.defaultDialog(title:"Warning"
              ,middleText:"password or Email aren't correct");
          statusRequest = StatusRequest.failure;
        }
      }
    }else{
      print("Not valid");
    }
    update();
  }

  @override
  showPassword(){
    isshowpassword=isshowpassword?false:true;
    update();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

}
