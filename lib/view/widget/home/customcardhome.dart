import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String body;
  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [

      Container(alignment: Alignment.center,height: 150,
        decoration:BoxDecoration(color:AppColor.grey,
            borderRadius:BorderRadius.circular(50) ),

        child: ListTile(title:Text(title,
          style:const TextStyle(fontSize: 20,color: Colors.white),),
          subtitle:Text(body,
            style:const TextStyle(fontSize: 30,color: Colors.white),),),),

      Positioned(top: -20,
        right:controller.lang=="ar"? null:-20,
        left:controller.lang=="ar"? -20:null,
        child: Container(width:160,height: 160,
          decoration:BoxDecoration(color:AppColor.secondColor,
              borderRadius:BorderRadius.circular(160)),),
      )
    ],);
  }
}
