import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/favorite_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/routes.dart';
import '../../data/model/itemsmodel.dart';
import '../widget/customAppbar.dart';
import '../widget/items/customlistitems.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp());
    return Scaffold(
      body:Container(padding:const EdgeInsets.symmetric(horizontal:10),
        child: GetBuilder<FavoriteControllerImp>(builder:(controller) =>
            ListView(children: [
              CustomAppbar(titleAppbar: 'Find Product',onPressedIconFavorite:(){},
                onPressedIcon:(){},onPressedSearch:(){},),
              const SizedBox(height: 10,),
              HandlingDataView(statusRequest: controller.statusRequest, widget:

              GridView.builder(itemCount:controller.data.length,
                  physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:2,childAspectRatio:.7)
                  , itemBuilder: (context, index) {


                     // controller.setFavorite(controller.data[index]["items_id"], controller.data[index]["favorite"]);
                    return CustomListItems(itemsModel:ItemsModel.fromJson(controller.data[index]));
                  }
              )
              )
            ],),),),
    );
  }
}
