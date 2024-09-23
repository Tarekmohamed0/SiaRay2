import 'package:flutter/material.dart';

import 'widgets/splash_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.purple),
      home: const Scaffold(
        body: const SplashView(),
      ),
    );
  }
}
