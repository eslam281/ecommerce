import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/linkapi.dart';
import '../../../core/functions/translateDatabase.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  const CustomListItems( {super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){controller.goToPageProductDetails(itemsModel);},
        child: Card(
      child:Padding(
        padding: const EdgeInsets.all(10),
        child: Column(mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Hero(tag:"${itemsModel.itemsId}",
              child: CachedNetworkImage(imageUrl:"${AppLink.imageItems}${itemsModel.itemsImage}"
                  ,height: 110,width: 190,fit:BoxFit.fill),
            ),

             const SizedBox(height: 10,),

             Text("${translateDatabase(itemsModel.itemsNameAr
                 , itemsModel.itemsName)}",style:const TextStyle(fontWeight:FontWeight.bold
                ,color:Colors.black,fontSize: 20,fontFamily:"sans"),maxLines: 1),

             Text("${translateDatabase(itemsModel.itemsDescAr
                 , itemsModel.itemsDesc).substring(0,20)}....",
               textAlign:TextAlign.center,),

            Row(children: [
              const Text("Rating 3.5 "),
              ...List.generate(5, (index) => 
                const Icon(Icons.star,color:Colors.yellow,size:22,),)
            ],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text("${itemsModel.itemsPrice} \$",style:const
                 TextStyle(fontWeight:FontWeight.bold,color:Colors.red,
                     fontSize:18,fontFamily:"sans")),
                GetBuilder<FavoriteControllerImp>(
                  builder: (controller) {
                    return IconButton(onPressed: (){
                     if (controller.isFavorite[itemsModel.itemsId]==1) {
                       controller.setFavorite(itemsModel.itemsId, 0);
                       controller.removeFavorite(itemsModel.itemsId.toString());
                     }else{
                      controller.setFavorite(itemsModel.itemsId, 1);
                      controller.addFavorite(itemsModel.itemsId.toString());
                      }

                    }, icon:
                    Icon(controller.isFavorite[itemsModel.itemsId]==1? Icons.favorite:
                    Icons.favorite_border_outlined)
                        ,color:Colors.red);
                  }
                )
              ],)
          ],),
        )
      )
    );
  }
}
