import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class CartData {

  Crud crud;

  CartData(this.crud);

  addCart(String itemsId,String userid)async{
    var response =
    await crud.postData(AppLink.cart_add, {"itemsid":itemsId,"userid":userid});
    return response.fold((l) => l, (r) => r,);
  }

  removeCart(String itemsId,String userid)async{
    var response =
    await crud.postData(AppLink.cart_remove, {"itemsid":itemsId,"userid":userid});
    return response.fold((l) => l, (r) => r,);
  }
  getCountItems(String itemsId,String userid)async{
    var response =
    await crud.postData(AppLink.cartgetcountitems, {"itemsid":itemsId,"userid":userid});
    return response.fold((l) => l, (r) => r,);
  }
  viewCart(String userid)async{
    var response =
    await crud.postData(AppLink.cart_view, {"userid":userid});
    return response.fold((l) => l, (r) => r,);
  }

}