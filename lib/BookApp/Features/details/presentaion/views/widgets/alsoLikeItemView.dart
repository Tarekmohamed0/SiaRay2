import 'package:flutter/material.dart';

class Alsolikeitemview extends StatelessWidget {
  const Alsolikeitemview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
