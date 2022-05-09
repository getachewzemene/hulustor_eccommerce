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
                decoration: BoxDecoration(
                    backgroundBlendMode: BlendMode.colorDodge,
                    color: Colors.grey,
                    image: DecorationImage(
                      image: AssetImage(
                        productItem.imageURL,
                      ),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    )),
              ),
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(32), bottom: Radius.circular(32)),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text("Description"),
            const SizedBox(
              height: 5.0,
            ),
            Text(productItem.productSummary),
            const SizedBox(
              height: 5.0,
            ),
            Text("Price: " + productItem.price.toString()),
            MaterialButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false)
                    .addToCart(productItem);
              },
              color: const Color(0xFF162A49),
              child: const Text('Add to cart'),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
