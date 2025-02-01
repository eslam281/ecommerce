import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/view/widget/customAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/items_controller.dart';
import '../../core/constant/routes.dart';
import '../widget/items/customlistitems.dart';
import '../widget/items/listcategoriesitems.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteControllerImp controllerF = Get.put(FavoriteControllerImp());
    return Scaffold(
      body:Container(
        padding: const EdgeInsets.all(15),
        child:GetBuilder<ItemsControllerImp>(builder:(controller) =>
          ListView(children: [
            CustomAppbar(titleAppbar: 'Find Product',onPressedIconFavorite:(){
              Get.toNamed(AppRoute.myfavroite);
            },
              onPressedIcon:(){},onPressedSearch:(){},),
            const SizedBox(height: 10,),
            const ListCategoriesItems(),
          HandlingDataView(statusRequest: controller.statusRequest, widget:

          GridView.builder(itemCount:controller.data.length,
              physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,childAspectRatio:.7)
              , itemBuilder: (context, index) {

               controllerF.setFavorite(controller.data[index]["items_id"],
                   controller.data[index]["favorite"]);

                return CustomListItems(itemsModel:
                ItemsModel.fromJson(controller.data[index]));
              }
          )
          )
          ],),),
      ),
    );
  }
}
