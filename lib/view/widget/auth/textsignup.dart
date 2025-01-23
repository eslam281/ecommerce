import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTextSing extends StatelessWidget {
  final String text;
  final String textTwo;
  final void Function() onTap;
  const CustomTextSing({super.key, required this.text, required this.textTwo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
        Text(text,style:
        Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 17),),
        InkWell(
          onTap:onTap,
          child: Text(textTwo,style:
          Theme.of(context).textTheme.headlineMedium?.
          copyWith(fontSize: 17,color:AppColor.primaryColor
              ,fontWeight:FontWeight.w800),),)
      ],);
  }
}
