// import 'package:cloudinary_url_gen/transformation/resize/pad.dart';
import 'package:ec/constants/global_variable.dart';
import 'package:ec/feature/auth/widgets/common/custom_button.dart';
import 'package:ec/feature/auth/widgets/common/custom_textfield.dart';
import 'package:ec/provider/user_provider.dart';
// import 'package:ec/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = "Address-screen";
  final String totalAmount;

  const AddressScreen({super.key, required this.totalAmount});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

const String defaultGooglePay = '''{
  "provider": "google_pay",
  "data": {
    "environment": "TEST",
    "apiVersion": 2,
    "apiVersionMinor": 0,
    "allowedPaymentMethods": [
      {
        "type": "CARD",
        "tokenizationSpecification": {
          "type": "PAYMENT_GATEWAY",
          "parameters": {
            "gateway": "example",
            "gatewayMerchantId": "gatewayMerchantId"
          }
        },
        "parameters": {
          "allowedCardNetworks": ["VISA", "MASTERCARD"],
          "allowedAuthMethods": ["PAN_ONLY", "CRYPTOGRAM_3DS"],
          "billingAddressRequired": true,
          "billingAddressParameters": {
            "format": "FULL",
            "phoneNumberRequired": true
          }
        }
      }
    ],
    "merchantInfo": {
      "merchantId": "01234567890123456789",
      "merchantName": "Example Merchant Name"
    },
    "transactionInfo": {
      "countryCode": "US",
      "currencyCode": "USD"
    }
  }
}''';

const _paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '299',
    status: PaymentItemStatus.final_price,
  )
];

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
    void onGooglePayResult(paymentResult) {
      // Send the resulting Google Pay token to your server / PSP
      print(paymentResult);
    }

    var address = context.watch<UserProvider>().user.address;

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
                      GooglePayButton(
                        width: double.infinity,
                        paymentConfiguration:
                            PaymentConfiguration.fromJsonString(
                                defaultGooglePay),
                        paymentItems: _paymentItems,
                        type: GooglePayButtonType.buy,
                        margin: const EdgeInsets.only(top: 15.0),
                        onPaymentResult: onGooglePayResult,
                        loadingIndicator: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
