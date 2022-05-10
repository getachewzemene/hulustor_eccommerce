import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/providers/product_provider.dart';
import 'package:ecommerce_app/widgets/bottom_navigation.dart';
import 'package:ecommerce_app/widgets/cart_icon.dart';
import 'package:ecommerce_app/widgets/item_carousel.dart';
import 'package:ecommerce_app/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/product_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Hulu Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.cyan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // themeMode: ThemeMode.system,
        // darkTheme: ThemeData.dark(),
        home: const MyHomePage(title: 'Hulu Store'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: const [CartIcon()]),
        drawer: const NavDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ItemCarousel(),
                const SizedBox(
                  height: 20.0,
                ),
                const Text("Popular Products"),
                const SizedBox(
                  height: 10.0,
                ),
                Consumer<ProductProvider>(
                    builder: ((context, productProvider, child) =>
                        GridView.builder(
                            scrollDirection: Axis.vertical,
                            controller: ScrollController(),
                            shrinkWrap: true,
                            itemCount: productProvider.getProductList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 2.0),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (() => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetail(
                                            productItem: productProvider
                                                .getProductList[index])))),
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shadowColor: Colors.grey,
                                  color: Colors.amberAccent,
                                  // margin: const EdgeInsets.all(10.0),
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32)),
                                  child: FittedBox(
                                    child: SizedBox(
                                      height: 400.0,
                                      width: 400,
                                      child: Column(
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.vertical(
                                                    bottom:
                                                        Radius.circular(32)),
                                            child: Container(
                                                height: 300.0,
                                                // width: 400,
                                                padding: const EdgeInsets.only(
                                                    bottom: 20.0),
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                  image: AssetImage(
                                                    productProvider
                                                        .getProductList[index]
                                                        .imageURL,
                                                  ),
                                                  fit: BoxFit.fill,
                                                ))),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                              productProvider
                                                  .getProductList[index].name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 20)),
                                          const SizedBox(height: 2),
                                          Text(
                                              productProvider
                                                  .getProductList[index].id
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.grey)),
                                          const SizedBox(
                                            height: 2.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              MaterialButton(
                                                elevation: 8.0,
                                                minWidth: 120,
                                                height: 50,
                                                color: const Color(0xFF162A49),
                                                child:
                                                    const Text('view detail'),
                                                textColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(32),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProductDetail(
                                                                  productItem:
                                                                      productProvider
                                                                              .getProductList[
                                                                          index])));
                                                },
                                              ),
                                              Text(
                                                "Price: " +
                                                    productProvider
                                                        .getProductList[index]
                                                        .price
                                                        .toString() +
                                                    " Birr",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 230, 4, 4),
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }))),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigation());
  }
}
