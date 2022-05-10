import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/widgets/bottom_navigation.dart';
import 'package:ecommerce_app/widgets/cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class ProductDetail extends StatelessWidget {
  final Product productItem;
  const ProductDetail({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productItem.name),
        actions: const [CartIcon()],
      ),
      body: SafeArea(
        child: Column(
          children: [
            ClipRRect(
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    backgroundBlendMode: BlendMode.colorDodge,
                    color: const Color.fromARGB(255, 12, 11, 11),
                    image: DecorationImage(
                      image: AssetImage(
                        productItem.imageURL,
                      ),
                      fit: BoxFit.contain,
                      alignment: Alignment.topCenter,
                    )),
              ),
            ),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    backgroundBlendMode: BlendMode.darken,
                    color: Color.fromARGB(255, 156, 150, 150),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(45)),
                  ),
                  child: Column(children: [
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(productItem.productSummary),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text("Price: " + productItem.price.toString()),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .addToCart(productItem);
                      },
                      color: const Color.fromARGB(255, 190, 7, 99),
                      child: const Text('Add to cart'),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    )
                  ])),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
