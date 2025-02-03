import 'package:ecommercecourse/view/widget/cart/appbarcart.dart';
import 'package:ecommercecourse/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/cart/custom_button-navgationbar_cart.dart';
import '../widget/cart/customitemscartlist.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat ,
      floatingActionButton:const CustomButtonNavgationBarCart(price: "1200",shippin:"300"),
      appBar:AppBar(
        title:const Text("Title"),
      ),
      body:ListView(children: [

        TopAppbarCart(title:"My Cart", onPressed: (){Get.back();}),

        const SizedBox(height: 10),

        const TopCardCart(title: 'you have 2 Items in your List'),

        const Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CustomItemsCartList(title:"Macbook M1",price:"1100.0 \$",count:"2"),
              CustomItemsCartList(title:"Macbook M1",price:"600.0 \$",count:"2",),
              CustomItemsCartList(title:"Macbook M1",price:"800.0 \$",count:"2",),
              CustomItemsCartList(title:"Macbook M1",price:"300.0 \$",count:"2",),
            ],
          ),
        )
      ],),
    );
  }
}
