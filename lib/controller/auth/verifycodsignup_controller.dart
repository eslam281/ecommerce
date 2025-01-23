import 'package:ecommercecourse/data/datasource/remote/auth/verfiycodesignup.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';

abstract class VerifyCodeSignUpController extends GetxController{
  checkCode();
  goToSuccessSignUp(String verfiycode);
}
class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController{
  VerFiyCodeSignup VerFiyCodeData = VerFiyCodeSignup(Get.find());
  String? email;
  StatusRequest statusRequest=StatusRequest.onitnial;
  @override
  goToSuccessSignUp(String verfiycode)async {
    statusRequest =StatusRequest.loading;
    update();
    var response =await VerFiyCodeData.
    postData(email!,verfiycode);
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        Get.offAllNamed(AppRoute.successSignUp);
      }else{
        Get.defaultDialog(title:"Warning"
            ,middleText:"Verify code not correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  checkCode() async{
  }
  @override
  void onInit() {
    email= Get.arguments['email'];
    super.onInit();
  }
}