import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/core/constant/linkapi.dart';

class ItemsData{

  Crud crud;

  ItemsData(this.crud);

  getData(String id,String userid)async{
    var response =
    await crud.postData(AppLink.items, {"id":id,"userid":userid});
    return response.fold((l) => l, (r) => r,);
  }

}