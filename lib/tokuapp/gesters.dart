import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class trippletap extends StatelessWidget {
  const trippletap({
    super.key,
    required this.ontrippletap,
    required this.child,
  });
  final VoidCallback ontrippletap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Triple Tap Gesture'),
      ),
      body: Center(
        child: RawGestureDetector(
          gestures: {
            SerialTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<
                SerialTapGestureRecognizer>(
              () => SerialTapGestureRecognizer(),
              (SerialTapGestureRecognizer instance) {
                instance.onSerialTapDown = (SerialTapDownDetails details) {
                  if (details.count == 3) {
                    ontrippletap();
                  }
                };
              },
            ),
          },
          child: child,
        ),
      ),
    );
  }
}
