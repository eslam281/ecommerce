class AppLink{

  static const String server = "http://10.0.2.2/ecommerce"; //10.0.2.2 =localhost very important

  static const String test ="$server/test.php";

  // ============================== Image =================================//

  static const String imageststatic = "$server/upload"; //10.0.2.2 =localhost very important
  static const String imageCategories = "$imageststatic/categories/";
  static const String imageItems = "$imageststatic/items/";

  // ============================== Auth =================================//

  static const String signup ="$server/auth/signup.php";
  static const String login ="$server/auth/login.php";
  static const String verfiycode ="$server/auth/verfiycode.php";
  static const String resend ="$server/auth/resend.php";

// ============================== ForgetPassword =================================//
  static const String forgetpassword ="$server/forgetpassword/checkemail.php";
  static const String verfiycode_password ="$server/forgetpassword/verfiycode.php";
  static const String resetpassword ="$server/forgetpassword/resetpassword.php";

// ============================== Home =================================//

  static const String homepage ="$server/home.php";
  static const String items ="$server/items/items.php";
  static const String search ="$server/items/search.php";

// ============================== Favorite =================================//
  static const String favorite_add ="$server/favorite/add.php";
  static const String favorite_remove ="$server/favorite/remove.php";
  static const String favorite_view ="$server/favorite/view.php";
  static const String deletefromfavorite ="$server/favorite/deletefromfavorite.php";

// ============================== Cart =================================//
  static const String cart_add ="$server/cart/add.php";
  static const String cart_remove ="$server/cart/remove.php";
  static const String cart_view ="$server/cart/view.php";
  static const String cartgetcountitems ="$server/cart/getcountitems.php";
// ============================== Address =================================//
  static const String address_view ="$server/address/view.php";
  static const String address_add ="$server/address/add.php";
  static const String address_remove ="$server/address/remove.php";
  static const String address_edit ="$server/address/edit.php";

// ============================== Coupon =================================//
  static const String checkcoupon ="$server/coupon/checkcoupon.php";

// ============================== Checkout =================================//
  static const String checkout ="$server/orders/checkout.php";

// ============================== Orders =================================//
  static const String padding ="$server/orders/padding.php";
  static const String archive ="$server/orders/archive.php";



}