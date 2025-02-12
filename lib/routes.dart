import 'package:ecommercecourse/view/screen/address/add.dart';
import 'package:ecommercecourse/view/screen/address/view.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/signup.dart';
import 'package:ecommercecourse/view/screen/auth/success_sinup.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/verfiycode.dart';
import 'package:ecommercecourse/view/screen/auth/verfiycodesignup.dart';
import 'package:ecommercecourse/view/screen/cart.dart';
import 'package:ecommercecourse/view/screen/checkout.dart';
import 'package:ecommercecourse/view/screen/home/home.dart';
import 'package:ecommercecourse/view/screen/home/homescreen.dart';
import 'package:ecommercecourse/view/screen/home/items.dart';
import 'package:ecommercecourse/view/screen/home/productdetails.dart';
import 'package:ecommercecourse/view/screen/language.dart';
import 'package:ecommercecourse/view/screen/myfavorite.dart';
import 'package:ecommercecourse/view/screen/onboarding.dart';
import 'package:ecommercecourse/view/screen/orders/archive.dart';
import 'package:ecommercecourse/view/screen/orders/padding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';
import 'view/screen/auth/login.dart';

List<GetPage<dynamic>>? routes=[
  //language
  GetPage(name: "/", page: ()=>  const Language(),middlewares: [
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
  GetPage(name: AppRoute.productdetails, page: ()=> const ProductDetails()),
  GetPage(name: AppRoute.myfavroite, page: ()=> const MyFavorite()),

  // Address
  GetPage(name: AppRoute.addressView, page: ()=> const AddressView()),
  GetPage(name: AppRoute.addressAdd, page: ()=> const AddressAdd()),

  //Checkout
  GetPage(name: AppRoute.cart, page: ()=> const Cart()),
  GetPage(name: AppRoute.checkout, page: ()=> const Checkout()),

  //Orders
  GetPage(name: AppRoute.padding, page: ()=> const Padding()),
  GetPage(name: AppRoute.archive, page: ()=> const Archive()),
];
