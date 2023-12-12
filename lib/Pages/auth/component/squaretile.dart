import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  void Function()? onTap;
  final String imagePath;
  SquareTile({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Image.asset(
          imagePath,
          height: 40,
        ),
      ),
    );
  }
}
