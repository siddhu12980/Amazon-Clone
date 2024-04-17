import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopWidget extends StatefulWidget {
  final String text;
  final VoidCallback ontap;
  const TopWidget({super.key, required this.text, required this.ontap});

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        height: 40,
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black12.withOpacity(0.03),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: widget.ontap,
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
