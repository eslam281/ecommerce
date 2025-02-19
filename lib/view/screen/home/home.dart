import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/home/home_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/linkapi.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/itemsmodel.dart';
import '../../widget/home/Listcategorieshome.dart';
import '../../widget/customAppbar.dart';
import '../../widget/home/customcardhome.dart';
import '../../widget/home/customtitlehome.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {

    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
        builder: (controller) {
          return  Container(margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: ListView(children: [

                CustomAppbar(titleAppbar: 'Find Product',onPressedIconFavorite:(){
                  Get.toNamed(AppRoute.myfavroite);
                },
                  onPressedSearch:(){
                  controller.onSearchItems();
                  },myController:controller.search ,
                onChanged:(val) {
                  controller.checkSearch(val);
                },),

            HandlingDataView(statusRequest: controller.statusRequest,
              widget:

                (!controller.isSearch)?
                Column(children: [
                  const SizedBox(height: 10,),

                   CustomCardHome(title:"${controller.settingsdata["settings_titleone"]}"
                    ,body:"${controller.settingsdata["settings_bodyhome"]}",),

                  const CustomTitleHome(title: "Categories",),
                  ListCategoriesHome(controller: controller,),

                  const CustomTitleHome(title: "Top selling",) ,
                  const ListItemsHome(),
                  const SizedBox(height: 100,),

                  MaterialButton(onPressed: (){Get.toNamed(AppRoute.offers);},highlightColor:Colors.yellow,
                    color:AppColor.primaryColor,elevation: 2,
                  child:const Text("See More Offers",style:TextStyle(fontSize:25,wordSpacing:2,
                      fontFamily:"sans")),)
                ],)
                    :
                  ListItemsSearch(listDataModel: controller.listData,)
            )
              ],),
            );
        }
      );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listDataModel;
  const ListItemsSearch({super.key, required this.listDataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics:const NeverScrollableScrollPhysics(),
      itemCount: listDataModel.length,
      itemBuilder: (context, index) {
        var current =listDataModel[index];
      return Container(
        height:120,
        margin: const EdgeInsets.symmetric(vertical:10),
        child: InkWell(
          onTap: (){controller.goToPageProductDetails(current);},
          child: Card(child: Container(
            padding:const EdgeInsets.all(10),
            child: Row(children: [

              Expanded(child:
              CachedNetworkImage(imageUrl:"${AppLink.imageItems}${current.itemsImage}",
              fit:BoxFit.fill,),),

              Expanded(flex:2,child:ListTile(
                title:Text("${current.itemsName}"),
                subtitle:Text("${current.categoriesName}"),
              )),

            ],),
          ),),
        ),
      );
    },);
  }
}

