import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/productdetailscontroller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/translateDatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/linkapi.dart';
import '../widget/productdetails/price_count.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar:Container(margin:const EdgeInsets.symmetric(horizontal:10,vertical:10),
        height:60,child:MaterialButton(onPressed:(){},
        shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(15) ),color:AppColor.primaryColor,
      child:const Text("Add To Cart",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,
      color:Colors.white),),),),
      body:ListView(children: [
      Stack(clipBehavior:Clip.none,
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
      ],),
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
              count: 2,onAdd:(){},onRemove:(){},),
              const SizedBox(height: 10,),

              Text("${translateDatabase(controller.itemsModel.itemsDescAr
              ,controller.itemsModel.itemsDesc)}",
            style:Theme.of(context).textTheme.bodyLarge?.copyWith(color:AppColor.black,fontSize: 18),),

              const SizedBox(height: 20,),
              Text("Color", style:Theme.of(context).textTheme.headlineLarge?.
              copyWith(color:AppColor.secondColor3),),
              const SizedBox(height: 8,),

              Row(children: [
                Container(height:60,width:90,margin:const EdgeInsets.only(right:10),
                  alignment:Alignment.center,padding:const EdgeInsets.only(bottom:5),
                  decoration:BoxDecoration(border:Border.all(color: AppColor.secondColor3)
                  ,borderRadius: BorderRadius.circular(10),color:AppColor.secondColor3),
                child: const Text("Red",style:TextStyle(fontWeight:FontWeight.bold
                    ,color:Colors.white),),),

                Container(height:60,width:90,margin:const EdgeInsets.only(right:10),
                  alignment:Alignment.center,padding:const EdgeInsets.only(bottom:5),
                  decoration:BoxDecoration(border:Border.all(color: AppColor.secondColor3)
                  ,borderRadius: BorderRadius.circular(10),color:Colors.white),
                child: const Text("Black",style:TextStyle(fontWeight:FontWeight.bold
                    ,color:AppColor.secondColor3),),),

                Container(height:60,width:90,margin:const EdgeInsets.only(right:10),
                  alignment:Alignment.center,padding:const EdgeInsets.only(bottom:5),
                  decoration:BoxDecoration(border:Border.all(color: AppColor.secondColor3)
                  ,borderRadius: BorderRadius.circular(10),color:Colors.white),
                child: const Text("Black",style:TextStyle(fontWeight:FontWeight.bold
                    ,color:AppColor.secondColor3),),),

              ],)
            ],),)
            ],),
    );
  }
}
