import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

import 'buttoncart.dart';
import 'custombuttoncoupon.dart';

class CustomButtonNavgationBarCart extends StatelessWidget {
  final String price;
  final String discount;
  final String totalprice;
  final  TextEditingController controllercoupon;
  final  void Function() onApplyCoupon;

  const CustomButtonNavgationBarCart({super.key, required this.price,
    required this.discount, required this.controllercoupon, required this.onApplyCoupon, required this.totalprice});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize:MainAxisSize.min,
      children: [
        Container(
          padding:const EdgeInsets.symmetric(horizontal:10),
          child:Row(children: [
          Expanded(flex: 2,child: TextFormField(
            controller:controllercoupon,
            decoration:const InputDecoration(
              isDense:true,hintText:"Coupon Code",
              contentPadding:EdgeInsets.symmetric(vertical: 6,horizontal:10),
                border:OutlineInputBorder()),
          )),
          const SizedBox(width: 5,),
          Expanded(flex:1,child: CustomButtonCoupon(
              textbutton:"Coupon", onPressed:onApplyCoupon))
        ],),),
        Container(
          padding:const EdgeInsets.all(10),
          margin:const EdgeInsets.all(10),
          decoration:BoxDecoration(
            border:Border.all(color:AppColor.primaryColor,width:1),
            borderRadius:BorderRadius.circular(10)
          ),
          child:Column(children: [
          Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal:20),
                child: Text("price",style:TextStyle(fontSize: 16),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: Text("$price \$",style:const TextStyle(fontSize: 16)),
              ),
            ],),
          Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal:20),
                child: Text("discount",style:TextStyle(fontSize: 16),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: Text("$discount % ",style:const TextStyle(fontSize: 16)),
              ),
            ],),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(color:Colors.black,),
          ),

          Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal:20),
                child: Text("Total Price",style:TextStyle(color:Colors.red,fontSize:18),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: Text("${totalprice} \$",style:const TextStyle(color:Colors.red,fontSize:18)),
              ),
            ],),
        ],),),
        CustomButtonCart(textbutton: "Place order", onPressed: (){})
      ],);
  }
}
