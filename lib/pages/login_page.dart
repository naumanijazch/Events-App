import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 221, 221),
      body: SafeArea(
        child: Column(
          children: const [
            // App name title
            SizedBox(height: 100),
            Center(
              child: Text(
                "Events Application",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
            )

            // email input

            // password input

            // forgot password

            // login button

            // dont have an account? sign in

            // continue with google auth
          ],
        ),
      ),
    ); // Scaffold
  }
}
