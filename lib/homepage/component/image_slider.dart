// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSliderWidget extends StatefulWidget {
  const ImageSliderWidget({Key? key}) : super(key: key);

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  late TabController tabController;
  List<String> ImageList = [
    "assets/images/promo/promo1.jpg",
    "assets/images/promo/promo2.webp",
    "assets/images/promo/promo3.webp",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15.0),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.5),
        //     blurRadius: 1.0,
        //     spreadRadius: 1.0,
        //   ),
        // ],
      ),
      child: CarouselSlider.builder(
        itemCount: ImageList.length,
        options: CarouselOptions(
          enlargeCenterPage: true,
          height: MediaQuery.of(context).size.height, // set height of slider

          autoPlay: true, // enable auto play
          autoPlayInterval: const Duration(
            seconds: 7,
          ), // set auto change image for every 7 second
          reverse: false, // unable reverse direction
          aspectRatio: 1.5 / 2.5, // set aspect ratio of image
        ),
        itemBuilder: (context, int i, int id) {
          // to add image in the slider. call from the list at the top
          return Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                // decorationImage allow to add image in container
                image: AssetImage(ImageList[i]),
                fit: BoxFit
                    .fill, //ensure image special offer fully fill the box of box container
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          );
        },
      ),
    );
  }
}
