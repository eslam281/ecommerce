import 'package:ecommercecourse/data/model/myfavoritemodel.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/myfavorite_data.dart';

abstract class MyFavoriteController extends GetxController{
  getFavoriteItems();
  deletefromfavorite(String favoriteid);
}

class MyFavoriteControllerImp extends MyFavoriteController{
  Map isFavorite = {};
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());
  List<MyFavoriteModel> data =[];
  StatusRequest statusRequest=StatusRequest.onitnial ;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    getFavoriteItems();
    super.onInit();
  }

  @override
  getFavoriteItems() async{
    data.clear();
    statusRequest =StatusRequest.loading;
    var response =await favoriteData.getData(myServices.sharedPreferences.getString("id")!);
    statusRequest =handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status']=="success"){
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e),));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  deletefromfavorite(String favoriteid) {
    favoriteData.deleteData(favoriteid);
    data.removeWhere((element) => element.favoriteId.toString()==favoriteid);

    update();
  }
}