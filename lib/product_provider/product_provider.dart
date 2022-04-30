import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _productList = [
    Product(
        id: 1,
        name: "Arlo Sneaker",
        price: 2300,
        productSummary: "Best men's shoes with different size and color",
        imageURL: "assets/products/arlo_sneaker.webp"),
    Product(
        id: 2,
        name: "Burno Marc Sneaker",
        price: 2600,
        productSummary: "Best men's shoes with different size and color",
        imageURL: "assets/products/burno_marc.jpg"),
    Product(
        id: 3,
        name: "Hoodi Sneaker",
        price: 1200,
        productSummary: "Best men's Hoodi shirt with different size and color",
        imageURL: "assets/products/hoodi.jpg"),
    Product(
        id: 4,
        name: "Jordan Shoe Sneaker",
        price: 4500,
        productSummary: "Best Jordan men's shoes with different size and color",
        imageURL: "assets/products/jordan_shoe.webp"),
  ];
  List<Product> getProductList() => _productList;
  void addProduct() {
    notifyListeners();
  }
}
