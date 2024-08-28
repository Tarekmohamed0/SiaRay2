import 'package:first_project/Doctor_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextStyle {
  static const TextStyle font24Black700Weight = TextStyle(
    fontSize:
        24, // Ensure 'fontSize' is recognized from 'flutter/material.dart'
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: ColorsManager.mainBlue,
  );
}
