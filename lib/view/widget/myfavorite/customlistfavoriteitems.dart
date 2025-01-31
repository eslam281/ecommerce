import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/data/model/myfavoritemodel.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/linkapi.dart';
import '../../../core/functions/translateDatabase.dart';

class CustomListFavoriteItems extends StatelessWidget {
  final MyFavoriteModel myFavoriteModel;
  const CustomListFavoriteItems( {super.key, required this.myFavoriteModel});

  @override
  Widget build(BuildContext context) {

    return InkWell(onTap: (){},
        child: Card(
            child:Padding(
              padding: const EdgeInsets.all(10),
              child: Column(mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Hero(tag:"${myFavoriteModel.itemsId}",
                    child: CachedNetworkImage(imageUrl:"${AppLink.imageItems}${myFavoriteModel.itemsImage}"
                        ,height: 110,width: 190,fit:BoxFit.fill),
                  ),

                  const SizedBox(height: 10,),

                  Text("${translateDatabase(myFavoriteModel.itemsNameAr
                      , myFavoriteModel.itemsName)}",style:const TextStyle(fontWeight:FontWeight.bold
                      ,color:Colors.black,fontSize: 20,fontFamily:"sans"),maxLines: 1),

                  Text("${translateDatabase(myFavoriteModel.itemsDescAr
                      , myFavoriteModel.itemsDesc).substring(0,20)}....",
                    textAlign:TextAlign.center,),

                  Row(children: [
                    const Text("Rating 3.5 "),
                    ...List.generate(5, (index) =>
                    const Icon(Icons.star,color:Colors.yellow,size:22,),)
                  ],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${myFavoriteModel.itemsPrice} \$",style:const
                      TextStyle(fontWeight:FontWeight.bold,color:Colors.red,
                          fontSize:18,fontFamily:"sans")),

                             IconButton(onPressed: (){}, icon:
                            const Icon( Icons.delete),color:Colors.red)

                    ],)
                ],),
            )
        )
    );
  }
}
