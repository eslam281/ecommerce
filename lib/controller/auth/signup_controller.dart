import 'package:ecommercecourse/data/datasource/remote/auth/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';

abstract class SignUpController extends GetxController{
  signUp();
  goToSignIn();
  goToForgetPassword();
}
class SignUpControllerImp extends SignUpController{
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  bool isshowpassword=true;
  List data =[];
  late StatusRequest statusRequest=StatusRequest.onitnial ;
  Signup signupData = Signup(Get.find());

  showPassword(){
    isshowpassword=isshowpassword?false:true;
    update();
  }

  @override
  goToSignIn() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  signUp() async{
    if(formstate.currentState!.validate()){
      statusRequest =StatusRequest.loading;
      update();
      var response =await signupData.
      postData(username.text, password.text, email.text, phone.text);
      statusRequest =handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status']=="success"){
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.verFiyCodeSignUp,arguments:{
            "email":email.text
          });
        }else{
          Get.defaultDialog(title:"Warning"
          ,middleText:"Phone Number or email already exists");
          statusRequest = StatusRequest.failure;
        }
      }
    }else{
    }
      update();
  }
  @override
  void onInit() {
    email =TextEditingController();
    password =TextEditingController();
    username =TextEditingController();
    phone =TextEditingController();
    confirmPassword =TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

}