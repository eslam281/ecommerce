import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:const Text("Address"),centerTitle:true,),
      floatingActionButton:FloatingActionButton(onPressed:(){
        Get.toNamed(AppRoute.addressAdd);
      },
        child: const Icon(Icons.add),),

      body:Container(child: ListView(children: const [
      ],),),
    );
  }
}
