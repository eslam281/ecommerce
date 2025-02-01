import 'package:ecommercecourse/controller/settings_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/imageasset.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());
    return ListView(
      children: [
        Stack(alignment:Alignment.center,clipBehavior:Clip.none,
          children: [
          Container(height:Get.width/3,color:AppColor.primaryColor,),
            Positioned(top: Get.width/3.9,child:Container(
              padding:const EdgeInsets.all(4),
              decoration:BoxDecoration(color:Colors.white,
                  borderRadius:BorderRadius.circular(100)),
                child: CircleAvatar(radius:40,backgroundColor:Colors.grey[100],
                backgroundImage:const AssetImage(AppImageAsset.logo),)),),
        ],),
        const SizedBox(height: 100,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(child:Column(
            children: [
             ListTile(title:const Text("Disable Notifications"),
                trailing:Switch(value:true, onChanged:(value) {

                },),onTap:(){}),
            const Divider(),
             ListTile(title:const Text("Address"),
                trailing:const Icon(Icons.location_on_outlined),onTap:(){}),
              const Divider(),
               ListTile(title:const Text("About us"),
                  trailing:const Icon(Icons.help_outline_rounded),onTap:(){}),
              const Divider(),
             ListTile(title:const Text("Contact us"),
                trailing:const Icon(Icons.phone_callback_outlined),onTap:(){}),
              const Divider(),
            ListTile(title:const Text("Logout",style:TextStyle(color:Colors.red,fontSize:20),),
            trailing:const Icon(Icons.exit_to_app,color:Colors.red,),
              onTap:(){
              controller.logout();
              },),
          ],),),
        )
      ],
    );
  }
}
