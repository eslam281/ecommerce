import 'package:ecommercecourse/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';

abstract class ResetPasswordController extends GetxController{
  checkCode();
  goToSuccessResetPassword();
}
class ResetPasswordControllerImp extends ResetPasswordController{
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late StatusRequest statusRequest=StatusRequest.onitnial ;
  ResetPassword resetPasswordData = ResetPassword(Get.find());
  String? email;

  @override
  goToSuccessResetPassword() {
    Get.offAllNamed(AppRoute.successResetPassword);
  }

  @override
  checkCode() async{
    if(formstate.currentState!.validate()){
      statusRequest =StatusRequest.loading;
      update();
      var response =await resetPasswordData.
      postData(email!,password.text);
      statusRequest =handlingData(response);
      print(response);
      if(statusRequest == StatusRequest.success){
        if(response['status']=="success"){
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.successResetPassword);
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
    password =TextEditingController();
    confirmPassword =TextEditingController();
    email=Get.arguments['email'];
    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}