import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/core/constant/linkapi.dart';

class VerFiyCodeSignup{

  Crud crud;

  VerFiyCodeSignup(this.crud);

  postData(String email,String verifycode,)async{
    var response =
    await crud.postData(AppLink.verfiycode, {
      "email":email,
      "verfiycode":verifycode,
    });
    return response.fold((l) => l, (r) => r,);
  }
  resendData(String email)async{
    var response =
    await crud.postData(AppLink.resend, {"email":email,});
    return response.fold((l) => l, (r) => r,);
  }
}