import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/imageasset.dart';

class CustomItemsCartList extends StatelessWidget {
  // final ItemsModel itemsModel;
  final String title;
  final String price;
  final String count;
  const CustomItemsCartList({super.key, required this.title, required this.price, required this.count});

  @override
  Widget build(BuildContext context) {
    return Card(child:Row(children: [
      Expanded(flex: 2,child:Image.asset(AppImageAsset.logo,height:90,fit:BoxFit.fill,)),
       Expanded(flex:3,child:ListTile(title:Text(title),
        subtitle:Text(price,style:const TextStyle(color:Colors.red,fontSize:15),),)),
      Expanded(child:Column(children: [
        SizedBox(height: 35,
            child: IconButton(onPressed:(){}, icon:const Icon(Icons.add))),
         SizedBox(height:20,
          child:Text(count,style:const TextStyle(fontFamily:"sans"),),),
        SizedBox(height: 25,
            child: IconButton(onPressed:(){}, icon:const Icon(Icons.remove))),
      ],)),
    ],),);
  }
}
