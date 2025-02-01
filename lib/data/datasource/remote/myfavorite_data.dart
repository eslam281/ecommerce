import '../../../core/class/crud.dart';
import '../../../core/constant/linkapi.dart';

class MyFavoriteData {

  Crud crud;

  MyFavoriteData(this.crud);

  getData(String userid)async{
    var response =
    await crud.postData(AppLink.favorite_view, {"userid":userid});
    return response.fold((l) => l, (r) => r,);
  }
  deleteData(String favoriteid)async{
    var response =
    await crud.postData(AppLink.deletefromfavorite, {"favorite_id":favoriteid});
    return response.fold((l) => l, (r) => r,);
  }

}