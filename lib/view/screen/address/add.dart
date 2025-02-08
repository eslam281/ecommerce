import 'package:flutter/material.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:const Text("Ad a new address"),centerTitle:true,),
      floatingActionButton:FloatingActionButton(onPressed:(){},
        child: const Icon(Icons.add),),

      body:Container(child: ListView(children: const [
      ],),),
    );
  }
}
