import 'package:flutter/material.dart';

import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _productCart = [];
  void addToCart(Product product) {
    _productCart.add(product);
    notifyListeners();
  }

  void removefromCart(Product product) {
    _productCart.remove(product);
    notifyListeners();
  }

  List<Product> get getCartList => _productCart;
}
