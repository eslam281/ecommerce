import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/functions/handlingdata.dart';
import '../data/datasource/remote/offers_data.dart';

class OffersController extends GetxController{

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
        List responselist =response['data'];
        data.addAll(responselist.map((e) => ItemsModel.fromJson(e),));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  goToPageProductDetails(ItemsModel itemsmodel) {
    Get.toNamed(AppRoute.productdetails,arguments: {'itemsmodel':itemsmodel});
  }
}