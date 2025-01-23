import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/core/constant/linkapi.dart';

class Signup{

  Crud crud;

  Signup(this.crud);

  postData(String username,String password,String email,String phone,)async{
    var response =
    await crud.postData(AppLink.signup, {
      "username":username,
      "password":password,
      "email":email,
      "phone":phone,
    });
    return response.fold((l) => l, (r) => r,);
  }
}