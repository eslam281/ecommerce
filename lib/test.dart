import 'package:ecommercecourse/core/functions/checkinternet.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var res ;
  intialdata()async{
    res =await checkInternet();
    print(res);
  }
  @override
  void initState() {
    res =  intialdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:const Text("Test"),),
      body:Container(
        padding:const EdgeInsets.all(10),
        child:ListView(
          children: const [

          ],
        ),
      ),
    );
  }
}
