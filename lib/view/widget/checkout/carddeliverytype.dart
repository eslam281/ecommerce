import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CardDeliveryTypeCheckout extends StatelessWidget {
  final String title;
  final String imageName;
  final bool isActive;
  const CardDeliveryTypeCheckout({super.key, required this.title, required this.isActive, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:120, width: 120,
      decoration:BoxDecoration(
          border:Border.all(color:AppColor.primaryColor),
          color:isActive?AppColor.primaryColor:null
      ),
      child:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Image.asset(imageName,width:65,
              color:isActive?Colors.white:null),
          Text(title,style:TextStyle(fontWeight:FontWeight.bold
              ,color:isActive? Colors.white:AppColor.secondColor),)
        ],),);
  }
}
