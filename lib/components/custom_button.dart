import 'package:events_app_flutter/constants/customStyling.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 176),
      decoration: const BoxDecoration(
          color: customPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(customRadius))),
      child: const Center(
        child: Text(
          "Click Me",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
