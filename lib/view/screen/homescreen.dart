import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/Homescreencontroller.dart';
import '../widget/home/custombottomappbarhome.dart';
import '../widget/home/custombuttonappbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) {
        return Scaffold(
          floatingActionButton:FloatingActionButton(onPressed: (){},
            backgroundColor:AppColor.primaryColor ,
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(25) ),elevation: 7,
          child: const Icon(Icons.shopping_basket_outlined),),
          floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,

          bottomNavigationBar:const CustomBottomAppBarHome(),
          body: controller.listpage.elementAt(controller.currentpage),
        );
      }
    );
  }
}
