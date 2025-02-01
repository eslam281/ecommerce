class AppLink{

  static const String server = "http://10.0.2.2/ecommerce"; //10.0.2.2 =localhost very important

  static const String imageststatic = "$server/upload"; //10.0.2.2 =localhost very important
  static const String imageCategories = "$imageststatic/categories/";
  static const String imageItems = "$imageststatic/items/";

  static const String test ="$server/test.php";
  // ============================== Auth =================================//

  static const String signup ="$server/auth/signup.php";
  static const String login ="$server/auth/login.php";
  static const String verfiycode ="$server/auth/verfiycode.php";

// ============================== ForgetPassword =================================//
  static const String forgetpassword ="$server/forgetpassword/checkemail.php";
  static const String verfiycode_password ="$server/forgetpassword/verfiycode.php";
  static const String resetpassword ="$server/forgetpassword/resetpassword.php";

// ============================== Home =================================//

  static const String homepage ="$server/home.php";
  static const String items ="$server/items/items.php";
  static const String favorite_add ="$server/favorite/add.php";
  static const String favorite_remove ="$server/favorite/remove.php";
  static const String favorite_view ="$server/favorite/view.php";
  static const String deletefromfavorite ="$server/favorite/deletefromfavorite.php";

}