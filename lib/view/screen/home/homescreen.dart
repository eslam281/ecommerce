import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/home/Homescreencontroller.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../widget/home/custombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) {
        return Scaffold(
          floatingActionButton:FloatingActionButton(onPressed:(){Get.toNamed(AppRoute.cart);},
            backgroundColor:AppColor.primaryColor ,
            shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(25) ),elevation: 7,
          child: const Icon(Icons.shopping_basket_outlined),),
          floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,

          bottomNavigationBar:const CustomBottomAppBarHome(),
          body:PopScope(
            onPopInvokedWithResult:(bool, dynamic){
                alertExitApp();
            },
        canPop: false,
        child: controller.listpage.elementAt(controller.currentpage),
          )
        );
      }
    );
  }
}
