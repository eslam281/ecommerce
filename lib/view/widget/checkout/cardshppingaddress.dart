import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CardShippingAddress extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isActive;
  const CardShippingAddress({super.key, required this.title, required this.subtitle, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color:isActive? AppColor.primaryColor:null,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title:Text(title,style:TextStyle(color:isActive? Colors.white:null,
            fontWeight:FontWeight.bold),),subtitle:Text(subtitle
          ,style: TextStyle(color:isActive? Colors.white:null,
              fontWeight:isActive?FontWeight.bold:null)),
      ),);
  }
}
