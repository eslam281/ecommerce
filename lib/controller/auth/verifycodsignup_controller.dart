import 'package:ecommercecourse/data/datasource/remote/auth/verfiycodesignup.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';

abstract class VerifyCodeSignUpController extends GetxController{
  goToSuccessSignUp(String verfiycode);
  checkCode();
  resend();
}
class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController{
  VerFiyCodeSignup verFiyCodeData = VerFiyCodeSignup(Get.find());
  String? email;
  StatusRequest statusRequest=StatusRequest.onitnial;

  @override
  void onInit() {
    email= Get.arguments['email'];
    super.onInit();
  }

  @override
  goToSuccessSignUp(String verfiycode)async {
    statusRequest =StatusRequest.loading;
    update();
    var response =await verFiyCodeData.
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
  resend() {
    var response =verFiyCodeData.resendData(email!);
  }


}