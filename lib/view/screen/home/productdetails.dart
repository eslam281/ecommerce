
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/translateDatabase.dart';
import 'package:ecommercecourse/view/widget/items/subitemslist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/productdetailscontroller.dart';
import '../../widget/items/toppageproductdetails.dart';
import '../../widget/productdetails/price_count.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(ProductDetailsControllerImp());
    return Scaffold(
          bottomNavigationBar:Container(margin:const EdgeInsets.symmetric(horizontal:10,vertical:10),
            height:60,child:MaterialButton(onPressed:(){Get.toNamed(AppRoute.cart);},
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(15) ),color:AppColor.primaryColor,
          child:const Text("Go To Cart",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,
          color:Colors.white),),),),

          body:GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) {
              return HandlingDataView(
                statusRequest:controller.cartController.statusRequest,
                widget: ListView(children: [
                  const TopPageProductDetails(),

                  const SizedBox(height: 100,),

                  Container(
                    padding:const EdgeInsets.all(20),
                    child:Column(crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                    Text("${translateDatabase(controller.itemsModel.itemsNameAr
                        ,controller.itemsModel.itemsName)}",
                      style:Theme.of(context).textTheme.headlineLarge?.copyWith(color:AppColor.secondColor3),),

                        const SizedBox(height: 10,),

                        PriceCount(price:controller.itemsModel.itemsPrice!,
                          count: "${controller.countitems}",
                          onAdd:(){controller.add();},
                          onRemove:(){controller.remove();},),

                        const SizedBox(height: 10,),

                        Text("${translateDatabase(controller.itemsModel.itemsDescAr
                        ,controller.itemsModel.itemsDesc)}",
                      style:Theme.of(context).textTheme.bodyLarge?.
                      copyWith(color:AppColor.black,fontSize: 18),),

                        const SizedBox(height: 20,),

                        Text("Color", style:Theme.of(context).textTheme.headlineLarge?.
                        copyWith(color:AppColor.secondColor3),),

                        const SizedBox(height: 8,),

                        const SubItemsList()
                      ],),)
                      ],),
              );
            }
          ),

    );
  }
}
