import 'package:events_app_flutter/pages/signin_page.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class LoginOrRegisteredPage extends StatefulWidget {
  const LoginOrRegisteredPage({super.key});
  @override
  State<LoginOrRegisteredPage> createState() => _LoginOrRegisteredPageState();
}

class _LoginOrRegisteredPageState extends State<LoginOrRegisteredPage> {
  bool showLoginPage = true;

  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePage);
    } else {
      return SigninPage(onTap: togglePage);
    }
  }
}
