import 'package:ecommercecourse/controller/productdetailscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class SubItemsList extends StatelessWidget {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) {
          return Row(children: [
            ...List.generate(controller.subitems.length,
                  (index) {
                    var current=controller.subitems[index];

                return InkWell(onTap:(){controller.colorOnChange(index);},
                    child: Container(height:60,width:90,alignment:Alignment.center,
                      margin:const EdgeInsets.only(right:10),
                      padding:const EdgeInsets.only(bottom:5),
                      decoration:BoxDecoration(
                          border:Border.all(color:AppColor.secondColor3)
                          ,borderRadius: BorderRadius.circular(10),
                          color:current["active"]?AppColor.secondColor3:Colors.white),

                      child: Text("${current["name"]}",style: TextStyle(fontWeight:FontWeight.bold,
                          color:current["active"]?Colors.white:AppColor.secondColor3),),),
                  );
               }
            )
          ],);
        }
      );
  }
}
