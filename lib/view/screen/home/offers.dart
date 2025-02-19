import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/offers_controller.dart';
import '../../widget/customitemsoffers.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    FavoriteControllerImp controllerF = Get.put(FavoriteControllerImp());
    return Scaffold(
      appBar:AppBar(title:const Text('Offers'),
      automaticallyImplyLeading: false,
      leading:MaterialButton(onPressed:(){Get.offAllNamed(AppRoute.home);},
      child:const Icon(Icons.arrow_back),),),
      body: Container(
        padding:const EdgeInsets.all(20),
        child:GetBuilder<OffersController>(builder:
        (controller) => HandlingDataView(
            statusRequest:controller.statusRequest,
            widget: ListView.builder(itemCount:controller.data.length,
              itemBuilder: (context, index) {
                controllerF.setFavorite(controller.data[index].itemsId,
                    controller.data[index].favorite);
                return  Column(
                  children: [
                    CustomItemsOffers(itemsModel: controller.data[index]),
                    const SizedBox(height: 20,),
                  ],
                );})),) ,
      ),
    );
  }
}
