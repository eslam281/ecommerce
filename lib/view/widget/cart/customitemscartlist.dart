import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/core/constant/linkapi.dart';
import 'package:ecommercecourse/data/model/cartmodel.dart';
import 'package:flutter/material.dart';


class CustomItemsCartList extends StatelessWidget {
   final CartModel cartModel;
  final void Function()? onPressedAdd;
  final void Function()? onPressedRemove;
  const CustomItemsCartList({super.key,this.onPressedAdd, this.onPressedRemove, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    return Card(child:Row(children: [
      Expanded(flex: 2,child:CachedNetworkImage(imageUrl:"${AppLink.imageItems}${cartModel.itemsImage}"
        ,height:80,fit:BoxFit.fill,)),

       Expanded(flex:3,child:ListTile(title:Text(cartModel.itemsName!),
        subtitle:Text("${cartModel.itemsprice} \$",style:const TextStyle(color:Colors.red,fontSize:15),),)),
      Expanded(child:Column(children: [
        SizedBox(height: 35,
            child: IconButton(onPressed:onPressedAdd, icon:const Icon(Icons.add))),
         SizedBox(height:20,
          child:Text("${cartModel.countitems}",style:const TextStyle(fontFamily:"sans"),),),
        SizedBox(height: 25,
            child: IconButton(onPressed:onPressedRemove, icon:const Icon(Icons.remove))),
      ],)),
    ],),);
  }
}
