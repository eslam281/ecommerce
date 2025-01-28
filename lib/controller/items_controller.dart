import 'package:ecommercecourse/data/datasource/remote/items_data.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdata.dart';

abstract class ItemsController extends GetxController{
  intialData();
  changeCat(int val);
  getItems(String id);
  goToPageProductDetails(ItemsModel itemsmodel);
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
    getItems(selectedCat.toString());
  }

  @override
  void onInit() {
    intialData();

    super.onInit();
  }

  @override
  changeCat(int val) {
    selectedCat =val;
    getItems(val.toString());
    update();
  }

  @override
  getItems(id) async{
    data.clear();
    statusRequest =StatusRequest.loading;
    var response =await testData.getData(id);
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

  @override
  goToPageProductDetails(ItemsModel itemsmodel) {
    Get.toNamed(AppRoute.productdetails,arguments: {'itemsmodel':itemsmodel});
  }
}