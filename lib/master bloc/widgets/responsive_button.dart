import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  ResponsiveButton({super.key, this.isresponsive = false, this.width});
  bool? isresponsive;
  double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: const Center(
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
