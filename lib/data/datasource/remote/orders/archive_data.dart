import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/core/constant/linkapi.dart';

class OrdersArchiveData{

  Crud crud;

  OrdersArchiveData(this.crud);

  getData(String userid)async{
    var response =
    await crud.postData(AppLink.archive, {"userid":userid});
    return response.fold((l) => l, (r) => r,);
  }
  rating(String orderid,String comment,String rating)async{
    var response =
    await crud.postData(AppLink.rating,
        {"orderid":orderid,"comment":comment,"rating":rating});
    return response.fold((l) => l, (r) => r,);
  }

}