import 'package:ecommercecourse/controller/checkoutcontroller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
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
    CheckoutControllerImp controller = Get.put(CheckoutControllerImp());
    return Scaffold(
      appBar:AppBar(title:const Text("Checkout"),),

      bottomNavigationBar:Container(
        padding:const EdgeInsets.symmetric(horizontal: 20),
        child:MaterialButton(color:AppColor.secondColor,
        textColor:Colors.white,
        onPressed: (){controller.checkout();},
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
                  controller.choosePaymentMethod("0");
                },child:CardPaymentMethodCheckout(title:"Cash on Delivery",isActive:controller.paymentMethod=="0",)),

                InkWell(onTap:(){
                  controller.choosePaymentMethod("1");
                },child:CardPaymentMethodCheckout(title:"Payment Card",isActive:controller.paymentMethod=="1",)),

                const SizedBox(height: 20,),

                const Text("Choose Delivery Type",style:TextStyle(
                  color: AppColor.primaryColor,fontSize: 16,
                  fontWeight: FontWeight.bold
                ),),

                const SizedBox(height: 10,),
                 Row(
                  children: [
                    InkWell(onTap:(){
                      controller.chooseDeliveryType("0");
                    },
                      child: CardDeliveryTypeCheckout(imageName:AppImageAsset.delivery,
                        title:"Delivery",isActive:"0"==controller.deliveryType,),
                    ),

                    const SizedBox(width: 10,),

                    InkWell(onTap:(){
                      controller.chooseDeliveryType("1");
                    },
                      child: CardDeliveryTypeCheckout(imageName:AppImageAsset.drivethru,
                        title:"Drive-thru",isActive:"1"== controller.deliveryType),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                if(controller.deliveryType =="0")
                 Column(children: [
                  const Text("Shipping Address",style:TextStyle(
                      color: AppColor.primaryColor,fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(height: 10),

                  ...List.generate(controller.dataAddress.length,
                  (index) =>
                      InkWell(
                        onTap: () {
                          controller.chooseShippingAddress(controller.dataAddress[index].addressId!);
                        },
                        child: CardShippingAddress(title:"${controller.dataAddress[index].addressName}",
                            subtitle:"${controller.dataAddress[index].addressCity} // ${controller.dataAddress[index].addressStreet}"
                            ,isActive:controller.dataAddress[index].addressId == controller.addressId),
                      )
                  ),
                   const SizedBox(height: 10),
                   Row(mainAxisAlignment:MainAxisAlignment.center,
                     children: [
                       const Text("Add Address"),
                       Container(margin:const EdgeInsets.only(left: 20),
                           decoration:BoxDecoration(
                               color:AppColor.primaryColor,borderRadius:BorderRadius.circular(100)
                           ),
                           child: IconButton(onPressed: (){Get.toNamed(AppRoute.addressAdd);},
                             icon: const Icon(Icons.add),))
                     ],)

                ],)
            ],),),
          );
        }
      ),
    );
  }
}
