import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/data/datasource/remote/orders/pending_data.dart';
import 'package:ecommercecourse/data/model/ordersmodel.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';


abstract class PendingController extends GetxController{
  getData();

}
class PendingControllerImp extends PendingController{

  OrdersPendingData testData = OrdersPendingData(Get.find());
  List<OrdersModel> data =[];
  StatusRequest statusRequest =StatusRequest.onitnial ;
  MyServices myServices = Get.find();


  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData()async{
    data.clear();
    statusRequest =StatusRequest.loading;
    var response =await testData.getData(
        myServices.sharedPreferences.getString("id")!);
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        List responedata = response['data'];
        data.addAll(responedata.map((e) => OrdersModel.fromJson(e),));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}