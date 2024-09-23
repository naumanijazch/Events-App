import 'package:events_app_flutter/components/custom_button.dart';
import 'package:events_app_flutter/components/input_textfield.dart';
import 'package:events_app_flutter/constants/customStyling.dart';
import 'package:flutter/material.dart';

import 'forgot_password.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBackgroundColor, // Use global background color
      body: SafeArea(
        child: Column(
          children: [
            // App name title
            const SizedBox(height: 100),
            const Center(
              child: Text(
                "Events Application",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
            ),

            // email input
            const SizedBox(height: 60),
            InputTextfield(
              controller: usernameController,
              customLabelText: "Enter your Email",
              obscureText: false,
            ),

            // password input
            const SizedBox(height: 40),
            InputTextfield(
              controller: passwordController,
              customLabelText: "Enter your Password",
              obscureText: true,
            ),

            // forgot password
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage()),
                      );
                    },
                    child: const Text(
                      "Forgot Password?",
                    ),
                  ),
                ],
              ),
            ),

            // login button
            const SizedBox(height: 20),
            const CustomButton()

            // don't have an account? sign in

            // continue with google auth
          ],
        ),
      ),
    ); // Scaffold
  }
}
