import 'package:ecommercecourse/controller/checkoutcontroller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../widget/checkout/carddeliverytype.dart';
import '../widget/checkout/cardpaymentmethod.dart';
import '../widget/checkout/cardshppingaddress.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutControllerImp());
    return Scaffold(
      appBar:AppBar(title:const Text("Checkout"),),

      bottomNavigationBar:Container(
        padding:const EdgeInsets.symmetric(horizontal: 20),
        child:MaterialButton(color:AppColor.secondColor,
        textColor:Colors.white,
        onPressed: (){},
      child:const Text("Checkout"),),),

      body:GetBuilder<CheckoutControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest:controller.statusRequest,
            widget: Container(padding:const EdgeInsets.all(20),
              child: ListView(children: [

              const Text("Choose Payment Method",style:TextStyle(fontSize: 16,
              fontWeight:FontWeight.bold,color:AppColor.primaryColor),),

                InkWell(onTap:(){
                  controller.choosePaymentMethod("Cash");
                },child:CardPaymentMethodCheckout(title:"Cash on Delivery",isActive:controller.paymentMethod=="Cash",)),

                InkWell(onTap:(){
                  controller.choosePaymentMethod("Card");
                },child:CardPaymentMethodCheckout(title:"Payment Card",isActive:controller.paymentMethod=="Card",)),

                const SizedBox(height: 20,),

                const Text("Choose Delivery Type",style:TextStyle(
                  color: AppColor.primaryColor,fontSize: 16,
                  fontWeight: FontWeight.bold
                ),),

                const SizedBox(height: 10,),
                 Row(
                  children: [
                    InkWell(onTap:(){
                      controller.chooseDeliveryType("Delivery");
                    },
                      child: CardDeliveryTypeCheckout(imageName:AppImageAsset.delivery,
                        title:"Delivery",isActive:"Delivery"==controller.deliveryType,),
                    ),

                    const SizedBox(width: 10,),

                    InkWell(onTap:(){
                      controller.chooseDeliveryType("Drive-thru");
                    },
                      child: CardDeliveryTypeCheckout(imageName:AppImageAsset.drivethru,
                        title:"Drive-thru",isActive:"Drive-thru"== controller.deliveryType),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                if(controller.deliveryType =="Delivery")
                const Column(children: [
                  Text("Shipping Address",style:TextStyle(
                      color: AppColor.primaryColor,fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10),

                  CardShippingAddress(title:"Home",subtitle:"sadness sad a afa a sfd",isActive:true ,),
                  CardShippingAddress(title:"company",subtitle:"sadness sad a afa a sfd",isActive:false ,),
                  CardShippingAddress(title:"Home2",subtitle:"sadness sad a afa a sfd",isActive:false ,),

                ],)
            ],),),
          );
        }
      ),
    );
  }
}
