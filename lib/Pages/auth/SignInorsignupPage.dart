import 'package:azeala_hotel/Pages/auth/signin.dart';
import 'package:azeala_hotel/Pages/auth/signup.dart';
import 'package:flutter/material.dart';

class SigninorsignupPage extends StatefulWidget {
  const SigninorsignupPage({super.key});

  @override
  State<SigninorsignupPage> createState() => _SigninorsignupPageState();
}

class _SigninorsignupPageState extends State<SigninorsignupPage> {
  bool showSignInPage = true;

  //toogle between login and register page
  void togglePages() {
    setState(() {
      showSignInPage = !showSignInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInPage) {
      return SignIn(
        onTap: togglePages,
      );
    } else {
      return SignUp(
        onTap: togglePages,
      );
    }
  }
}
