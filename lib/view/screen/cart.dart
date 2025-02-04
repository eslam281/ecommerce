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
                  price: "${controller.priceorder}"
                  , shippin: "300"),
          appBar: AppBar(
            title: const Text("Title"),
          ),
          body: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                TopAppbarCart(
                    title: "My Cart",
                    onPressed: () {
                      Get.back();
                    }),
                const SizedBox(height: 10),
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
                            onPressedAdd: () {
                              controller.add(
                                  controller.data[index].itemsId.toString());
                            },
                            onPressedRemove: () {
                              controller.remove(
                                  controller.data[index].itemsId.toString());
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
