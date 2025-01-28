import 'package:get/get.dart';

import '../data/model/itemsmodel.dart';

abstract class ProductDetailsController extends GetxController{
  intialData();
}

class ProductDetailsControllerImp extends ProductDetailsController{
  late ItemsModel itemsModel;
  @override
  intialData(){
    itemsModel =Get.arguments['itemsmodel'];
  }
  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}