import 'package:events_app_flutter/components/custom_button.dart';
import 'package:events_app_flutter/components/square_tile.dart';
import 'package:events_app_flutter/components/text_divider.dart';
import 'package:events_app_flutter/constants/customStyling.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/input_textfield.dart';

class SigninPage extends StatefulWidget {
  final Function()? onTap;
  SigninPage({super.key, required this.onTap});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  void signUserUp() async {
    // Validate password before proceeding
    if (passwordConfirmController.text != passwordController.text) {
      alertPopup("Error", "Passwords do not match");
      return;
    }

    // Show loader while signing up
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

    // Sign up in Firebase
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      // Optionally, navigate to the home page or another relevant screen
    } on FirebaseAuthException catch (e) {
      // Close the loader dialog if there's an error
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }

      // Show alert dialog with error message
      if (e.code == 'email-already-in-use') {
        alertPopup("Error", "The email is already in use.");
      } else if (e.code == 'invalid-email') {
        alertPopup("Error", "The email address is not valid.");
      } else if (e.code == 'weak-password') {
        alertPopup("Error", "The password is too weak.");
      } else {
        alertPopup("Error", "Something went wrong. Please try again.");
      }
    } finally {
      // Ensure the dialog is closed after the sign-up attempt
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    }
  }

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
        child: SingleChildScrollView(
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

              // confirm password input
              const SizedBox(height: 40),
              InputTextfield(
                controller: passwordConfirmController,
                customLabelText: "Confirm your Password",
                obscureText: true,
              ),

              // sign-up button
              const SizedBox(height: 40),
              CustomButton(onTap: signUserUp, textPrompt: "Sign Up"),

              // divider
              const SizedBox(height: 40),
              const TextDivider("Or Continue with"),

              // continue with google auth
              const SizedBox(height: 40),
              const SquareTile(
                imagePath: 'assets/googleLogo.png',
                tileText: "Continue with Google",
              ),

              // already have an account? log in
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Log In", // Fix text here
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
      ),
    ); // Scaffold
  }
}
