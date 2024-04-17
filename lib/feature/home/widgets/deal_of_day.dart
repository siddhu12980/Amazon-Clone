import 'package:flutter/material.dart';

class DealOfDayWidget extends StatefulWidget {
  const DealOfDayWidget({super.key});

  @override
  State<DealOfDayWidget> createState() => _DealOfDayWidgetState();
}

class _DealOfDayWidgetState extends State<DealOfDayWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: const Text(
            "Deal of the Day",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          child: Image.network(
            'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
            fit: BoxFit.fitHeight,
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10),
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            "price : 199\$",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Description : This is a new Macbook Pro",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
                fit: BoxFit.fitWidth,
                height: 150,
                width: 150,
              ),
              Image.network(
                'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
                fit: BoxFit.fitWidth,
                height: 150,
                width: 150,
              ),
              Image.network(
                'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
                fit: BoxFit.fitWidth,
                height: 150,
                width: 150,
              ),
              Image.network(
                'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
                fit: BoxFit.fitWidth,
                height: 150,
                width: 150,
              ),
              Image.network(
                'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
                fit: BoxFit.fitWidth,
                height: 150,
                width: 150,
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 15,
            left: 15,
            bottom: 15,
          ),
          alignment: Alignment.topLeft,
          child: Text(
            "See All Deals ",
            style: TextStyle(color: Colors.cyan[800]),
          ),
        )
      ],
    );
  }
}
