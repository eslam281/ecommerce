import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/data/datasource/remote/test_data.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdata.dart';
import '../data/datasource/remote/offers_data.dart';

class TestController extends GetxController{

  OffersData testData = OffersData(Get.find());
  List<ItemsModel> data =[];
  late StatusRequest statusRequest ;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData()async{
    statusRequest =StatusRequest.loading;
    var response =await testData.getData();
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
}