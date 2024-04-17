import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void ShowSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
