import 'package:flutter/material.dart';

class HomeCatogries extends StatefulWidget {
  const HomeCatogries({super.key});

  @override
  State<HomeCatogries> createState() => HomeCatogriesState();
}

class HomeCatogriesState extends State<HomeCatogries> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("./assests/images/electronics.jpeg"),
    );
  }
}
