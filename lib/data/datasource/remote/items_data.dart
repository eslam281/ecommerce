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
  addFavorite(String itemsId,String userid)async{
    var response =
    await crud.postData(AppLink.favorite_add, {"itemsid":itemsId,"userid":userid});
    return response.fold((l) => l, (r) => r,);
  }
  removeFavorite(String itemsId,String userid)async{
    var response =
    await crud.postData(AppLink.favorite_remove, {"itemsid":itemsId,"userid":userid});
    return response.fold((l) => l, (r) => r,);
  }
}