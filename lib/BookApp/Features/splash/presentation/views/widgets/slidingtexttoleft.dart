import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

class slidingtextToleft extends StatelessWidget {
  const slidingtextToleft({
    super.key,
    required this.slidinganimationtoleft,
  });

  final Animation<Offset> slidinganimationtoleft;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidinganimationtoleft,
        builder: (context, _) {
          return SlideTransition(
            position: slidinganimationtoleft,
            child: const Text(
              TextinApp.appName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          );
        });
  }
}
