import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/core/constant/linkapi.dart';

class AddressData{

  Crud crud;

  AddressData(this.crud);

  getData(String userid)async{
    var response =
    await crud.postData(AppLink.address_view, {
      "address_usersid" :  userid
    });
    return response.fold((l) => l, (r) => r,);
  }
  addData(Map<String,dynamic> data)async{
    var response =
    await crud.postData(AppLink.address_add, {
      "userid" :  data["userid"] ,
      "name"    :  data["name"] ,
      "city"    :  data["city"],
      "street"  :  data["street"],
    });
    return response.fold((l) => l, (r) => r,);
  }
  removeData(String addressid)async{
    var response =
    await crud.postData(AppLink.address_remove, {
      "addressid" : addressid
    });
    return response.fold((l) => l, (r) => r,);
  }
}