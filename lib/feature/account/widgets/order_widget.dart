import 'package:ec/constants/global_variable.dart';
import 'package:ec/feature/account/widgets/single_product_widget.dart';
import 'package:flutter/material.dart';

class OrdersWidget extends StatefulWidget {
  const OrdersWidget({super.key});

  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  @override
  Widget build(BuildContext context) {
    final templist = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy85THBZ_CQBKT0Bx6Y8jinZwBA-e3wkLLAg&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy85THBZ_CQBKT0Bx6Y8jinZwBA-e3wkLLAg&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy85THBZ_CQBKT0Bx6Y8jinZwBA-e3wkLLAg&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy85THBZ_CQBKT0Bx6Y8jinZwBA-e3wkLLAg&s"
    ];
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 15,
                ),
                child: const Text(
                  "Your order's",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  right: 15,
                ),
                child: Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: GlobalVariable.selectedNavBarColor,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 180,
            padding: const EdgeInsets.fromLTRB(10, 20, 5, 5),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: templist.length,
              itemBuilder: ((context, index) {
                return ProductWidget(
                  image: templist[index],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
