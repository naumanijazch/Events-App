import 'package:events_app_flutter/components/custom_button.dart';
import 'package:events_app_flutter/components/input_textfield.dart';
import 'package:events_app_flutter/components/square_tile.dart';
import 'package:events_app_flutter/components/text_divider.dart';
import 'package:events_app_flutter/constants/customStyling.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'forgot_password.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBackgroundColor, // Use global background color
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(height: 75),
            InputTextfield(
              controller: emailController,
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
            const SizedBox(height: 40),
            CustomButton(onTap: signUserIn),

            // divider
            const SizedBox(height: 40),
            const TextDivider("Or Continue with"),

            // continue with google auth
            const SizedBox(height: 40),
            const SquareTile(
                imagePath: 'assets/googleLogo.png',
                tileText: "Continue with Google"),

            // don't have an account? sign up
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    // navigate to sign up page
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: customPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ); // Scaffold
  }
}
