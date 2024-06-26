import 'package:ec/feature/account/services/account_services.dart';
import 'package:ec/feature/account/widgets/top_widgets.dart';
import 'package:flutter/material.dart';

class TopSection extends StatefulWidget {
  const TopSection({super.key});

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  AccountServices accountServices = AccountServices();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            TopWidget(
              text: "Your Orders",
              ontap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            TopWidget(
              text: "True Seller",
              ontap: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            TopWidget(
              text: "Log Out",
              ontap: () => accountServices.logOut(context),
            ),
            const SizedBox(
              height: 10,
            ),
            TopWidget(
              text: "Wish list",
              ontap: () {},
            ),
          ],
        )
      ],
    );
  }
}
