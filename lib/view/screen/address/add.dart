import 'package:ecommercecourse/controller/Address/addaddress_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/view/widget/auth/custombuttomauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/validinput.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressControllerImp());
    return Scaffold(
      appBar:AppBar(title:const Text("Ad a new address"),centerTitle:true,),

      body:GetBuilder<AddAddressControllerImp>(builder: (controller) =>
        HandlingDataRequest(statusRequest: controller.statusRequest, widget: Container(
          padding:const EdgeInsets.all(15),
          child: ListView(children:[
            const SizedBox(height: 40,),
            Form(
                key:controller.addressform ,
                child: Column(children: [
              CustomTextFormAuth(label: "city",hintText:"city",
                  suffixIcon:const Icon(Icons.location_city_outlined)
                  , mycontroller:controller.city, valid:(val) {
                    return validInput(val,5,25,"Address");
                  }, type: TextInputType.streetAddress),

              const SizedBox(height: 20,),

              CustomTextFormAuth(label: "street", hintText:"street"
                  ,suffixIcon:const Icon(Icons.streetview)
                  , mycontroller:controller.street, valid:(val) {
                    return  validInput(val,5,25,"Address");
                  }, type: TextInputType.streetAddress),

              const SizedBox(height: 20,),

              Container(
                margin:const EdgeInsets.symmetric(vertical: 2),
                child: CustomTextFormAuth(label: "name",hintText:"name for this Address",
                    suffixIcon:const Icon(Icons.note)
                    , mycontroller:controller.name, valid:(val) {
                     return validInput(val,5,25,"Address");
                    }, type: TextInputType.streetAddress),
              ),
            const SizedBox(height: 10,),
            CustomButtomAuth(onPressed:(){controller.add();}, text: "Add")
            ],)),
          ],),),),)
    );
  }
}
