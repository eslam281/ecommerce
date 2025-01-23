import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal:80),height: 170,
      decoration:BoxDecoration(
        // shape:BoxShape.circle,
        border: Border.all(),
        image:const DecorationImage(image: AssetImage(AppImageAsset.logo),fit:BoxFit.cover),
          borderRadius: BorderRadius.circular(100)),
    );
  }
}