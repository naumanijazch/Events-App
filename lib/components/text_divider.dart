import 'package:flutter/material.dart';

import '../constants/customStyling.dart';

class TextDivider extends StatelessWidget {
  final String dividerText;

  const TextDivider(String s, {super.key, this.dividerText = "Or"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              thickness: 0.75,
              color: customBorderColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(dividerText),
          ),
          const Expanded(
            child: Divider(
              thickness: 0.75,
              color: customBorderColor,
            ),
          ),
        ],
      ),
    );
  }
}
