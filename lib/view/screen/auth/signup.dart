import 'package:ecommercecourse/controller/auth/signup_controller.dart';
import 'package:ecommercecourse/core/functions/validinput.dart';
import 'package:ecommercecourse/view/widget/auth/custombuttomauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtexttittleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Sign Up",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.grey),
          ),
        ),
        body: GetBuilder<SignUpControllerImp>(
          builder: (controller) =>
          (HandlingDataRequest(statusRequest: controller.statusRequest,
            widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                  child: PopScope(
                    onPopInvoked: (val) {
                      alertExitApp();
                    },
                    canPop: false,
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          const CustomTextTittleAuth(
                            text: "Welcome",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const CustomTextBodyAuth(text: "5"),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormAuth(
                              type: TextInputType.name,
                              mycontroller: controller.username,
                              label: "UserName",
                              hintText: "Enter Your UserName",
                              suffixIcon: const Icon(Icons.person_2_outlined),
                              valid: (val) {
                                return validInput(val, 5, 30, "username");
                              }),
                          CustomTextFormAuth(
                              type: TextInputType.emailAddress,
                              mycontroller: controller.email,
                              label: "Email",
                              hintText: "Enter Your Email",
                              suffixIcon: const Icon(Icons.email_outlined),
                              valid: (val) {
                                return validInput(val, 5, 100, "email");
                              }),
                          CustomTextFormAuth(
                              type: TextInputType.phone,
                              mycontroller: controller.phone,
                              label: "Phone",
                              hintText: "Enter Your Phone",
                              suffixIcon: const Icon(Icons.phone_android),
                              valid: (val) {
                                return validInput(val, 11, 11, "phone");
                              }),
                          CustomTextFormAuth(
                              obscureText: controller.isshowpassword,
                              onTap: () {
                                controller.showPassword();
                              },
                              type: TextInputType.text,
                              mycontroller: controller.password,
                              label: "Password",
                              hintText: "Enter Your Password",
                              suffixIcon: const Icon(Icons.lock_outline),
                              valid: (val) {
                                return validInput(val, 6, 30, "password");
                              }),
                          CustomTextFormAuth(
                            obscureText: controller.isshowpassword,
                            onTap: () {
                              controller.showPassword();
                            },
                            type: TextInputType.text,
                            mycontroller: controller.confirmPassword,
                            label: "Confirm Password",
                            hintText: "Enter Your Confirm Password",
                            suffixIcon:
                                const Icon(Icons.confirmation_num_outlined),
                            valid: (val) {
                              if (controller.confirmPassword.text !=
                                  controller.password.text) {
                                return "not match the password";
                              }
                              return validInput(val, 6, 30, "password");
                            },
                          ),
                          InkWell(
                            onTap: () {
                              controller.goToForgetPassword();
                            },
                            child: Text(
                              "Forget Pasword",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontSize: 17),
                            ),
                          ),
                          CustomButtomAuth(
                              onPressed: () {
                                controller.signUp();
                              },
                              text: "Sing Up"),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextSing(
                              text: "have an account ? ",
                              textTwo: " Sign In",
                              onTap: () {
                                controller.goToSignIn();
                              })
                        ],
                      ),
                    ),
                  ),
                ),
        ))));
  }
}
