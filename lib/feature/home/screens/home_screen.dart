import 'package:ec/constants/global_variable.dart';
import 'package:ec/feature/home/widgets/address_box.dart';
import 'package:ec/feature/home/widgets/catories.dart';
import 'package:ec/feature/home/widgets/crouser_image.dart';
import 'package:ec/feature/home/widgets/deal_of_day.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(63),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariable.appBarGradient,
            ),
          ),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 15),
                height: 42,
                child: Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(7),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.search_outlined,
                            color: Colors.black,
                            size: 23,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: "Search Amazon.in"),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.transparent,
              child: Icon(
                Icons.mic,
                color: Colors.black,
              ),
            )
          ]),
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            AddressBox(),
            SizedBox(
              height: 10,
            ),
            HomeCatogries(),
            SizedBox(
              height: 10,
            ),
            CrouselImage(),
            SizedBox(
              height: 10,
            ),
            DealOfDayWidget()
          ],
        ),
      )),
    );
  }
}
