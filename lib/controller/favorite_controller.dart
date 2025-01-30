import 'package:get/get.dart';

abstract class FavoriteController extends GetxController{
  setFavorite(id,val);

}

class FavoriteControllerImp extends FavoriteController{
  Map isFavorite = {};

  @override
  setFavorite(id, val) {
    isFavorite[id]=val;
    update();
  }

}