import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/core/constant/linkapi.dart';

class NotificationData{

  Crud crud;

  NotificationData(this.crud);

  getData(String userid)async{
    var response =
    await crud.postData(AppLink.notification, {"userid":userid});
    return response.fold((l) => l, (r) => r,);
  }
}