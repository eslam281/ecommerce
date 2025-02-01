import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtexttittleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../controller/auth/verifycodsignup_controller.dart';
import '../../../core/class/handlingdataview.dart';

class VerFiyCodeSignUp extends StatelessWidget {
  const VerFiyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Verification Code",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.grey),
        ),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(builder: (controller) =>
    HandlingDataRequest(statusRequest: controller.statusRequest,
    widget: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
          child: ListView(
            children:  [
              const CustomTextTittleAuth(text: "Check code",),
              const SizedBox(
                height: 10,
              ),
              CustomTextBodyAuth(text: "Please Enter The Digit Code sent to ${controller.email}"),
              const SizedBox(
                height: 15,
              ),
              OtpTextField(
                numberOfFields: 5,
                fieldWidth: 50,borderRadius: BorderRadius.circular(20),
                borderColor:  const Color(0xFF02F30E),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode){
                  controller.goToSuccessSignUp(verificationCode);
                }, // end onSubmit
              ),
              const SizedBox(height: 30,),
              InkWell(onTap:(){controller.resend();},
                  child:const Center(child:Text("Resend verify code",
                style:TextStyle(fontSize:22,color:AppColor.primaryColor),),))
            ],
          ),
        ),
      )),
    );
  }
}
