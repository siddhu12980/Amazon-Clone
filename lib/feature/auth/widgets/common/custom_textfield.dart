// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String txt;
  final int maxlines;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.txt,
    this.maxlines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: txt,
          contentPadding: EdgeInsets.all(8),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black45,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black45,
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter your $txt";
          }

          return null;
        },
        maxLines: maxlines,
      ),
    );
  }
}
