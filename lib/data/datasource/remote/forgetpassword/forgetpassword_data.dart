import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/core/constant/linkapi.dart';

class ForgetPasswordData{

  Crud crud;

  ForgetPasswordData(this.crud);

  postData(String email)async{
    var response =
    await crud.postData(AppLink.forgetpassword, {"email":email,});

    return response.fold((l) => l, (r) => r,);
  }
}