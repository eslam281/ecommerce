// import 'package:ecommercecourse/view/widget/auth/custombuttomauth.dart';
// import 'package:ecommercecourse/view/widget/auth/customtextbodyauth.dart';
// import 'package:ecommercecourse/view/widget/auth/customtextformauth.dart';
// import 'package:ecommercecourse/view/widget/auth/customtexttittleauth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../controller/auth/checkemail_controller.dart';
// import '../../../core/functions/validinput.dart';
//
//
// class CheckEmail extends StatelessWidget {
//   const CheckEmail({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     CheckEmailControllerImp controller = Get.put(CheckEmailControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0,
//         title: Text(
//           "Check Email",
//           style: Theme.of(context)
//               .textTheme
//               .headlineMedium
//               ?.copyWith(color: Colors.grey),
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
//         child: Form(
//           key:controller.formstate ,
//           child: ListView(
//             children:  [
//               const CustomTextTittleAuth(text: "Success SignUp",),
//               const SizedBox(
//                 height: 10,
//               ),
//               const CustomTextBodyAuth(text: "5"),
//               const SizedBox(
//                 height: 15,
//               ),
//               CustomTextFormAuth(
//                 mycontroller:controller.email,
//                 label: "Email",
//                 hintText: "Enter Your Email",
//                 suffixIcon: const Icon(Icons.email_outlined),
//                   valid:(val) {
//                     return validInput(val, 5, 30, "email");
//                   }
//               ),
//               SizedBox(width:double.infinity,
//                   child: CustomButtomAuth(onPressed: (){controller.goToVerFiyCodeSignUp();}, text: "Sing In")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
