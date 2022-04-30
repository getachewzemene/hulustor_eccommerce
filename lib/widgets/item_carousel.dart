import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ItemCarousel extends StatefulWidget {
  const ItemCarousel({Key? key}) : super(key: key);

  @override
  State<ItemCarousel> createState() => _ItemCarouselState();
}

class _ItemCarouselState extends State<ItemCarousel> {
  int currentIndex = 0;
  List<String> images = [
    "assets/products/arlo_sneaker.webp",
    "assets/products/burno_marc.jpg",
    "assets/products/hoodi.jpg",
    "assets/products/jordan_shoe.webp",
    "assets/products/lander_black.webp",
    "assets/products/lander_navy.webp",
    "assets/products/leather_jack.webp",
    "assets/products/lander_shoe.webp"
  ];
  List<String> names = [
    "Arlo Men's Sneaker",
    "Burno Marc Sneaker",
    'Hoodi',
    'Jordan Shoe',
    'Lander Black Shoe',
    'Lander Navy Sheo',
    "Leather Men's Jacket",
    "Lander Shoe"
  ];
  // Widget _buildIndicator() => AnimatedSmoothIndicator(
  //       count: images.length,
  //       activeIndex: currentIndex,
  //       effect: JumpingDotEffect(
  //           activeDotColor: Colors.redAccent,
  //           dotWidth: 20,
  //           dotHeight: 20,
  //           dotColor: Colors.grey),
  //     );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              fit: StackFit.loose,
              children: [
                CarouselSlider.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index, next) {
                      return ClipRRect(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(
                              images[index],
                            ),
                            fit: BoxFit.fill,
                            alignment: Alignment.topCenter,
                          )),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                      );
                    },
                    //items: ,
                    options: CarouselOptions(
                        autoPlay: false,
                        height: 200,
                        aspectRatio: 18 / 10,
                        viewportFraction: 1,
                        initialPage: 0,
                        reverse: false,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        pageSnapping: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 2000),
                        pauseAutoPlayOnTouch: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, next) {
                          setState(() {
                            currentIndex = index;
                          });
                        })),
                AspectRatio(
                  aspectRatio: 18 / 10,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      names[currentIndex],
                      style: const TextStyle(
                          decoration: TextDecoration.none,
                          color: Color.fromARGB(255, 230, 23, 23),
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0),
                    ),
                  )),
                )
              ],
            ),
            // Center(child: _buildIndicator())
          ]),
    );
  }
}
