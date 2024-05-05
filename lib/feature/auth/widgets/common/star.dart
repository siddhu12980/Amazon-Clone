import 'package:ec/constants/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarWidget extends StatefulWidget {
  final double rating;
  const StarWidget({super.key, required this.rating});

  @override
  State<StarWidget> createState() => StarWidgetState();
}

class StarWidgetState extends State<StarWidget> {
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      direction: Axis.horizontal,
      itemCount: 5,
      itemSize: 15,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Color(0xFFFF9900),
      ),
    );
  }
}