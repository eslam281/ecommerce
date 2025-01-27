import 'package:get/get.dart';

abstract class ItemsController extends GetxController{
  intialData();
  changeCat(int val);
}

class ItemsControllerImp extends ItemsController{

  List categories=[];
  int? selectedCat;
  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  changeCat(int val) {
    selectedCat =val;
  }
}