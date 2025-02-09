import 'package:ecommercecourse/controller/Address/view_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(AddressViewControllerImp());
    return Scaffold(
      appBar:AppBar(title:const Text("Address"),centerTitle:true,),
      floatingActionButton:FloatingActionButton(onPressed:(){
        Get.toNamed(AppRoute.addressAdd);
      },
        child: const Icon(Icons.add),),

      body:GetBuilder<AddressViewControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest:controller.statusRequest,
            widget: Container(
              padding:const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount:controller.dataAddress.length,
                itemBuilder: (context, index) =>
                CardAddress(addressModel:controller.dataAddress[index], onDelete:(){
                  controller.remove(controller.dataAddress[index].addressId.toString());
                },) ,),),
          );
        }
      ),
    );
  }
}


class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function() onDelete;
  const CardAddress({super.key, required this.addressModel, required this.onDelete,});

  @override
  Widget build(BuildContext context) {
    return Card(child: Container(
      padding:const EdgeInsets.all(10),
      child: ListTile(
        title: Text("${addressModel.addressName}"),
        subtitle:Text("${addressModel.addressCity} // ${addressModel.addressStreet}"),
        trailing:IconButton(onPressed:onDelete,
            icon:const Icon(Icons.delete_outline,color: Colors.red,)) ,
      ),),);
  }
}
