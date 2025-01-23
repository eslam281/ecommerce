import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtonAppbar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final String textbutton;
  final Color colorItemSelected;
  const CustomButtonAppbar({super.key, this.onPressed,
    required this.icon, required this.textbutton, required this.colorItemSelected});

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(onPressed:onPressed,
      child:  Column(
        mainAxisSize:MainAxisSize.min,
        children: [
          Icon(icon,color:colorItemSelected,),
          Text(textbutton,style:TextStyle(color:colorItemSelected),)
        ],),
    );
  }
}
