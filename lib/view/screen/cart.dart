import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text("Title"),
      ),
      body:ListView(children: [
        Container(
          alignment: Alignment.center,
          child:const Text("Cart",style:TextStyle(
              fontSize: 25,fontWeight:FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Card(child:Row(children: [
                Expanded(flex: 2,child:Image.asset(AppImageAsset.logo)),
                
                const Expanded(flex:3,child:ListTile(title:Text("Macbook M2 Max"),
                subtitle:Text("300.00 \$",style:TextStyle(color:Colors.red,fontSize:15),),)),
                 
                 Expanded(child:Column(children: [
                  IconButton(onPressed:(){}, icon:const Icon(Icons.add)),
                  Container(child:Text("2",style:TextStyle(fontFamily:"sans"),),),
                  IconButton(onPressed:(){}, icon:const Icon(Icons.remove)),
                ],)),
              ],),),
            ],
          ),
        )
      ],),
    );
  }
}
