import 'package:ec/feature/account/widgets/single_product_widget.dart';
import 'package:ec/feature/admin/screen/add_product_screen.dart';
import 'package:ec/feature/admin/services/admin_services.dart';
import 'package:ec/models/product_model.dart';
import 'package:flutter/material.dart';

class AdminProductScreen extends StatefulWidget {
  const AdminProductScreen({super.key});

  @override
  State<AdminProductScreen> createState() => _AdminProductScreenState();
}

class _AdminProductScreenState extends State<AdminProductScreen> {
  AdminServices services = AdminServices();
  List<Product>? products;

  void fetchdata() async {
    List<Product>? product = await services.getProduct(context: context);

    setState(() {
      product = product;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: products == null
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Text("Products"),
            ),
      // : GridView.builder(
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 2),
      //     itemBuilder: ((context, index) {
      //       final productData = products![index];
      //       return Column(
      //         children: [
      //           SizedBox(
      //             height: 135,
      //             child: ProductWidget(
      //               image: productData.images[index],
      //             ),
      //           )
      //         ],
      //       );
      //     })),
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
