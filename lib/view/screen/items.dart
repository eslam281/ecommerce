import 'package:ecommercecourse/view/widget/customAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/items_controller.dart';
import '../widget/items/listcategoriesitems.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      body:Container(
        padding: const EdgeInsets.all(15),
        child:ListView(children:const [
           CustomAppbar(titleAppbar: 'Find Product'),
           SizedBox(height: 10,),
          ListCategoriesItems()
        ],),
      ),
    );
  }
}
