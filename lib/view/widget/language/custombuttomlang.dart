import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtomLang extends StatelessWidget {
  final String textbutton;
  final void Function() onPressed;
  const CustomButtomLang({super.key, required this.textbutton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(onPressed:onPressed,
      color: AppColor.primaryColor,
      textColor: Colors.white,
      child: Text(textbutton,
      style:const TextStyle(fontWeight:FontWeight.bold),),),
    );
  }
}
