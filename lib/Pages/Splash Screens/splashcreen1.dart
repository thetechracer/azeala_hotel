import 'package:flutter/material.dart';

class Splashscreen1 extends StatelessWidget {
  Splashscreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/Alojnafakefront.jpg"),
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
