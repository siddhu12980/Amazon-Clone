import 'package:ec/feature/auth/widgets/common/star.dart';
import 'package:ec/models/product_model.dart';
import 'package:flutter/material.dart';

class SearchProduct extends StatefulWidget {
  final Product product;
  const SearchProduct({super.key, required this.product});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(children: [
            Image.network(
              widget.product.images[0],
              fit: BoxFit.fitHeight,
              height: 135,
              width: 135,
            ),
            Column(
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    widget.product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: const StarWidget(rating: 5),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    '\$ ${widget.product.price}',
                    style: TextStyle(fontWeight: FontWeight.w500),
                    maxLines: 2,
                  ),
                ),
                Container(
                  width: 200,
                  padding: const EdgeInsets.only(left: 10, top: 2),
                  child: const Text(
                    "Free Shipping",
                    style: TextStyle(),
                    maxLines: 2,
                  ),
                ),
                Container(
                  width: 200,
                  padding: const EdgeInsets.only(left: 10, top: 2),
                  child: const Text(
                    "In Stock",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.teal),
                    maxLines: 2,
                  ),
                ),
              ],
            )
          ]),
        )
      ],
    );
  }
}
