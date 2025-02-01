import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/home/Listcategorieshome.dart';
import '../widget/customAppbar.dart';
import '../widget/home/customcardhome.dart';
import '../widget/home/customtitlehome.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {

    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
        builder: (controller) {
          return HandlingDataView(statusRequest: controller.statusRequest,
            widget: Container(margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: ListView(children: [

                CustomAppbar(titleAppbar: 'Find Product',onPressedIconFavorite:(){
                  Get.toNamed(AppRoute.myfavroite);
                },
                  onPressedIcon:(){},onPressedSearch:(){},),

                const SizedBox(height: 10,),

                const CustomCardHome(title:"A summer surprise",body:"Cashback 20%",),

                const CustomTitleHome(title: "Categories",),
                ListCategoriesHome(controller: controller,),

                const CustomTitleHome(title: "Product for you",) ,
                const ListItemsHome(),

              ],),
            ),
          );
        }
      );
  }
}
