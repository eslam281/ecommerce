import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/Homescreencontroller.dart';
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

          bottomNavigationBar: BottomAppBar(
            shape:const CircularNotchedRectangle(),
            notchMargin:10,
            child: Row(children: [
              Row(children: [
                 CustomButtonAppbar(icon: Icons.home,textbutton:"Home",
                   colorItemSelected:AppColor.primaryColor ,
                onPressed:(){controller.changePage(0);} ,),

                CustomButtonAppbar(icon: Icons.home,textbutton:"Home",
                   colorItemSelected:Colors.black ,
                onPressed:(){controller.changePage(1);} ,),
              ],),
            const Spacer(),
            Row(children: [
              CustomButtonAppbar(icon: Icons.home,textbutton:"Home",
                colorItemSelected:Colors.black ,
                onPressed:(){controller.changePage(1);} ,),

              CustomButtonAppbar(icon: Icons.home,textbutton:"Home",
                colorItemSelected:Colors.black ,
                onPressed:(){controller.changePage(1);} ,),
              ],)
            ],
          ),),
          body: controller.listpage.elementAt(controller.currentpage),
        );
      }
    );
  }
}
