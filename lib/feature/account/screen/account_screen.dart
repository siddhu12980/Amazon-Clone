import 'package:ec/constants/global_variable.dart';
import 'package:ec/feature/account/widgets/account_screen_widget.dart';
import 'package:ec/feature/account/widgets/order_widget.dart';
import 'package:ec/feature/account/widgets/top_section_buttons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
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
              child: const Row(children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.notifications_active_outlined,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.search_outlined,
                    color: Colors.black,
                  ),
                )
              ]),
            )
          ]),
        ),
      ),
      body: const Column(children: [
        AccountWidget(),
        SizedBox(height: 10),
        TopSection(),
        SizedBox(height: 20),
        OrdersWidget(),
      ]),
    );
  }
}
