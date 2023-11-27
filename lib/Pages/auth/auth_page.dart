import 'package:azeala_hotel/Pages/auth/signin.dart';
import 'package:azeala_hotel/Pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //if the user is logged In
          if (snapshot.hasData) {
            return HomePage();
          }

          // if the user is not login In

          else {
            return SignIn();
          }
        },
      ),
    );
  }
}
