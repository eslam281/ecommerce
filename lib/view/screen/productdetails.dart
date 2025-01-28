import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/productdetailscontroller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/linkapi.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
    return Scaffold(
      body:Container(child:ListView(children: [
        Stack(children: [
          Container(height: 200,decoration:const BoxDecoration(color:AppColor.primaryColor,
          borderRadius:BorderRadius.vertical(bottom:Radius.circular(20))),),
          CachedNetworkImage(imageUrl:"${AppLink.imageItems}${controller.itemsModel.itemsImage}"
              ,height: 110,width: 190,fit:BoxFit.fill),
        ],)

      ],),),
    );
  }
}
