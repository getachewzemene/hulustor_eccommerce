import 'package:ecommerce_app/widgets/cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Cart Detail"), actions: const [CartIcon()]),
        body: SafeArea(
          child: Consumer<CartProvider>(
              builder: ((context, cartNotifier, _) => ListView.builder(
                  itemCount: cartNotifier.getCartList.length,
                  itemBuilder: (context, index) {
                    var item = cartNotifier.getCartList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.0),
                      child: SizedBox(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          elevation: 4.0,
                          child: ListTile(
                            leading: const FittedBox(
                                fit: BoxFit.cover, child: Icon(Icons.shop)),
                            title: Column(children: [
                              Text(item.name),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text("Price: " + item.price.toString()),
                            ]),
                            trailing: GestureDetector(
                                child: const Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .removefromCart(
                                          cartNotifier.getCartList[index]);
                                }),
                          ),
                        ),
                      ),
                    );
                  }))),
        ));
  }
}
