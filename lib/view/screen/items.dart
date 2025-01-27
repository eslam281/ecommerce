import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/view/widget/customAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/items_controller.dart';
import '../../core/constant/linkapi.dart';
import '../widget/items/listcategoriesitems.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      body:Container(
        padding: const EdgeInsets.all(15),
        child:ListView(children:[
           const CustomAppbar(titleAppbar: 'Find Product'),
           const SizedBox(height: 10,),
          const ListCategoriesItems(),
          GridView.builder(itemCount: 2,
            physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio:.7)
              , itemBuilder: (context, index) =>
                InkWell(child: Card(
                  child:Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(mainAxisAlignment:MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      CachedNetworkImage(imageUrl:"${AppLink.imageItems}71TK5dRc6iL._AC_SL1500_.jpg"
                          ,height: 120,width: 150,fit:BoxFit.fill),
                        const Text("Laptop surface Go",style:TextStyle(fontWeight:FontWeight.bold
                            ,color:Colors.black,fontSize: 18,fontFamily:"sans"),),
                        const Text("description how are you es28",textAlign:TextAlign.center,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          const Text("200.0 \$",style:TextStyle(fontWeight:FontWeight.bold
                              ,color:Colors.red,fontSize: 18,fontFamily:"sans")),
                          IconButton(onPressed: (){}, icon:false?
                              const Icon(Icons.favorite,color:Colors.red,):
                          const Icon(Icons.favorite_border_outlined))
                        ],)
                    ],),
                  ),
                )) ,)
        ],),
      ),
    );
  }
}
