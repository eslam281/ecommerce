import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../controller/home/productdetailscontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/linkapi.dart';

class TopPageProductDetails extends GetView<ProductDetailsControllerImp> {
  const TopPageProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior:Clip.none,
      children: [
        Container(height: 200,decoration:const BoxDecoration(color:AppColor.grey,
            borderRadius:BorderRadius.vertical(bottom:Radius.circular(20))),),

        Positioned(top:50,right:Get.width/8,left:Get.width/8,
          child:
          Hero(tag:"${controller.itemsModel.itemsId}",
            child: CachedNetworkImage(
                imageUrl:"${AppLink.imageItems}${controller.itemsModel.itemsImage}"
                ,height: 250,fit:BoxFit.fill),
          ),
        ),
      ],);
  }
}
