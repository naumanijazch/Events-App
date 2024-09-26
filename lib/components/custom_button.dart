import 'package:events_app_flutter/constants/customStyling.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2),
      decoration: const BoxDecoration(
        color: customPrimaryColor,
        borderRadius: BorderRadius.all(Radius.circular(customRadius)),
      ),
      child: const Center(
        child: FittedBox(
          // Ensures the text resizes to fit the container
          child: Text(
            "Log In",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
