import 'package:ecommercecourse/controller/onboarding_controller.dart';
import 'package:ecommercecourse/view/widget/onboarding/custombutton.dart';
import 'package:ecommercecourse/view/widget/onboarding/customslider.dart';
import 'package:ecommercecourse/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(flex: 3, child: CustomSliderOnBoarding()),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                CustomDotControllerOnBoarding(),
                Spacer(
                  flex: 2,
                ),
                CustomButtonOnBoarding()
              ],
            ))
        ],
      ),
    ));
  }
}
