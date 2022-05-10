import 'package:flutter/material.dart';

import '../screens/car_detail.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);
  final TextStyle _style = const TextStyle(
      color: Color.fromARGB(255, 10, 10, 10),
      fontSize: 20.0,
      fontWeight: FontWeight.w400);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                  backgroundBlendMode: BlendMode.darken,
                  color: Color.fromARGB(255, 201, 186, 186),
                  image: DecorationImage(
                    image: AssetImage("assets/products/logo.png"),
                    fit: BoxFit.contain,
                  )),
              accountName: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text("Hulu Store", style: _style)),
              accountEmail: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  "hulustore@gmail.com",
                  style: _style,
                ),
              ),
              currentAccountPicture: const ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.circular(10.0)),
                  child: Icon(Icons.shop_rounded)),
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_bag,
                color: Colors.red,
              ),
              title: const Text('Cart Detail'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Cart(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.add,
                color: Colors.red,
              ),
              title: const Text(
                'Add Item',
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.share,
                color: Colors.red,
              ),
              title: const Text('Share'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.red,
              ),
              title: const Text('Setting'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.share,
                color: Colors.red,
              ),
              title: const Text('Share'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
