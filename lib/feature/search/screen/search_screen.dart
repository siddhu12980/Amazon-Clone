import 'package:ec/constants/global_variable.dart';
import 'package:ec/feature/search/screen/services/search_services.dart';
import 'package:ec/feature/search/screen/widgets/search_products.dart';
import 'package:ec/models/product_model.dart';
import 'package:ec/product_details/screen/product_details_screen.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "/search-screen";
  final String searchQuery;

  const SearchScreen({super.key, required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchServices services = SearchServices();
  List<Product>? productList;

  void fetchdata(searchQuery) async {
    productList = await services.fetchSearchProduct(
        context: context, serchQuery: searchQuery);
    setState(() {});

    print((productList!.length));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata(widget.searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    return productList == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: AppBar(
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: GlobalVariable.appBarGradient,
                  ),
                ),
              ),
            ),
            body: SizedBox(
              child: ListView.builder(
                itemCount: productList!.length,
                itemBuilder: (BuildContext context, int index) {
                  final productData = productList![index];
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, ProductDetailScreen.routeName,
                            arguments: productData);
                      },
                      child: SearchProduct(product: productData));
                },
              ),
            ));
  }
}
