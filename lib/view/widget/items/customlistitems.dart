import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/linkapi.dart';

class CustomListItems extends StatelessWidget {
  final ItemsModel itemsModel;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){},
        child: Card(
      child:Padding(
        padding: const EdgeInsets.all(10),
        child: Column(mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(imageUrl:"${AppLink.imageItems}${itemsModel.itemsImage}"
                ,height: 110,width: 190,fit:BoxFit.fill),
             const SizedBox(height: 10,),
             Text("${itemsModel.itemsName}",style:const TextStyle(fontWeight:FontWeight.bold
                ,color:Colors.black,fontSize: 18,fontFamily:"sans"),),
             Text("${itemsModel.itemsDesc?.substring(0,20)}....",textAlign:TextAlign.center,),
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
                IconButton(onPressed: (){}, icon:false?
                const Icon(Icons.favorite,color:Colors.red,):
                const Icon(Icons.favorite_border_outlined))
              ],)
          ],),
        )
      )
    );
  }
}
