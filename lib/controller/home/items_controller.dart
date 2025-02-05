import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/items_data.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';
import 'home_controller.dart';


abstract class ItemsController extends SearchMixController{
  intialData();
  changeCat(int val);
  getItems(String categoryId);
  goToPageProductDetails(ItemsModel itemsmodel);
  // addFavorite(String itemsId,String categoryId);
  // removeFavorite(String itemsId,String categoryId);
}

class ItemsControllerImp extends ItemsController{

  List categories=[];
  int? selectedCat;
  ItemsData itemsData = ItemsData(Get.find());
  List data =[];
  @override
  late StatusRequest statusRequest ;
  MyServices myServices = Get.find();

  @override
  intialData() {
    listData.clear();
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
  getItems(categoryId) async{
    data.clear();
    statusRequest =StatusRequest.loading;
    var response =await itemsData.getData(categoryId,myServices.sharedPreferences.getString("id")!);
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