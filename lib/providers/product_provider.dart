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
        name: "Hoodi Men's Jacket",
        price: 1200,
        productSummary: "Best men's Hoodi shirt with different size and color",
        imageURL: "assets/products/hoodi_white.jpg"),
    Product(
        id: 4,
        name: "Jordan Sneaker",
        price: 4500,
        productSummary: "Best Jordan men's shoes with different size and color",
        imageURL: "assets/products/jordan_shoe.webp"),
    Product(
        id: 5,
        name: "Lander Black Shoes",
        price: 4500,
        productSummary: "Best Lander men's shoes with different size and color",
        imageURL: "assets/products/lander_black.webp"),
    Product(
        id: 6,
        name: "Leather Men's Jacket",
        price: 6000,
        productSummary:
            "Best men's leather jacket with different size and color",
        imageURL: "assets/products/leather_jack.webp"),
    Product(
        id: 7,
        name: "Lander Navy Shoe",
        price: 4500,
        productSummary: "Best Lander men's shoes with different size and color",
        imageURL: "assets/products/lander_navy.webp"),
    Product(
        id: 8,
        name: "Black Hoodi",
        price: 1200,
        productSummary: "Best men's Hoodi jacket with different size and color",
        imageURL: "assets/products/hoodi_shirt.jpeg"),
  ];
  List<Product> get getProductList => _productList;
  void addProduct() {
    notifyListeners();
  }
}
