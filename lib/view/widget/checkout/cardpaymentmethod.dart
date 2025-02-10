import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckout({super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(7),
      padding:const EdgeInsets.all(10),
      decoration:BoxDecoration(color:isActive?
      AppColor.primaryColor : AppColor.grey,
          borderRadius:BorderRadius.circular(20)),
      child:Text(title,style:TextStyle(color:isActive?
      Colors.black:Colors.white,
          fontWeight:FontWeight.bold,height:1),),);
  }
}
