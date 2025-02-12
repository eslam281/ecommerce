import 'package:ecommercecourse/controller/orders/pending_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Padding extends StatelessWidget {
  const Padding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingControllerImp());
    return Scaffold(
      appBar: AppBar(),
      body:GetBuilder<PendingControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest:controller.statusRequest,
            widget: Container(child:
              Center(child:Text(""),),),
          );
        }
      ),
    );
  }
}
