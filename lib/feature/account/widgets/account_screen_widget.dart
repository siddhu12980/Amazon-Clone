import 'package:ec/constants/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ec/provider/user_provider.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariable.appBarGradient,
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          RichText(
            text: const TextSpan(
              text: "Hello, ",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          RichText(
            text: TextSpan(
              text: user.name,
              style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
