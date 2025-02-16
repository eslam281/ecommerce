import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/details_controller.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      appBar:AppBar(title:const Text("Orders details"),),
      body:Container(
        padding:const EdgeInsets.all(20),
        child:ListView(children: [
          const SizedBox(height: 20,),
        Table(
          border: TableBorder.all(borderRadius:BorderRadius.circular(10)),
          children: const [
          TableRow(children:[
            Text("Item",textAlign:TextAlign.center,style:TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
            Text("QTY",textAlign:TextAlign.center,style:TextStyle(fontWeight:FontWeight.bold,fontSize: 20)),
            Text("Price",textAlign:TextAlign.center,style:TextStyle(fontWeight:FontWeight.bold,fontSize: 20)),
          ]),
          TableRow(children:[
            Text("adf",textAlign:TextAlign.center,),
            Text("4",textAlign:TextAlign.center),
            Text("400",textAlign:TextAlign.center),
          ]),
          TableRow(children:[
            Text("Itgfhfkem",textAlign:TextAlign.center,),
            Text("1",textAlign:TextAlign.center),
            Text("200",textAlign:TextAlign.center),
          ]),
        ],),
          const SizedBox(height: 20,),
          const Text("Price :  2400 \$",textAlign:TextAlign.center,style:TextStyle(
            fontSize:20,color:AppColor.primaryColor,fontWeight:FontWeight.bold
          ),),
          const Card(child: ListTile(
            title:Text("Home"),
            subtitle:Text("afsl adsf l dafs"),
          ),)
      ],),),
    );
  }
}
