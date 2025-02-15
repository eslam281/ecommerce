import 'package:ecommercecourse/controller/orders/pending_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';


class CardOrdersList extends GetView<PendingControllerImp> {
  final OrdersModel listdata;
  const CardOrdersList({super.key, required this.listdata}) ;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.ordersId}",
                      style:  const TextStyle(fontFamily:"sans",
                          fontSize: 18, fontWeight: FontWeight.bold,color:AppColor.black2)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!,
                  // Text("${Jiffy.parse(listdata.ordersDatetime!).format(pattern: 'MMMM do yyyy')}",
                  Text(Jiffy.parse(listdata.ordersDatetime!, pattern: 'yyyy-MM-dd HH:mm:ss').fromNow(),
                    style: const TextStyle(fontFamily: "sans",
                        color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              Text(
                  "Order Type : ${controller.printOrderType(listdata.ordersType!)}"),
              Text("Order Price : ${listdata.ordersPrice} \$"),
              Text("Delivery Price : ${listdata.ordersPricedelivery} \$ "),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
              Text(
                  "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)} "),
              const Divider(),
              Row(
                children: [
                  Text("Total Price : ${listdata.ordersId} \$ ",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {

                    },
                    color: AppColor.primaryColor,
                    textColor: AppColor.black,
                    child: const Text("Details"),
                  ),
                  const SizedBox(width: 10),
                  if (listdata.ordersStatus! == 0) MaterialButton(
                    onPressed: () {

                    },
                    color: AppColor.primaryColor,
                    textColor: AppColor.black,
                    child: const Text("Delete"),
                  )
                ],
              ),
            ],
          )),
    );
  }
}