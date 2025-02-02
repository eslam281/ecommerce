import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class TopCardCart extends StatelessWidget {
  final String title;
  const TopCardCart({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(bottom:5),
      margin:const EdgeInsets.symmetric(horizontal:20),
      decoration:BoxDecoration(color:AppColor.primaryColor,
          borderRadius:BorderRadius.circular(20)),
      child:Text(title,textAlign:TextAlign.center,
        style:const TextStyle(color:Colors.white,fontSize:20,wordSpacing:2),),);
  }
}
