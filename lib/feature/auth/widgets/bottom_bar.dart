import 'package:ec/constants/global_variable.dart';
import 'package:ec/feature/account/screen/account_screen.dart';
import 'package:ec/feature/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  static const routeName = "/actual-home";
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double barwidth = 48;

  void updatepage(page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text("Cart Page"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariable.selectedNavBarColor,
        unselectedItemColor: GlobalVariable.unselectedNavBarColor,
        backgroundColor: GlobalVariable.backgroundColor,
        iconSize: 28,
        onTap: updatepage,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: barwidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: _page == 0
                          ? GlobalVariable.selectedNavBarColor
                          : GlobalVariable.backgroundColor),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: barwidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: _page == 1
                          ? GlobalVariable.selectedNavBarColor
                          : GlobalVariable.backgroundColor),
                ),
              ),
              child: const Icon(Icons.person_outline_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: barwidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: _page == 2
                          ? GlobalVariable.selectedNavBarColor
                          : GlobalVariable.backgroundColor),
                ),
              ),
              child: badges.Badge(
                  badgeContent: Text(
                    "3",
                    style: TextStyle(color: Colors.black),
                  ),
                  badgeStyle: badges.BadgeStyle(badgeColor: Colors.white),
                  child: const Icon(Icons.add_shopping_cart_outlined)),
            ),
            label: '',
          )
        ],
      ),
    );
  }
}
