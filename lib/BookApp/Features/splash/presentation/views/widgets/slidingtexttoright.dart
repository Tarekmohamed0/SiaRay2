import 'package:flutter/material.dart';

class slidingtextToright extends StatelessWidget {
  const slidingtextToright({
    super.key,
    required this.slidinganimation,
  });

  final Animation<Offset> slidinganimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidinganimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidinganimation,
            child: const Text(
              'Get Your Book For Free And Enjoy',
              style: TextStyle(fontWeight: FontWeight.w200, fontSize: 20),
            ),
          );
        });
  }
}
