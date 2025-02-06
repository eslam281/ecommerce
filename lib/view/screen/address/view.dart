import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:const Text("Addresses"),centerTitle:true,),
      floatingActionButton:FloatingActionButton(onPressed:(){},
        child: const Icon(Icons.add),),

      body:Container(child: ListView(children: const [
      ],),),
    );
  }
}
