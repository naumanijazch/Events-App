import 'package:events_app_flutter/constants/customStyling.dart';
import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final String tileText;

  const SquareTile({
    super.key,
    required this.imagePath,
    required this.tileText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2),
      decoration: BoxDecoration(
        color: customBorderColor,
        borderRadius: BorderRadius.circular(customRadius),
      ),
      child: Row(
        // Using Row to display image and text side by side
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 40,
          ),
          const SizedBox(width: 10),
          Text(tileText),
        ],
      ),
    );
  }
}
