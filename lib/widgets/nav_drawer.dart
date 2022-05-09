import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: ListView(
          children: [
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.zero, bottomRight: Radius.circular(100.0)),
              child: DrawerHeader(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[Colors.deepPurple, Colors.cyanAccent])),
                child: Center(
                  child: Column(children: const [
                    Icon(Icons.shop_2_sharp),
                    Text('Hulu Store')
                  ]),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.details_rounded),
              title: const Text('cart Detail'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add Item'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.share),
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
