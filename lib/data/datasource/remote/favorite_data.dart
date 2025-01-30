import '../../../core/class/crud.dart';
import '../../../core/constant/linkapi.dart';

class FavoriteData {

  Crud crud;

  FavoriteData(this.crud);
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