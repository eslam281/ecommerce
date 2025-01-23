import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../controller/forgetpassword/successresetpassword_controller.dart';
import '../../../widget/auth/custombuttomauth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller=
    Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Success Reset Password",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.grey),
        ),
      ),
      body:Column(
        children: [
          const Center(
            child:Icon(Icons.check_circle,color:Colors.green,size:250,),
          ),
          Text("...........",style:Theme.of(context).textTheme.headlineMedium,),
          Text("...........",style:Theme.of(context).textTheme.bodyMedium,),
          const SizedBox(height:30),
          SizedBox(width:double.infinity,
              child: CustomButtomAuth(onPressed: (){controller.goToPageLogin();}, text: "Sing In")),
        ],
      ),
    );
  }
}
