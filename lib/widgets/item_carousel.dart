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
    return Column(
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
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                        height: 15.0,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                    );
                  },
                  //items: ,
                  options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: false,
                      initialPage: 0,
                      reverse: false,
                      enableInfiniteScroll: true,
                      pageSnapping: false,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 2000),
                      pauseAutoPlayOnTouch: true,
                      aspectRatio: 18 / 10,
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
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text(
                    names[currentIndex],
                    style: const TextStyle(
                        decoration: TextDecoration.none,
                        color: Color.fromARGB(255, 23, 230, 230),
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0),
                  ),
                )),
              )
            ],
          ),
          // Center(child: _buildIndicator())
        ]);
  }
}
