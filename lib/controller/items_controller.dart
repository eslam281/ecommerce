import 'package:ecommercecourse/data/datasource/remote/items_data.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';

abstract class ItemsController extends GetxController{
  intialData();
  changeCat(int val);
  getItems();
}

class ItemsControllerImp extends ItemsController{

  List categories=[];
  int? selectedCat;
  ItemsData testData = ItemsData(Get.find());
  List data =[];
  late StatusRequest statusRequest ;

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
  }

  @override
  void onInit() {
    intialData();
    getItems();
    super.onInit();
  }

  @override
  changeCat(int val) {
    selectedCat =val;
    update();
  }

  @override
  getItems() async{
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