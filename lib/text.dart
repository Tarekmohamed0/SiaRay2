import 'package:flutter/material.dart';

class Textt extends StatelessWidget {
  const Textt({
    super.key,
    required this.text,
    required this.style,
    required this.fontSize,
  });
  final String text;
  final TextStyle style;

  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Textt(text: text, style: style, fontSize: fontSize ?? 16);
  }
}
