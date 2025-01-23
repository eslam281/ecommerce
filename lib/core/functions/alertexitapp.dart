import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExitApp(){

  return Get.defaultDialog(
    title:"alert",middleText:"Do want exit from the app",
    confirm:ElevatedButton(onPressed: (){
      exit(0);
    }, child: const Text("Confirm")),
    cancel:ElevatedButton(onPressed: (){
      Get.back();
    }, child: const Text("Cancel"))
  );
}