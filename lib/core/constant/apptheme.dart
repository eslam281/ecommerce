import 'package:flutter/material.dart';

import 'color.dart';

ThemeData themeEnglish = ThemeData(
fontFamily: "PlayfairDisplay",
textTheme: const TextTheme(
headlineMedium:TextStyle(
fontSize: 20, fontWeight: FontWeight.bold) ,
headlineLarge:TextStyle(
fontSize: 30, fontWeight: FontWeight.bold) ,
bodyMedium: TextStyle(
height: 2, color: AppColor.grey, fontSize: 15),
),

colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
useMaterial3: true,
);






ThemeData themeArabic=ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    headlineMedium:TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold) ,
    headlineLarge:TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold) ,
    bodyMedium: TextStyle(
        height: 2, color: AppColor.grey, fontSize: 15),
  ),

  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  useMaterial3: true,
);
