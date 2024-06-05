import 'package:ec/constants/global_variable.dart';
import 'package:ec/feature/account/services/account_services.dart';
import 'package:ec/feature/account/widgets/single_product_widget.dart';
import 'package:ec/models/order.dart';
import 'package:ec/orders_details/screens/order_detail_screen.dart';
import 'package:flutter/material.dart';

class OrdersWidget extends StatefulWidget {
  const OrdersWidget({super.key});

  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  List<Order>? orders;

  AccountServices accountServices = AccountServices();

  void fetchOrder() async {
    orders = await accountServices.fetchMyOrders(context: context);
    print(
      "orders : $orders",
    );
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchOrder();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const CircularProgressIndicator.adaptive()
        : Container(
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
                    itemCount: orders!.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, OrderDetailScreen.routeName,
                            arguments: orders![index]),
                        child: ProductWidget(
                          image: orders![index].products[0].images[0],
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          );
  }
}
