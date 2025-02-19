import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/data/datasource/remote/orders/archive_data.dart';
import 'package:ecommercecourse/data/model/ordersmodel.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';


abstract class ArchiveController extends GetxController{
  getData();
  String printOrderType(int val);
  String printPaymentMethod(int val);
  submitRating(String orderid,double rating ,String comment);
}
class ArchiveControllerImp extends ArchiveController{

  OrdersArchiveData orderData = OrdersArchiveData(Get.find());
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
    var response =await orderData.getData(
        myServices.sharedPreferences.getString("id")!);
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        List responedata = response['data'];
        data.addAll(responedata.map((e) => OrdersModel.fromJson(e),));
        data =data.reversed.toList();
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  @override
  String printOrderType(int val) {
    return (val == 0)? "delivery": "Recive";
  }

  @override
  String printPaymentMethod(int val) {
    return (val == 0)? "Cash On Delivery": "Payment Card";
  }

  @override
  submitRating(String orderid,rating ,String comment)async{
    statusRequest =StatusRequest.loading;
    var response =await orderData.rating(orderid,comment,rating.toString());
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
       getData();
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}