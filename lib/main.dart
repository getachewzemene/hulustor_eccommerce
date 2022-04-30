import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/product_provider/product_provider.dart';
import 'package:ecommerce_app/widgets/item_carousel.dart';
import 'package:ecommerce_app/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hulu Store',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Hulu Store'),
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
  int _selectedIndex = 0;
  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          drawer: const NavDrawer(),
          body: SafeArea(
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ItemCarousel(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text("Popular Products"),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Flexible(
                    child: Consumer<ProductProvider>(
                        builder: ((context, productProvider, child) =>
                            ListView.builder(
                                scrollDirection: Axis.vertical,
                                controller: ScrollController(),
                                shrinkWrap: true,
                                itemCount:
                                    productProvider.getProductList.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shadowColor: Colors.grey,
                                    color: Colors.amberAccent,
                                    margin: const EdgeInsets.only(
                                        left: 30, right: 30, bottom: 24),
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32)),
                                    child: Column(
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                  top: Radius.circular(32),
                                                  bottom: Radius.circular(32)),
                                          child: Container(
                                              height: 200,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                image: AssetImage(
                                                  productProvider
                                                      .getProductList[index]
                                                      .imageURL,
                                                ),
                                                fit: BoxFit.fill,
                                                alignment: Alignment.topCenter,
                                              ))),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                            productProvider
                                                .getProductList[index].name,
                                            style:
                                                const TextStyle(fontSize: 20)),
                                        const SizedBox(height: 2),
                                        Text(
                                            productProvider
                                                .getProductList[index].id
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.grey)),
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            children: <Widget>[
                                              MaterialButton(
                                                color: const Color(0xFF162A49),
                                                child:
                                                    const Text('Add to cart'),
                                                textColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(32),
                                                ),
                                                onPressed: () {},
                                              ),
                                              const Spacer(),
                                              Text(
                                                productProvider
                                                        .getProductList[index]
                                                        .price
                                                        .toString() +
                                                    " Birr",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }))),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: true,
              showUnselectedLabels: true,
              //fixedColor: Colors.redAccent,
              backgroundColor: Colors.blue,
              // unselectedItemColor: Colors.white,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                    backgroundColor: Colors.blue),
                // BottomNavigationBarItem(
                //     icon: Icon(Icons.search),
                //     label: 'search'.tr,
                //     backgroundColor: Colors.red),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Add Product',
                  backgroundColor: Colors.blue,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.help_outline),
                  label: 'Aboout',
                  backgroundColor: Colors.blue,
                ),
              ],
              type: BottomNavigationBarType.shifting,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              unselectedLabelStyle: const TextStyle(color: Colors.white),
              iconSize: 20,
              onTap: _onItemTapped,
              elevation: 1)),
    );
  }
}
