import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:get/get.dart';

abstract class CheckoutController extends GetxController{

}
class CheckoutControllerImp extends CheckoutController{
  StatusRequest statusRequest =StatusRequest.onitnial;

  String? paymentMethod;
  String? deliveryType;
  String? addressId;

  choosePaymentMethod(String val){
    paymentMethod= val;
    update();
  }
  chooseDeliveryType(String val){
    deliveryType= val;
    update();
  }
  chooseShippingAddress(String val){
    addressId= val;
    update();
  }
}