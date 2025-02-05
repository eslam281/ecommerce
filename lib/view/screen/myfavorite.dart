import 'package:ecommercecourse/view/widget/myfavorite/customlistfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/myfavorite_controller.dart';
import '../../core/class/handlingdataview.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return Scaffold(
      body:Container(padding:const EdgeInsets.symmetric(horizontal:10),
        child: GetBuilder<MyFavoriteControllerImp>(builder:(controller) =>
            ListView(children: [
              // CustomAppbar(titleAppbar: 'Find Product',onPressedIconFavorite:(){},
              //  onPressedSearch:(){},),
              const SizedBox(height: 10,),

              HandlingDataView(statusRequest: controller.statusRequest,
                  widget:
              GridView.builder(itemCount:controller.data.length,
                  physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:2,childAspectRatio:.7)
                  , itemBuilder: (context, index) {
                    return CustomListFavoriteItems(myFavoriteModel: controller.data[index]);
                  }
              )
              )
            ],),),),
    );
  }
}
