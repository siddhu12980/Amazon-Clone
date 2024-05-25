import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:ec/constants/error_handelling.dart';
import 'package:ec/constants/global_variable.dart';
import 'package:ec/constants/utils.dart';
import 'package:ec/models/order.dart';
import 'package:ec/models/product_model.dart';
import 'package:ec/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  Future<List<Order>> fetchAllOrders({required BuildContext context}) async {
    final List<Order> orderList = [];

    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      http.Response res = await http.get(
        Uri.parse("$uri/admin/product"),
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
              orderList.add(
                Order.fromJson(
                  jsonEncode(jsonDecode(data)["product"][i]),
                ),
              );
            }
          });
    } catch (e) {
      ShowSnackbar(context, e.toString());
    }

    return orderList;
  }

  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String catogery,
    required List<File> images,
    required VoidCallback onsucess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic("dq3oizrkk", "ey03jkdd");

      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path,
              folder: name, resourceType: CloudinaryResourceType.Image),
        );
        imageUrls.add(response.secureUrl);
      }

      Product product = Product(
          name: name,
          description: description,
          price: price,
          quantity: quantity,
          catogery: catogery,
          images: imageUrls);

      http.Response res = await http.post(
        Uri.parse("$uri/admin/product"),
        headers: <String, String>{
          "Access-Control-Allow-Origin": "*",
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSucess: () async {
            ShowSnackbar(context, "Product Added Sucessfully");
            onsucess();

            Navigator.pop(context);
          });
    } catch (e) {
      ShowSnackbar(context, e.toString());
    }
  }

  Future<List<Product>> getProduct({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/admin/product"),
        headers: <String, String>{
          "Access-Control-Allow-Origin": "*",
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      print("=================");
      print(res.body);
      print("=================");

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

  Future<void> deleteProduct(
      {required BuildContext context, required String id}) async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      http.Response res = await http.delete(
        Uri.parse("$uri/admin/product/$id"),
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
            print(res.body);
            ShowSnackbar(context, "Product Deleted");
          });
    } catch (e) {
      ShowSnackbar(context, e.toString());
    }
  }
}
