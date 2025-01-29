import 'package:flutter/material.dart';

class PriceCount extends StatelessWidget {
  final int price;
  final int count;
  final void Function() onAdd;
  final void Function() onRemove;
  const PriceCount({super.key, required this.price, required this.onAdd, required this.onRemove, required this.count});

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      Row(children: [
        IconButton(onPressed:onAdd, icon:const Icon(Icons.add)),

        Container(alignment:Alignment.center,decoration:BoxDecoration(border:
        Border.all()),width:50,padding:const EdgeInsets.only(bottom: 2),
          child:const Text('2',style:TextStyle(fontSize: 20,height:1.5),),),

        IconButton(onPressed:onRemove, icon:const Icon(Icons.remove)),
      ],),
      const Spacer(),
      Text("${price}\$",style:const TextStyle(color:Colors.red,fontSize:30),)
    ],);
  }
}
