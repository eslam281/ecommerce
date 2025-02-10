import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import '../widget/checkout/carddeliverytype.dart';
import '../widget/checkout/cardpaymentmethod.dart';
import '../widget/checkout/cardshppingaddress.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:const Text("Checkout"),),

      bottomNavigationBar:Container(
        padding:const EdgeInsets.symmetric(horizontal: 20),
        child:MaterialButton(color:AppColor.secondColor,
        textColor:Colors.white,
        onPressed: (){},
      child:const Text("Checkout"),),),

      body:Container(padding:const EdgeInsets.all(20),
        child: ListView(children: const [
        Text("Choose Payment Method",style:TextStyle(fontSize: 16,
        fontWeight:FontWeight.bold,color:AppColor.primaryColor),),

          CardPaymentMethodCheckout(title:"Cash",isActive:true,),
          CardPaymentMethodCheckout(title:"Payment Card",isActive:false,),

          SizedBox(height: 20,),

          Text("Choose Delivery Type",style:TextStyle(
            color: AppColor.primaryColor,fontSize: 16,
            fontWeight: FontWeight.bold
          ),),

          SizedBox(height: 10,),
          Row(
            children: [
              CardDeliveryTypeCheckout(imageName:AppImageAsset.delivery,
                title:"Delivery", isActive:true,),

              SizedBox(width: 10,),

              CardDeliveryTypeCheckout(imageName:AppImageAsset.drivethru,
                title:"Drive thru", isActive:false,),
            ],
          ),
          SizedBox(height: 25),

          Text("Shipping Address",style:TextStyle(
              color: AppColor.primaryColor,fontSize: 16,
              fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 10),

          CardShippingAddress(title:"Home",subtitle:"ssadfds sad a afa a sfd",isActive:true ,),
          CardShippingAddress(title:"company",subtitle:"ssadfds sad a afa a sfd",isActive:false ,),
          CardShippingAddress(title:"Home",subtitle:"ssadfds sad a afa a sfd",isActive:false ,),

      ],),),
    );
  }
}
