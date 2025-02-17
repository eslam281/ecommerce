import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/orders/archive_controller.dart';
import '../../../controller/orders/pending_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/orders/orderspendinglistcard.dart';

class Archive extends StatelessWidget {
  const Archive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveControllerImp());
    return Scaffold(
        appBar: AppBar(title:const Text("Orders"),),
        body: GetBuilder<ArchiveControllerImp>(builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          CardOrdersList(listdata: controller.data[index]),
                          const SizedBox(height: 20,)
                        ],
                      );
                    }
                    )),
              ));
        }));
  }
}
