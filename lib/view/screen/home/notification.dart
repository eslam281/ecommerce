import 'package:ecommercecourse/controller/notification_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationControllerImp());
    return Container(
      padding:const EdgeInsets.all(10),
      child:ListView(children:[
        const Center(child: Text("Notification",style:TextStyle(color:AppColor.primaryColor,fontSize:18,
            fontWeight:FontWeight.bold),)),
        const SizedBox(height: 25,),
        GetBuilder<NotificationControllerImp>(builder: (controller) =>
            HandlingDataView(statusRequest:controller.statusRequest,
                widget:ListView.builder(
                  shrinkWrap:true,
                    physics:const NeverScrollableScrollPhysics(),
                    itemCount:controller.data.length,
                    itemBuilder:(context, index) {
                  var current =controller.data[index];
                  return Column(
                    children: [
                      Card(
                        child: ListTile(title:Text(current["notification_title"]) ,
                        subtitle:Text(current["notification_body"]),
                        trailing:Text(Jiffy.parse(current["notification_datetime"],
                            pattern: 'yyyy-MM-dd HH:mm:ss').fromNow(),style:const TextStyle(fontFamily:"sans",
                              color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                        )),
                      ),
                      const SizedBox(height: 15,)
                    ],
                  );
                }
               )),)
      ],),
    );
  }
}
