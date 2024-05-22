import 'package:ec/feature/home/services/home_services.dart';
import 'package:ec/models/product_model.dart';
import 'package:ec/product_details/screen/product_details_screen.dart';
import 'package:flutter/material.dart';

class DealOfDayWidget extends StatefulWidget {
  const DealOfDayWidget({super.key});

  @override
  State<DealOfDayWidget> createState() => _DealOfDayWidgetState();
}

class _DealOfDayWidgetState extends State<DealOfDayWidget> {
  Product? product;
  var price;

  void fetchDeal() async {
    HomeServices homeServices = HomeServices();
    Product products = await homeServices.fetchDealOfDay(context: context);
    product = products;
    price = products.price;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDeal();
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Center(
            child: CircularProgressIndicator.adaptive(),
          )
        : product!.name.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: () => {
                  Navigator.pushNamed(context, ProductDetailScreen.routeName,
                      arguments: product)
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: const Text(
                        "Deal of the Day",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      child: Image.network(
                        product!.images[0],
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "price :  \$ $price",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        product!.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: product!.images
                            .map(
                              (e) => Image.network(
                                e,
                                fit: BoxFit.fitWidth,
                                width: 100,
                                height: 100,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 15,
                        bottom: 15,
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "See All Deals ",
                        style: TextStyle(color: Colors.cyan[800]),
                      ),
                    )
                  ],
                ),
              );
  }
}
