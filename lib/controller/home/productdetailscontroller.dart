import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../data/model/itemsmodel.dart';

abstract class ProductDetailsController extends GetxController{
  intialData();
  colorOnChange(int index);
}

class ProductDetailsControllerImp extends ProductDetailsController{

  CartControllerImp cartController =Get.put(CartControllerImp());
  StatusRequest statusRequest=StatusRequest.onitnial ;
  int countitems =0;

  late ItemsModel itemsModel;
  List subitems= [
    {"name":"Red","active":true},
    {"name":"Black","active":false},
    {"name":"Yellow","active":false},
   ];
  @override
  intialData()async{
    statusRequest=StatusRequest.loading ;
    itemsModel =Get.arguments['itemsmodel'];
    countitems= await cartController.getCountItems(itemsModel.itemsId.toString());
    statusRequest=StatusRequest.success ;
    update();
  }
  @override
  void onInit() {
    intialData();
    super.onInit();
  }
  add(){
    countitems++;
    cartController.add(itemsModel.itemsId.toString());
    update();
  }

  remove(){
    if(countitems>0) {
      countitems--;
      cartController.remove(itemsModel.itemsId.toString());
      update();
    }
  }

  @override
  colorOnChange(int index) {
    subitems[index]["active"]=
    subitems[index]["active"]?false:true;
    update();
  }

}