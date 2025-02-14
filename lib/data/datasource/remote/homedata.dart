import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/core/constant/linkapi.dart';

class HomeData{

  Crud crud;

  HomeData(this.crud);

  getData()async{
    var response =
    await crud.postData(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r,);
  }
  search(String search)async{
    var response =
    await crud.postData(AppLink.search, {"search":search});
    return response.fold((l) => l, (r) => r,);
  }
  accessToken(String accesstoken)async{
    var response =
    await crud.postData(AppLink.test, {"accesstoken":accesstoken});
    return response.fold((l) => l, (r) => r,);
  }
}