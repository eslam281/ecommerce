import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/successsignup_controller.dart';
import '../../widget/auth/custombuttomauth.dart';

class SuccessSinUp extends StatelessWidget {
  const SuccessSinUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller=
    Get.put(SuccessSignUpControllerImp());
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Success",
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
          const Spacer(),
          SizedBox(width:double.infinity,
              child: CustomButtomAuth(onPressed: (){controller.goToPageLogin();}, text: "Sing In")),
        ],
      ),
    );
  }
}
