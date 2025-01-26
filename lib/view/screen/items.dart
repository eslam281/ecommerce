import 'package:ecommercecourse/view/widget/customAppbar.dart';
import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        padding: EdgeInsets.all(15),
        child:ListView(children:[
           CustomAppbar(titleAppbar: 'Find Product')
        ],),
      ),
    );
  }
}
