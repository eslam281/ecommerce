import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/imageasset.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child:ListView(
      children: [
        Stack(alignment:Alignment.center,clipBehavior:Clip.none,
          children: [
          Container(height:Get.width/3,color:AppColor.primaryColor,),
            Positioned(top: Get.width/3.9,child:Container(
              padding:const EdgeInsets.all(4),
              decoration:BoxDecoration(color:Colors.white,
                  borderRadius:BorderRadius.circular(100)),
                child: CircleAvatar(radius:40,backgroundColor:Colors.grey[100],
                backgroundImage:const AssetImage(AppImageAsset.logo),)),),
        ],),
        const SizedBox(height: 100,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Card(child:Column(
            children: [
            ListTile(title:Text("title one"),),
            Divider(),
            ListTile(title:Text("title one"),),
              Divider(),
            ListTile(title:Text("title one"),),
              Divider(),
            ListTile(title:Text("title one"),),
          ],),),
        )
      ],
    ),
      
    );
  }
}
