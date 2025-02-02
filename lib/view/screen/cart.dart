import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:ecommercecourse/view/widget/cart/buttoncart.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat ,
      floatingActionButton:Column(
        mainAxisSize:MainAxisSize.min,
        children: [
          const Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20),
              child: Text("price",style:TextStyle(fontSize: 16),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20),
              child: Text("1200 \$",style:TextStyle(fontSize: 16)),
            ),
          ],),
          const Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20),
              child: Text("Shpping",style:TextStyle(fontSize: 16),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20),
              child: Text("1200 \$",style:TextStyle(fontSize: 16)),
            ),
          ],),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(color:Colors.black,),
          ),

          const Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20),
              child: Text("Total Price",style:TextStyle(color:Colors.red,fontSize:18),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20),
              child: Text("2400 \$",style:TextStyle(color:Colors.red,fontSize:18)),
            ),
          ],),
          CustomButtonCart(textbutton: "Place order", onPressed: (){})
      ],),
      appBar:AppBar(
        title:const Text("Title"),
      ),
      body:ListView(children: [
        Container(
          alignment: Alignment.center,
          child:Row(
            children: [
              Expanded(child:Container(alignment:Alignment.centerLeft,
                      child: IconButton(onPressed:(){}, icon:const Icon(Icons.arrow_back)))),

              Expanded(flex: 2,
                child: Container(alignment:Alignment.center,
                  child: const Text("My Cart",style:TextStyle(
                      fontSize: 25,fontWeight:FontWeight.bold),),
                ),),

              const Spacer(),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding:EdgeInsets.only(bottom:5),
          margin:EdgeInsets.symmetric(horizontal:20),
          decoration:BoxDecoration(color:AppColor.primaryColor,
          borderRadius:BorderRadius.circular(20)),
          child:Text('you have 2 Items in your List',textAlign:TextAlign.center,
          style:TextStyle(color:Colors.white,fontSize:20,wordSpacing:2),),),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Card(child:Row(children: [
                Expanded(flex: 2,child:Image.asset(AppImageAsset.logo,height:90,fit:BoxFit.fill,)),
                
                const Expanded(flex:3,child:ListTile(title:Text("Macbook M2 Max"),
                subtitle:Text("300.00 \$",style:TextStyle(color:Colors.red,fontSize:15),),)),
                 
                 Expanded(child:Column(children: [
                  SizedBox(height: 35,
                      child: IconButton(onPressed:(){}, icon:const Icon(Icons.add))),
                  const SizedBox(height:20,
                    child:Text("2",style:TextStyle(fontFamily:"sans"),),),
                  SizedBox(height: 25,
                          child: IconButton(onPressed:(){}, icon:const Icon(Icons.remove))),
                ],)),
              ],),),
              Card(child:Row(children: [
                Expanded(flex: 2,child:Image.asset(AppImageAsset.logo,height:90,fit:BoxFit.fill)),

                const Expanded(flex:3,child:ListTile(title:Text("Macbook M2 Max"),
                subtitle:Text("300.00 \$",style:TextStyle(color:Colors.red,fontSize:15),),)),

                 Expanded(child:Column(children: [
                  SizedBox(height: 35,
                      child: IconButton(onPressed:(){}, icon:const Icon(Icons.add))),
                  const SizedBox(height:20,
                    child:Text("2",style:TextStyle(fontFamily:"sans"),),),
                  SizedBox(height: 25,
                      child: IconButton(onPressed:(){}, icon:const Icon(Icons.remove))),
                ],)),
              ],),),
              Card(child:Row(children: [
                Expanded(flex: 2,child:Image.asset(AppImageAsset.logo,height:90,fit:BoxFit.fill)),

                const Expanded(flex:3,child:ListTile(title:Text("Macbook M2 Max"),
                  subtitle:Text("300.00 \$",style:TextStyle(color:Colors.red,fontSize:15),),)),

                Expanded(child:Column(children: [
                  SizedBox(height: 35,
                      child: IconButton(onPressed:(){}, icon:const Icon(Icons.add))),
                  const SizedBox(height:20,
                    child:Text("2",style:TextStyle(fontFamily:"sans"),),),
                  SizedBox(height: 25,
                      child: IconButton(onPressed:(){}, icon:const Icon(Icons.remove))),
                ],)),
              ],),),
              Card(child:Row(children: [
                Expanded(flex: 2,child:Image.asset(AppImageAsset.logo,height:90,fit:BoxFit.fill)),

                const Expanded(flex:3,child:ListTile(title:Text("Macbook M2 Max"),
                  subtitle:Text("300.00 \$",style:TextStyle(color:Colors.red,fontSize:15),),)),

                Expanded(child:Column(children: [
                  SizedBox(height: 35,
                      child: IconButton(onPressed:(){}, icon:const Icon(Icons.add))),
                  const SizedBox(height:20,
                    child:Text("2",style:TextStyle(fontFamily:"sans"),),),
                  SizedBox(height: 30,
                      child: IconButton(onPressed:(){}, icon:const Icon(Icons.remove))),
                ],)),
              ],),),
            ],
          ),
        )
      ],),
    );
  }
}
