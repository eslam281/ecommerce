import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:const Text("Checkout"),),
      body:Container(padding:const EdgeInsets.all(20),
        child: ListView(children: [
        const Text("Choose Payment Method",style:TextStyle(fontSize: 16,
        fontWeight:FontWeight.bold,color:AppColor.primaryColor),),

          Container(
            margin:const EdgeInsets.all(10),
            padding:const EdgeInsets.all(10),
            decoration:BoxDecoration(color:AppColor.primaryColor,
            borderRadius:BorderRadius.circular(20)),
            child:const Text("Cash",style:TextStyle(color:Colors.white,
            fontWeight:FontWeight.bold,height:1),),),

          Container(
            margin:const EdgeInsets.symmetric(horizontal:10),
            padding:const EdgeInsets.all(10),
            decoration:BoxDecoration(color:AppColor.grey,
            borderRadius:BorderRadius.circular(20)),
            child:const Text("Payment Card",style:TextStyle(color:Colors.white,
            fontWeight:FontWeight.bold,height:1),),),

          const SizedBox(height: 20,),

          const Text("Choose Delivery Type",style:TextStyle(
            color: AppColor.primaryColor,fontSize: 16,
            fontWeight: FontWeight.bold
          ),),

          const SizedBox(height: 10,),
          Row(
            children: [
              Container(
                height:120, width: 120,
                decoration:BoxDecoration(
                  border:Border.all(color:AppColor.primaryColor),
                    color:AppColor.primaryColor
                ),
                child:Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                Image.asset(AppImageAsset.logo,width:65,color:Colors.white),
                    const Text("Delivery",style:TextStyle(fontWeight:FontWeight.bold
                    ,color:Colors.white),)
              ],),),

              const SizedBox(width: 10,),

              Container(
                height:120, width: 120,
                decoration:BoxDecoration(
                  border:Border.all(color:AppColor.primaryColor)
                ),
                child:Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                Image.asset(AppImageAsset.logo,width:65,),
                    const Text("Drive thru",style:TextStyle(fontWeight:FontWeight.bold
                    ,color:AppColor.secondColor),)
              ],),),
            ],
          )

      ],),),
    );
  }
}
