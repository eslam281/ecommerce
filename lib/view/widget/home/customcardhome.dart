import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String body;
  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [

      Container(alignment: Alignment.center,height: 150,
        decoration:BoxDecoration(color:Colors.red,
            borderRadius:BorderRadius.circular(50) ),

        child: ListTile(title:Text(title,
          style:const TextStyle(fontSize: 20,color: Colors.white),),
          subtitle:Text(body,
            style:const TextStyle(fontSize: 30,color: Colors.white),),),),

      Positioned(top: -20,right: -20,
        child: Container(width:160,height: 160,
          decoration:BoxDecoration(color:AppColor.secondColor,
              borderRadius:BorderRadius.circular(160)),),
      )
    ],);
  }
}
