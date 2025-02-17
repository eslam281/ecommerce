import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/core/constant/linkapi.dart';

class OrdersPendingData{

  Crud crud;

  OrdersPendingData(this.crud);

  getData(String userid)async{
    var response =
    await crud.postData(AppLink.pending, {"userid":userid});
    return response.fold((l) => l, (r) => r,);
  }
  deleteData(String orderid)async{
    var response =
    await crud.postData(AppLink.ordersdelete, {"orderid":orderid});
    return response.fold((l) => l, (r) => r,);
  }
}