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

}