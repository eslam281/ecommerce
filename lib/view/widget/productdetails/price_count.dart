import 'package:flutter/material.dart';

class PriceCount extends StatelessWidget {
  final dynamic price;
  final dynamic discount;
  final String count;
  final void Function() onAdd;
  final void Function() onRemove;
  const PriceCount({super.key, required this.price, required this.onAdd, required this.onRemove,
    required this.count,required this.discount});

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      Row(children: [
        IconButton(onPressed:onAdd, icon:const Icon(Icons.add)),

        Container(alignment:Alignment.center,decoration:BoxDecoration(border:
        Border.all()),width:50,padding:const EdgeInsets.only(bottom: 2),
          margin:const EdgeInsets.all(2),
          child: Text(count,style:const TextStyle(fontSize: 20,height:1.5),),),

        IconButton(onPressed:onRemove, icon:const Icon(Icons.remove)),
      ],),
      const Spacer(),
      (discount>0)?
      Row(children: [
        Text("${price-(price*discount/100)} \$",style:const
        TextStyle(fontWeight:FontWeight.bold,color:Colors.red,
            fontSize:30,fontFamily:"sans")),

        const SizedBox(width: 15,),

        Text("$price \$",style:
        const TextStyle(fontWeight:FontWeight.bold,color:Colors.red,
          fontSize:30,fontFamily:"sans",decorationThickness: 2,
          decoration:TextDecoration.lineThrough,decorationColor: Colors.red,
        ),),
      ],)
          :
      Text("$price\$",style:
      const TextStyle(fontWeight:FontWeight.bold,color:Colors.red,
        fontSize:30,fontFamily:"sans",),),
    ],);
  }
}
