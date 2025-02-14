import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

fcmconfing(){
  FirebaseMessaging.onMessage.listen((message) {
    print("================== Notification ============");
    print("${message.notification!.title}");
    print("${message.notification!.body}");
    FlutterRingtonePlayer().playNotification();
    Get.snackbar("${message.notification!.title}", "${message.notification!.body}");
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