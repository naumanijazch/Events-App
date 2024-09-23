import 'package:flutter/material.dart';
import 'package:events_app_flutter/constants/customStyling.dart';

class InputTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String customLabelText;
  final bool obscureText;

  const InputTextfield({
    super.key,
    required this.controller,
    required this.customLabelText,
    this.obscureText = false,
  });

  @override
  _InputTextfieldState createState() => _InputTextfieldState();
}

class _InputTextfieldState extends State<InputTextfield> {
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        controller: widget.controller,
        obscureText: _isObscured,
        decoration: InputDecoration(
          labelText: widget.customLabelText,
          labelStyle: const TextStyle(
            color: customPlaceholderColor, // Use global placeholder color
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(customRadius)),
            borderSide: BorderSide(
              color: customBorderColor, // Use global border color
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(customRadius)),
            borderSide: BorderSide(
              color: customPrimaryColor, // Use global focused color
            ),
          ),

          // If obscureText is true, show the eye icon to toggle visibility
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null, // If not obscureText, no icon
        ),
      ),
    );
  }
}
