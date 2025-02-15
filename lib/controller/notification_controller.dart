import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/notification_data.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';

abstract class NotificationController extends GetxController{
  getData();
}
class NotificationControllerImp extends NotificationController{
  NotificationData notificationData = NotificationData(Get.find());
  late StatusRequest statusRequest =StatusRequest.onitnial ;
  MyServices myServices = Get.find();
  List data =[];

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData()async{
    data.clear();
    statusRequest =StatusRequest.loading;
    var response =await notificationData.getData(
      myServices.sharedPreferences.getString("id")!
    );
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        data.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  refreshOrder(){
    getData();
  }

}