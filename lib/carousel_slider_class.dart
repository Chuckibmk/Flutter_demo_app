import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselClass extends StatefulWidget {
  const CarouselClass({Key? key}) : super(key: key);

  @override
  State<CarouselClass> createState() => _CarouselClassState();
}

class _CarouselClassState extends State<CarouselClass> {
  final List<String> imglist = [
    'assets/images/anna.jpg',
    'assets/images/3e21921d36aa493ea4f6d5f6c7d88a25.png',
    'assets/images/pexels-alexander-bobrov-1036866.jpg',
    'assets/images/pexels-belle-co-1000445.jpg',
    'assets/images/pexels-elevate-1267329.jpg',
    'assets/images/pexels-fauxels-3184418.jpg',
    'assets/images/pexels-frans-van-heerden-1624695.jpg',
    'assets/images/pexels-joey-kyber-134643.jpg',
    'assets/images/pexels-pixabay-264547.jpg',
    'assets/images/pexels-samuel-wölfl-1427541.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carousel Slider")),
      body: Container(
        child: Column(
          children: [
            CarouselSlider(
                items: imglist.map((e) => Image.asset(e)).toList(),
                options: CarouselOptions(
                  height: 400,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.ease,
                  enlargeCenterPage: true,
                  onPageChanged: (i, CarouselPageChangedReason) {},
                  scrollDirection: Axis.horizontal,
                ))
          ],
        ),
      ),
    );
  }
}
