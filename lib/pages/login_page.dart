import 'package:events_app_flutter/components/custom_button.dart';
import 'package:events_app_flutter/components/square_tile.dart';
import 'package:events_app_flutter/components/text_divider.dart';
import 'package:events_app_flutter/constants/customStyling.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/input_textfield.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    // Show loader while signing in
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing dialog by tapping outside
      builder: (context) => const Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(),
        ),
      ),
    );

    // Log in to Firebase
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      // Close the loader dialog if there's an error
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }

      // Show alert dialog with error message
      if (e.code == 'user-not-found') {
        alertPopup("Error", "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        alertPopup("Error", "Wrong password provided for that user.");
      }
    } finally {
      // Ensure the dialog is closed after the login attempt
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    }
  }

  //* popup is not working on chrome, try again when using emulator
  void alertPopup(String title, String message) {
    // Show error popup
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the alert dialog
            },
            child: const Text('OK'),
          ),
        ],
      ),
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
