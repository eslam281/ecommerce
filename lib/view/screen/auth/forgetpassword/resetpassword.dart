import 'package:ecommercecourse/view/widget/auth/custombuttomauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtexttittleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/resetPassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/customtextformauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Reset password",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.grey),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) =>
    HandlingDataRequest(statusRequest: controller.statusRequest,
    widget: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children:  [
                const CustomTextTittleAuth(text: "New Password",),
                const SizedBox(
                  height: 10,
                ),
                const CustomTextBodyAuth(text: "Please Enter new Password"),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormAuth(
                    type:TextInputType.text,
                     mycontroller:controller.password,
                    label: "Password",
                    hintText: "Enter Your Password",
                    suffixIcon: const Icon(Icons.lock_outline),
                    valid:(val) {
                      return validInput(val, 6, 30, "password");
                    }),
                CustomTextFormAuth(
                    type:TextInputType.text,
                    mycontroller:controller.confirmPassword,
                    label: "Confirm Password",
                    hintText: "Enter Your Password",
                    suffixIcon: const Icon(Icons.confirmation_num_outlined),
                    valid:(val) {
                      if(controller.confirmPassword.text != controller.password.text){
                        return "not match the password";
                      }
                      return validInput(val, 6, 30, "password");
                    }),
                CustomButtomAuth(onPressed: (){controller.checkCode();}, text: "Save"),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
