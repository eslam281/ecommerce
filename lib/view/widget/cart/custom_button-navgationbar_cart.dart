import 'package:flutter/material.dart';

import 'buttoncart.dart';

class CustomButtonNavgationBarCart extends StatelessWidget {
  final String price;
  final String shippin;

  const CustomButtonNavgationBarCart({super.key, required this.price, required this.shippin});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize:MainAxisSize.min,
      children: [
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
              child: Text("Shpping",style:TextStyle(fontSize: 16),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: Text("$shippin \$",style:const TextStyle(fontSize: 16)),
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
              child: Text("${double.parse(price).round()+int.parse(shippin)} \$",style:const TextStyle(color:Colors.red,fontSize:18)),
            ),
          ],),
        CustomButtonCart(textbutton: "Place order", onPressed: (){})
      ],);
  }
}
