import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/linkapi.dart';

class ListCategoriesHome extends StatelessWidget {
  final  HomeControllerImp controller;
  const ListCategoriesHome({super.key, required this.controller});

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
            return Categories(categoriesModel:CategoriesModel.fromJson(current));
          }
      ),);
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  const Categories({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){controller.goToItems(controller.categories,categoriesModel.categoriesId);},
      child: Column(
        children: [
          Container(width: 70,height:70,decoration:
          BoxDecoration(
              color:AppColor.primaryColor,borderRadius:
          BorderRadius.circular(10)
          ),
            child: SvgPicture.network(
              "${AppLink.imageCategories}${categoriesModel.categoriesImage}"
              ,color: AppColor.grey),
          ),
          Text("${categoriesModel.categoriesName}",style:const TextStyle(fontSize:13,color: Colors.black),)
        ],
      ),
    );
  }
}

