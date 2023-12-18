import 'package:azeala_hotel/Pages/auth/auth_page.dart';
import 'package:azeala_hotel/Pages/auth/signin.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/Alojnafaketoproof.jpg"),
                fit: BoxFit.cover,
              )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 285.0, bottom: 40),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AuthPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
