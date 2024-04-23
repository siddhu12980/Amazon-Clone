import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ec/constants/global_variable.dart';
import 'package:ec/constants/utils.dart';
import 'package:ec/feature/auth/widgets/common/custom_button.dart';
import 'package:ec/feature/auth/widgets/common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-prod-screen';

  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  List<File> images = [];

  final TextEditingController _prod_name = TextEditingController();
  final TextEditingController _prod_desc = TextEditingController();

  final TextEditingController _prod_price = TextEditingController();

  final TextEditingController _prod_quantity = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _prod_desc.dispose();
    _prod_name.dispose();
    _prod_price.dispose();
    _prod_quantity.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String catogery = 'Mobiles';
    List<String> prodCatogries = [
      'Mobiles',
      'Essentials',
      'Appliances',
      'Books',
      'Fashion'
    ];

    void selectImages() async {
      var res = await pickImages();
      setState(() {
        images = res;
      });
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariable.appBarGradient,
              ),
            ),
            title: const Text(
              "Add a Product",
              style: TextStyle(color: Colors.black),
            )),
      ),
      body: SingleChildScrollView(
          child: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: selectImages,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [20, 4],
                  // strokeCap: StrokeCap.round,
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        images.isEmpty
                            ? const Icon(Icons.folder_open_outlined)
                            : CarouselSlider(
                                items: images.map((e) {
                                  return Builder(
                                      builder: ((BuildContext context) =>
                                          Image.file(
                                            e,
                                            fit: BoxFit.contain,
                                            height: 100,
                                          )));
                                }).toList(),
                                options: CarouselOptions(
                                    viewportFraction: 1, height: 150),
                              ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Select Product Images",
                          style: TextStyle(
                              fontSize: 20, color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(controller: _prod_name, txt: "Product Name"),
              CustomTextField(
                controller: _prod_desc,
                txt: "description",
                maxlines: 8,
              ),
              CustomTextField(controller: _prod_price, txt: "Price"),
              CustomTextField(controller: _prod_quantity, txt: "Quantity"),
              SizedBox(
                child: DropdownButton(
                  value: catogery,
                  icon: Icon(Icons.arrow_downward_outlined),
                  items: prodCatogries.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                  onChanged: (newVal) {
                    setState(() {
                      catogery = newVal!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(text: "Sell", onTap: () {})
            ],
          ),
        ),
      )),
    );
  }
}
