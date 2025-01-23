import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/forgetpassword/verfiycode.dart';

abstract class VerifyCodeController extends GetxController{
  checkCode(String verfiycode);
  goToResetPassword();
}
class VerifyCodeControllerImp extends VerifyCodeController{

  VerFiyCode verFiyCodeData = VerFiyCode(Get.find());
  String? email;
  StatusRequest statusRequest=StatusRequest.onitnial;

  @override
  goToResetPassword() {
    Get.offAllNamed(AppRoute.resetPassword);
  }

  @override
  checkCode(String verfiycode)async {
    statusRequest =StatusRequest.loading;
    update();
    var response =await verFiyCodeData.
    postData(email!,verfiycode);
    statusRequest =handlingData(response);
    print(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        Get.offAllNamed(AppRoute.resetPassword,arguments:{
          "email":email
        });
      }else{
        Get.defaultDialog(title:"Warning"
            ,middleText:"Verify code not correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email=Get.arguments['email'];
    super.onInit();
  }
}