import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title:Text("welcome ${controller.username}"),backgroundColor:AppColor.primaryColor,
      ),
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) {
          return HandlingDataView(statusRequest: controller.statusRequest,
            widget: Container(margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: ListView(children: [

                Row(children: [
                 Expanded(child: TextFormField(
                     decoration: InputDecoration(
                       hintText:"Find Product",
                         hintStyle:const TextStyle(fontSize:18),
                         border:OutlineInputBorder(borderSide:BorderSide.none
                             ,borderRadius:BorderRadius.circular(15)),
                         prefixIcon:const Icon(Icons.search)
                     ,fillColor:Colors.grey[200],filled:true),
                   ),
                 ),

                const SizedBox(width: 10,),

                Container(padding:const EdgeInsets.symmetric(vertical:15),decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(15),color:Colors.grey[200]
                ),width: 60,
                  child:IconButton(onPressed:(){},
                    icon:Icon(Icons.notifications_active_outlined,
                      size:35,color:Colors.grey[600],)),)
                                ],),
                Stack(children: [

                Container(alignment: Alignment.center,height: 150,
                  decoration:BoxDecoration(color:Colors.red,
                  borderRadius:BorderRadius.circular(50) ),

                  child:const ListTile(title:Text("A summer surpise",
                    style:TextStyle(fontSize: 20,color: Colors.white),),
                  subtitle:Text("Cashback 20%",
                    style:TextStyle(fontSize: 30,color: Colors.white),),),),

                Positioned(top: -20,right: -20,
                  child: Container(width:160,height: 160,
                  decoration:BoxDecoration(color:AppColor.secondColor,
                  borderRadius:BorderRadius.circular(160)),),
                )
                ],),
                Container(height: 130,padding:const EdgeInsets.only(top: 25,left: 15),

                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 20,),
                    scrollDirection:Axis.horizontal,
                    itemCount: controller.categories.length,
                    itemBuilder:(context, i) {
                      var current=controller.categories[i];
                      return  Column(
                          children: [
                            Container(width: 70,height:70,decoration:
                            BoxDecoration(
                              color:AppColor.primaryColor,borderRadius:
                            BorderRadius.circular(10)
                            ),
                              child: SvgPicture.network(
                                  "${AppLink.imageCategories}${current['categories_image']}"
                              ,color: AppColor.grey,),
                            ),
                            Text("${current['categories_name']}",style:const TextStyle(fontSize:13,color: Colors.black),)
                          ],
                        );}
                    ),),
                const SizedBox(height: 10,),

                const Text("Prodect for you",style:TextStyle(fontSize:20,
                    color:AppColor.primaryColor,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),

                SizedBox(height:200,
                child: ListView.builder(itemCount:controller.items.length,
                  scrollDirection:Axis.horizontal,
                  itemBuilder: (context, i) {
                    var current=controller.items[i];
                    return Stack(children: [
                      Container(padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child:Image.network("${AppLink.imageItems}${current['items_image']}"
                            ,height: 100,width: 150,fit:BoxFit.fill),),
                      Container(height: 120,width: 180,decoration: BoxDecoration(
                          color:Colors.black.withValues(alpha:0.3),
                        borderRadius:BorderRadius.circular(30),
                      ),),
                       Positioned(child: Text("${current['items_name']}",style: const TextStyle(
                        color:AppColor.primaryColor,fontWeight:FontWeight.bold,fontSize:17
                      ),))
                    ],);

                },),)
              ],),
            ),
          );
        }
      )
    );
  }
}
