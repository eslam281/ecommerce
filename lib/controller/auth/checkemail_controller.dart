// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// import '../../core/constant/routes.dart';
//
// abstract class CheckEmailController extends GetxController{
//   checkEmail();
//   goToVerFiyCodeSignUp();
// }
// class CheckEmailControllerImp extends CheckEmailController{
//   GlobalKey<FormState> formstate = GlobalKey<FormState>();
//   late TextEditingController email;
//
//   @override
//   goToVerFiyCodeSignUp() {
//     Get.offAllNamed(AppRoute.verFiyCodeSignUp);
//   }
//
//   @override
//   checkEmail() {
//     if(formstate.currentState!.validate()){
//       print("valid");
//       goToVerFiyCodeSignUp();
//     }else{
//       print("Not valid");
//     }
//   }
//   @override
//   void onInit() {
//     email =TextEditingController();
//     super.onInit();
//   }
//   @override
//   void dispose() {
//     email.dispose();
//     super.dispose();
//   }
//
// }