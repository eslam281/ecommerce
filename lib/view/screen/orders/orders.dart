import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/orders/orderschoose.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: OrdersChoose(title: "Orders", icon: Icons.card_giftcard,
                onTap: () {Get.toNamed(AppRoute.pending);},
              ),
            ),

            const SizedBox(height: 30,),

            Expanded(
              child: OrdersChoose(title: "Archive", icon: Icons.archive,
                onTap: () {Get.toNamed(AppRoute.archive);},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
