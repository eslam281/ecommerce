import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String? hintText;
  final String label;
  final TextInputType type;
  final Icon suffixIcon;
  final bool? obscureText;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  final void Function()? onTap;

  const CustomTextFormAuth(
      {super.key,
      this.hintText,
      required this.label,
      required this.suffixIcon,
      required this.mycontroller,
      required this.valid,
      required this.type,
      this.obscureText,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        obscureText: obscureText==null ||obscureText== false?false:true,
        validator: valid,
        keyboardType: type,
        controller: mycontroller,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: (type == TextInputType.text )?
            InkWell(
              onTap: onTap,
              child: suffixIcon,
            ):suffixIcon,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
