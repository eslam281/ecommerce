import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Title"),
      ),
      body:ListView(children: [
        Container(
          alignment: Alignment.center,
          child:Text("Cart",style:TextStyle(
              fontSize: 25,fontWeight:FontWeight.bold),),
        )
      ],),
    );
  }
}
