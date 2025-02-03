import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/home/home_controller.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/linkapi.dart';

class ListItemsHome extends StatelessWidget {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height:110,
      child: GetBuilder<HomeControllerImp>(
        builder: (controller) {
          return ListView.builder(itemCount:controller.items.length,
            scrollDirection:Axis.horizontal,
            itemBuilder: (context, i) {
              var current=controller.items[i];
              return Items(itemsModel:ItemsModel.fromJson(current),);
            },);
        }
      ),);
  }
}
class Items extends StatelessWidget {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child:CachedNetworkImage(imageUrl:"${AppLink.imageItems}${itemsModel.itemsImage}"
            ,height: 100,width: 150,fit:BoxFit.fill),),
      Container(height: 120,width: 180,decoration: BoxDecoration(
        color:Colors.black.withValues(alpha:0.3),
        borderRadius:BorderRadius.circular(30),
      ),),
      Positioned(child: Text("${itemsModel.itemsName}",style: const TextStyle(
          color:AppColor.primaryColor,fontWeight:FontWeight.bold,fontSize:17
      ),))
    ],);
  }
}

