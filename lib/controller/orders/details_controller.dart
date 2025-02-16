import 'package:ecommercecourse/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersDetailsController extends GetxController{
 late OrdersModel ordersModel;

  @override
  void onInit() {
    ordersModel = Get.arguments["ordersmodel"];
    super.onInit();
  }
}