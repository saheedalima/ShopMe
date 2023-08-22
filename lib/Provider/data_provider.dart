import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/PrductModel.dart';

class dataProvider extends ChangeNotifier{

  late final ProductModel product;

  List<ProductModel> _cart = [];
  List<ProductModel> get carts => _cart;
  final List<ProductModel> _wishlist = [];
  List<ProductModel> get wishlist => _wishlist;

  void addToWishList (ProductModel addToWishList){
    wishlist.add(addToWishList);
    notifyListeners();
  }

  void removeWishList (ProductModel removeWishList){
    wishlist.remove(removeWishList);
    notifyListeners();
  }

  void addToCart(ProductModel products_toCart){
    _cart.add(products_toCart);
    notifyListeners();
  }

  void removefromCart(ProductModel products_remove){
    _cart.remove(products_remove);
    notifyListeners();
  }
  void addItem(ProductModel datas) {
    int index = _cart.indexWhere((element) => element == datas);
    if (index != -1) {
      _cart[index].count = _cart[index].count + 1;
    } else {
      _cart.add(datas);
    }
    notifyListeners();
  }
  void decrementItem(ProductModel datas) {
    int index = _cart.indexWhere((element) => element == datas);
    if(index != -1){
      if(_cart[index].count>1){
        _cart[index].count --;
      }else{
        _cart.removeAt(index);
      }
      notifyListeners();
    }
  }

}