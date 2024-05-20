import 'package:cloudinary_url_gen/transformation/resize/pad.dart';
import 'package:ec/constants/global_variable.dart';
import 'package:ec/feature/auth/widgets/common/custom_button.dart';
import 'package:ec/feature/auth/widgets/common/custom_textfield.dart';
import 'package:ec/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = "Address-screen";
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController _houseController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  final _signupFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _houseController.dispose();
    _streetController.dispose();
    _pinController.dispose();
    _cityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var address = context.watch<UserProvider>().user.address;
    const String address = "tos os adres";

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
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              children: [
                Form(
                  key: _signupFormKey,
                  child: Column(
                    children: [
                      if (address.isNotEmpty)
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  address,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                "OR",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      CustomTextField(
                        controller: _houseController,
                        txt: "House No",
                      ),
                      CustomTextField(
                        controller: _streetController,
                        txt: "Area Street",
                      ),
                      CustomTextField(
                        controller: _pinController,
                        txt: "Pincode",
                      ),
                      CustomTextField(
                        controller: _cityController,
                        txt: "Town City",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          text: "Signup",
                          onTap: () {
                            if (_signupFormKey.currentState!.validate()) {
                              print("do");
                            }
                          }),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
