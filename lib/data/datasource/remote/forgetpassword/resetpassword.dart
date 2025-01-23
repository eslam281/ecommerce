import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/core/constant/linkapi.dart';

class ResetPassword{

  Crud crud;

  ResetPassword(this.crud);

  postData(String email,String password,)async{
    var response =
    await crud.postData(AppLink.resetpassword, {
      "email":email,
      "password":password,
    });
    return response.fold((l) => l, (r) => r,);
  }
}