import 'package:ec/feature/admin/screen/add_product_screen.dart';
import 'package:flutter/material.dart';

class AdminProductScreen extends StatelessWidget {
  const AdminProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Products"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AddProductScreen.routeName,
          );
        },
        child: Icon(Icons.add),
        tooltip: "Add a Product",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
