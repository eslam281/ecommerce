import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextTittleAuth extends StatelessWidget {
  final String text;
  const CustomTextTittleAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text.tr,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge);
  }
}
