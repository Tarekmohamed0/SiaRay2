import 'package:first_project/tokuapp/screens/tokuhome.dart';
import 'package:flutter/material.dart';

class Tokuapp extends StatelessWidget {
  const Tokuapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'tokuapp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Tokuhome(),
    );
  }
}
