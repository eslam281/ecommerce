import 'package:ecommercecourse/controller/orders/pending_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

import '../../controller/notification_controller.dart';

refreshPageNotification(data){
  print('====================================================');
  print(data['pageid']);
  print(data['pagename']);
  print("================= current Route");
  print(Get.currentRoute);
  if (Get.currentRoute == "/pending"&& data['pagename'] == "refreshOrderPeding") {
    PendingControllerImp controller =Get.find();
    controller.refreshOrder();
  }else if(Get.currentRoute == "/home"&&data['pagename'] == "refreshOrderPeding"){
    NotificationControllerImp controllernotify =Get.find();
    controllernotify.refreshOrder();
  }
}

fcmconfing(){
  FirebaseMessaging.onMessage.listen((message) {
    print("================== Notification ============");
    print("${message.notification!.title}");
    print("${message.notification!.body}");
    FlutterRingtonePlayer().playNotification();
    Get.snackbar("${message.notification!.title}", "${message.notification!.body}");
    refreshPageNotification(message.data);
    },);
}

requsetPermissionNotification()async{
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
}