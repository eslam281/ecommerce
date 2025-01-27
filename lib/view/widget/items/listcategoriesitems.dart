import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(height: 100,padding:const EdgeInsets.only(left: 15),

      child: ListView.separated(
          separatorBuilder: (context, index) =>
          const SizedBox(width: 30,),
          scrollDirection:Axis.horizontal,
          itemCount: controller.categories.length,

          itemBuilder:(context, i) {
            var current=controller.categories[i];
            return Categories(index:i,
                categoriesModel:CategoriesModel.fromJson(current));
          }
      ),);
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int index;
  const Categories({super.key,required this.index,  required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){controller.changeCat(categoriesModel.categoriesId);},
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding:const EdgeInsets.only(right: 10,left: 10,bottom:7),
              decoration:index==controller.selectedCat!-1 ?
              const BoxDecoration(
                border:Border(bottom:BorderSide(width:3,color:Colors.red)),
              ):null,
              child: Text("${categoriesModel.categoriesName}",
                style:const TextStyle(fontSize:20,color:AppColor.grey2),))
            ,)
        ],),
    );
  }
}

