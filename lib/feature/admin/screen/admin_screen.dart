import 'package:ec/constants/global_variable.dart';
import 'package:ec/feature/admin/screen/products_screen.dart';
import 'package:ec/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 1;
  double barwidth = 48;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const AdminProductScreen(),
      // const Scaffold(
      //   body: Center(
      //     child: Text("1"),
      //   ),
      // ),
      const Scaffold(
        body: Center(
          child: Text("2"),
        ),
      ),
      const Scaffold(
        body: Center(
          child: Text("3"),
        ),
      )
    ];

    void updatepage(page) {
      setState(() {
        _page = page;
      });
    }

    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariable.appBarGradient,
            ),
          ),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              alignment: Alignment.topLeft,
              width: 125,
              height: 45,
              child: Image.asset('assets/images/amazon_in.png'),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(user.name),
            )
          ]),
        ),
      ),
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
              child: const Icon(Icons.analytics_outlined),
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
              child: const badges.Badge(
                  badgeContent: Text(
                    "3",
                    style: TextStyle(color: Colors.black),
                  ),
                  badgeStyle: badges.BadgeStyle(badgeColor: Colors.white),
                  child: Icon(Icons.warehouse_outlined)),
            ),
            label: '',
          )
        ],
      ),
      body: pages[_page],
    );
  }
}
