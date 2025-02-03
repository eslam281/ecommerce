import 'package:get/get.dart';

import '../../data/model/itemsmodel.dart';

abstract class ProductDetailsController extends GetxController{
  intialData();
  colorOnChange(int index);
}

class ProductDetailsControllerImp extends ProductDetailsController{
  late ItemsModel itemsModel;
  List subitems= [
    {"name":"Red","active":true},
    {"name":"Black","active":false},
    {"name":"Yellow","active":false},
   ];
  @override
  intialData(){
    itemsModel =Get.arguments['itemsmodel'];
  }
  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  colorOnChange(int index) {
    subitems[index]["active"]=
    subitems[index]["active"]?false:true;
    update();
  }

}