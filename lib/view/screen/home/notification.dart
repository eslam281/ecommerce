import 'package:ecommercecourse/controller/notification_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationControllerImp());
    return Container(
      padding:const EdgeInsets.all(10),
      child:ListView(children: const [
        Center(child: Text("Notification"))
      ],),
    );
  }
}
