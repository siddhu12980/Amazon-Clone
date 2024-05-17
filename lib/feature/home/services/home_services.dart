import 'dart:convert';

import 'package:ec/constants/error_handelling.dart';
import 'package:ec/constants/global_variable.dart';
import 'package:ec/constants/utils.dart';
import 'package:ec/models/product_model.dart';
import 'package:ec/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomeServices {
  Future<List<Product>> fetchCatogeryProduct(
      {required BuildContext context, required String catogery}) async {
    List<Product> productList = [];

    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      http.Response res = await http.get(
        Uri.parse("$uri/api/products?catogery=$catogery"),
        headers: <String, String>{
          "Access-Control-Allow-Origin": "*",
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSucess: () {
            var data = res.body;
            for (int i = 0; i < jsonDecode(data)["product"].length; i++) {
              productList.add(
                Product.fromJson(
                  jsonEncode(jsonDecode(data)["product"][i]),
                ),
              );
            }
          });
    } catch (e) {
      ShowSnackbar(context, e.toString());
    }
    return productList;
  }

  Future<Product> fetchDealOfDay({required BuildContext context}) async {
    Product product = Product(
        name: "",
        description: "",
        quantity: 1,
        images: [],
        catogery: "",
        price: 1);

    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      http.Response res = await http.get(
        Uri.parse("$uri/api/deal"),
        headers: <String, String>{
          "Access-Control-Allow-Origin": "*",
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      print(res.body);

      httpErrorHandle(
          response: res,
          context: context,
          onSucess: () {
            var data = res.body;
            product = Product.fromJson(data);
          });
    } catch (e) {
      ShowSnackbar(context, e.toString());
    }
    return product;
  }
}
