import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtomAuth extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  const CustomButtomAuth(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 7),
      child: MaterialButton(
        padding:const EdgeInsets.symmetric(vertical: 7),
        shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(text,style:Theme.of(context).textTheme.headlineMedium,),
      ),
    );
  }
}
