import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../screens/car_detail.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
        builder: ((context, cartNotifier, _) => Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(alignment: Alignment.topCenter, children: <Widget>[
                const Icon(
                  Icons.shopping_cart,
                  size: 36.0,
                ),
                if (cartNotifier.getCartList.isNotEmpty)
                  Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          cartNotifier.getCartList.length.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ))
              ]),
              onTap: () {
                if (cartNotifier.getCartList.isNotEmpty) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Cart(),
                    ),
                  );
                }
              },
            ))));
  }
}
