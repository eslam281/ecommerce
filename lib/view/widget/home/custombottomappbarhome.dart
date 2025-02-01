import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Homescreencontroller.dart';
import 'custombuttonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeScreenControllerImp>(builder: (controller) =>
        BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin:10,
          child: Row(
            // mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(controller.listpage.length+1
                  ,(index) {
                int i = index > 2 ?index-1:index;
                 return index==2?const Spacer() : CustomButtonAppbar(
                   icon: controller.bottomappbat[i]["icon"]
                   ,textbutton:controller.bottomappbat[i]["title"],
                    active:controller.currentpage==i? true:false,
                    onPressed:(){controller.changePage(i);}
                    ,);}
              )
            ],
          ),),);
  }
}
