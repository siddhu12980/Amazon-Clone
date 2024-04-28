// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ec/feature/account/widgets/single_product_widget.dart';
import 'package:ec/feature/admin/screen/add_product_screen.dart';
import 'package:ec/feature/admin/services/admin_services.dart';
import 'package:ec/models/product_model.dart';

class AdminProductScreen extends StatefulWidget {
  const AdminProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminProductScreen> createState() => _AdminProductScreenState();
}

class _AdminProductScreenState extends State<AdminProductScreen> {
  AdminServices services = AdminServices();
  List<Product>? products;

  void fetchdata() async {
    products = await services.getProduct(context: context);

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  void deleteProduct(id) async {
    await services.deleteProduct(context: context, id: id);
    print("deleted");

    fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: products == null
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              itemCount: products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: ((context, index) {
                final productData = products![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 135,
                      child: ProductWidget(
                        image: productData.images[0],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            productData.name,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              deleteProduct(productData.id);
                            },
                            icon: const Icon(Icons.delete_outlined))
                      ],
                    )
                  ],
                );
              })),
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
