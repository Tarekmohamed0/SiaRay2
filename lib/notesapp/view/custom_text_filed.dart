import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  const customTextField({
    super.key,
    required this.hintText,
    required this.fillColor,
    required this.border,
    this.maxlines,
    this.onSaved,
  });
  final String? hintText;
  final fillColor;
  final border;
  final maxlines;
  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      maxLines: maxlines,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: fillColor,
        border: border,
      ),
    );
  }
}
