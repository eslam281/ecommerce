import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/details_controller.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
      appBar:AppBar(title:const Text("Orders details"),),
      body:GetBuilder<OrdersDetailsController>(
        builder: (controller) {
          return Container(
            padding:const EdgeInsets.all(20),
            child:HandlingDataView(
              statusRequest:controller.statusRequest,
              widget: ListView(children: [
                const SizedBox(height: 20,),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:8),
                    child: Table(
                      border: TableBorder.all(borderRadius:BorderRadius.circular(10)),
                      children: [
                      const TableRow(children:[
                        Text("Item",textAlign:TextAlign.center,style:TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
                        Text("QTY",textAlign:TextAlign.center,style:TextStyle(fontWeight:FontWeight.bold,fontSize: 20)),
                        Text("Price",textAlign:TextAlign.center,style:TextStyle(fontWeight:FontWeight.bold,fontSize: 20)),
                      ]),
                      ...List.generate(
                        controller.data.length,
                      (index) =>
                          TableRow(children:[
                            Text("${controller.data[index].itemsName}",textAlign:TextAlign.center,),
                            Text("${controller.data[index].countitems}",textAlign:TextAlign.center),
                            Text("${controller.data[index].itemsprice}",textAlign:TextAlign.center),
                          ])
                        )

                    ],),
                  ),
                  const SizedBox(height: 10,),
                   Card(
                    child: Padding(padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      child: Text("Total Price :  ${controller.ordersModel.ordersTotalprice} \$",textAlign:TextAlign.center,style:const TextStyle(
                          fontSize:20,color:AppColor.primaryColor,fontWeight:FontWeight.bold,fontFamily:"sans"
                      ),),
                    ),
                  ),
                ],
              ),
                const SizedBox(height: 20,),
                 if(controller.ordersModel.ordersType==0)
                 Card(child: ListTile(
                  title:Text("${controller.ordersModel.addressName?.toUpperCase()}",style:const TextStyle(
                      fontSize:20,color:AppColor.primaryColor,fontWeight:FontWeight.bold)),
                  subtitle:Text("${controller.ordersModel.addressCity} // ${controller.ordersModel.addressStreet}",style:
                  const TextStyle(fontSize:17)),
                ),)
                        ],),
            ),);
        }
      ),
    );
  }
}
