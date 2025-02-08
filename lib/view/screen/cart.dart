import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
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
    Get.put(CartControllerImp());
    return GetBuilder<CartControllerImp>(builder: (controller) {
      return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton:
               CustomButtonNavgationBarCart(
                 onApplyCoupon: (){controller.checkcoupon();},
                  price: "${controller.priceorder}",shipping: "20",
                 totalprice:  "${controller.getTotalPrice()}"
                  , discount: controller.couponDiscount,
                 controllercoupon:controller.controllercoupon,),
          appBar:AppBar(title:TopAppbarCart(
              title: "My Cart",
              onPressed: () {
                controller.goToBack();
              }),automaticallyImplyLeading: false,),

          body: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [

                const SizedBox(height: 20),
                TopCardCart(
                    title:
                        'you have ${controller.totalcountitems} Items in your List'),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ...List.generate(
                        controller.data.length,
                        (index) => CustomItemsCartList(
                            cartModel: controller.data[index],
                            onPressedAdd: () async{
                             await controller.add(
                                  controller.data[index].itemsId.toString());
                              controller.refreshPage();
                            },
                            onPressedRemove: () async{
                             await controller.remove(
                                  controller.data[index].itemsId.toString());
                              controller.refreshPage();
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ));
    });
  }
}
