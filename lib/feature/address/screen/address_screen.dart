import 'package:ec/constants/global_variable.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = "Address-screen";
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(63),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariable.appBarGradient,
            ),
          ),
        ),
      ),
    );
  }
}
