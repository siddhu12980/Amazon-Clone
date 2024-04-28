import 'package:ec/constants/global_variable.dart';
import 'package:ec/feature/home/screens/catogery_screen.dart';
import 'package:flutter/material.dart';

class HomeCatogries extends StatefulWidget {
  const HomeCatogries({super.key});

  @override
  State<HomeCatogries> createState() => HomeCatogriesState();
}

class HomeCatogriesState extends State<HomeCatogries> {
  void nagivaCatogery(BuildContext context, String catogery) {
    Navigator.pushNamed(context, CatogeryScreen.routeName, arguments: catogery);
    print(catogery);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              nagivaCatogery(
                context,
                (GlobalVariable.categoryImages[index]['title']!),
              );
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(48),
                    child: Image.asset(
                      GlobalVariable.categoryImages[index]['image']!,
                      fit: BoxFit.cover,
                      height: 50,
                      width: 45,
                    ),
                  ),
                ),
                Text(
                  GlobalVariable.categoryImages[index]['title']!,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
