import 'package:ec/constants/global_variable.dart';
import 'package:ec/feature/account/widgets/single_product_widget.dart';
import 'package:ec/feature/home/services/home_services.dart';
import 'package:ec/models/product_model.dart';
import 'package:ec/product_details/screen/product_details_screen.dart';
import 'package:flutter/material.dart';

class CatogeryScreen extends StatefulWidget {
  static const String routeName = '/catogery-screen';
  final String catogery;
  const CatogeryScreen({super.key, required this.catogery});

  @override
  State<CatogeryScreen> createState() => _CatogeryScreenState();
}

class _CatogeryScreenState extends State<CatogeryScreen> {
  List<Product> prodlist = [];
  HomeServices services = HomeServices();

  void fetchproduct(BuildContext context) async {
    prodlist = await services.fetchCatogeryProduct(
        context: context, catogery: widget.catogery);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchproduct(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariable.appBarGradient,
              ),
            ),
            title: Text(
              widget.catogery,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: prodlist == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Keep Shopping for ${widget.catogery}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 165,
                    child: GridView.builder(
                      padding: EdgeInsets.only(left: 16),
                      itemCount: prodlist.length,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 1.4,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        final productData = prodlist[index];
                        return GestureDetector(
                          onTap: () => {
                            Navigator.pushNamed(
                                context, ProductDetailScreen.routeName,
                                arguments: productData)
                          },
                          child: Column(children: [
                            SizedBox(
                              height: 145,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 0.5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Image.network(productData.images[0]),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        productData.name,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ]),
                            ),
                          ]),
                        );
                      },
                    ),
                  )
                ],
              ));
  }
}
