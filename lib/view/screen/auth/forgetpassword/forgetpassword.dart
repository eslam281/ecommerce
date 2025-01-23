import 'package:ecommercecourse/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:ecommercecourse/view/widget/auth/custombuttomauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtexttittleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/handlingdataview.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/customtextformauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Forget Password",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.grey),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) =>
    HandlingDataRequest(statusRequest: controller.statusRequest,
    widget: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                const CustomTextTittleAuth(
                  text: "Check Email",
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomTextBodyAuth(text: "5"),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormAuth(
                    type: TextInputType.emailAddress,
                    mycontroller: controller.email,
                    label: "Email",
                    hintText: "Enter Your Email",
                    suffixIcon: const Icon(Icons.email_outlined),
                    valid: (val) {
                      return validInput(val, 5, 30, "email");
                    }),
                CustomButtomAuth(
                    onPressed: () {
                      controller.checkEmail();
                    },
                    text: "Check"),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
