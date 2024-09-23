import 'package:flutter/material.dart';

extension NavigatorExtention on BuildContext {
  void navigateTo(Widget Widget) {
    Navigator.push(this, MaterialPageRoute(builder: (BuildContext context) {
      return Widget;
    }));
  }
}
