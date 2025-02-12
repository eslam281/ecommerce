import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class OrdersChoose extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function() onTap;
  const OrdersChoose({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(border:Border.all(color:AppColor.black),),

      child:InkWell(onTap:onTap
        ,splashColor:AppColor.primaryColor,
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Icon(icon,color: AppColor.primaryColor,size:Get.width/3,),
            const SizedBox(height: 10,),
            Text(title,style:const TextStyle(fontWeight:FontWeight.bold,
                fontSize: 25,color:Colors.black),)
          ],),
      ),);
  }
}
