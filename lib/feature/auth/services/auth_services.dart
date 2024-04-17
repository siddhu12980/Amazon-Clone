// ignore_for_file: use_build_context_synchronously
import 'dart:convert';

import 'package:ec/constants/error_handelling.dart';
import 'package:ec/constants/global_variable.dart';
import 'package:ec/constants/utils.dart';
import 'package:ec/feature/auth/widgets/bottom_bar.dart';
import 'package:ec/feature/home/screens/home_screen.dart';
import 'package:ec/models/user.dart';
import 'package:ec/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signupUser(
      {required BuildContext context,
      required String email,
      required String name,
      required String password}) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          role: '',
          token: '');

      http.Response res = await http.post(
        Uri.parse("$uri/user/api/signup"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );
      print(res.body);

      httpErrorHandle(
          response: res,
          context: context,
          onSucess: () {
            ShowSnackbar(context, "Account Created Sucessfully");
          });
    } catch (e) {
      ShowSnackbar(context, e.toString());
    }
  }

  //signin

  void signin(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      User user = User(
          id: '',
          name: " ",
          email: email,
          password: password,
          address: '',
          role: '',
          token: '');

      http.Response res = await http.post(
        Uri.parse("$uri/user/api/signin"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSucess: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();

            Provider.of<UserProvider>(context, listen: false).setuser(res.body);

            await preferences.setString(
                'auth-token', jsonDecode(res.body)['token']);

            Navigator.pushNamedAndRemoveUntil(
              context,
              BottomBar.routeName,
              (route) => false,
            );

            ShowSnackbar(context, "logged In Sucessfully");
          });

      print(res.body);
    } catch (e) {
      ShowSnackbar(context, e.toString());
    }
  }

  void getUserData(BuildContext context) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString('auth-token');

      if (token == null) {
        preferences.setString('auth-token', '');
      }

      http.Response tokenres = await http.post(
        Uri.parse("$uri/user/api/verify"),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'auth-token': token!
        },
      );

      var res = jsonDecode(tokenres.body);

      if (res == true) {
        http.Response userres = await http.get(
          Uri.parse("$uri/user/api/data"),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
            'auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setuser(userres.body);

        //get user data
      }
    } catch (e) {}
  }
}
