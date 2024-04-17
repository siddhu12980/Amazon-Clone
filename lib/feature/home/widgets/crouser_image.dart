import 'package:carousel_slider/carousel_slider.dart';
import 'package:ec/constants/global_variable.dart';
import 'package:flutter/material.dart';

class CrouselImage extends StatefulWidget {
  const CrouselImage({super.key});

  @override
  State<CrouselImage> createState() => _CrouselImageState();
}

class _CrouselImageState extends State<CrouselImage> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: GlobalVariable.carouselImages.map((e) {
          return Builder(
            builder: ((BuildContext context) =>
                Image.network(e, fit: BoxFit.cover, height: 200)),
          );
        }).toList(),
        options: CarouselOptions(viewportFraction: 1, height: 200));
  }
}
