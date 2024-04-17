import 'package:ec/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: '',
      name: '',
      email: '',
      password: '',
      address: '',
      role: '',
      token: '');

  User get user => _user;
  void setuser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
