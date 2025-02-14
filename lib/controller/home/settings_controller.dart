import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController{
  logout();
}
class SettingsControllerImp extends SettingsController{
  MyServices myServices = Get.find();

  @override
  logout() {
    String? id =myServices.sharedPreferences.getString("id");
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$id");

    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.lang);
  }

}