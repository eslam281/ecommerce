import 'package:ecommercecourse/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 70),
      height: 40,
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: MaterialButton(
        onPressed: () {
          controller.next();
        },
        padding:
        const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: const Text(
          "Continue",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
