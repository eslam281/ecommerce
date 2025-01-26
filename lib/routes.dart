import 'package:ecommercecourse/core/middleware/mymiddleware.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/signup.dart';
import 'package:ecommercecourse/view/screen/auth/success_sinup.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/verfiycode.dart';
import 'package:ecommercecourse/view/screen/auth/verfiycodesignup.dart';
import 'package:ecommercecourse/view/screen/home.dart';
import 'package:ecommercecourse/view/screen/homescreen.dart';
import 'package:ecommercecourse/view/screen/items.dart';
import 'package:ecommercecourse/view/screen/language.dart';
import 'package:ecommercecourse/view/screen/onboarding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'core/constant/routes.dart';
import 'view/screen/auth/login.dart';

List<GetPage<dynamic>>? routes=[
  //language
  GetPage(name: "/", page: ()=> const Language(),middlewares:[
    MyMiddleWare()
  ]),
  //OnBoarding
  GetPage(name: AppRoute.onBoarding, page: ()=> const OnBoarding()),

  //Auth
  GetPage(name: AppRoute.login, page: ()=> const Login()),
  GetPage(name: AppRoute.signUp, page: ()=> const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: ()=> const ForgetPassword()),
  GetPage(name: AppRoute.verFiyCode, page: ()=> const VerFiyCode()),
  GetPage(name: AppRoute.resetPassword, page: ()=> const ResetPassword()),
  GetPage(name: AppRoute.successResetPassword, page: ()=> const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: ()=> const SuccessSinUp()),
  GetPage(name: AppRoute.verFiyCodeSignUp, page: ()=> const VerFiyCodeSignUp()),
  // Home
  GetPage(name: AppRoute.home, page: ()=> const HomeScreen()),
  GetPage(name: AppRoute.homepage, page: ()=> const Home()),
  GetPage(name: AppRoute.items, page: ()=> const Items()),


];

// Map<String, Widget Function(BuildContext)> routesFlutter = {
//   //OnBoarding
//   AppRoute.onBoarding: (context)=> const OnBoarding(),
//
//   //Auth
//   AppRoute.login: (context)=> const Login(),
//   AppRoute.signUp: (context)=> const SignUp(),
//   AppRoute.forgetPassword: (context)=> const ForgetPassword(),
//   AppRoute.verFiyCode: (context)=> const VerFiyCode(),
//   AppRoute.resetPassword: (context)=> const ResetPassword(),
//   AppRoute.successResetPassword: (context)=> const SuccessResetPassword(),
//   AppRoute.successSignUp: (context)=> const SuccessSinUp(),
//   // AppRoute.checkEmail: (context)=> const CheckEmail(),
//   AppRoute.verFiyCodeSignUp: (context)=> const VerFiyCodeSignUp(),
// };