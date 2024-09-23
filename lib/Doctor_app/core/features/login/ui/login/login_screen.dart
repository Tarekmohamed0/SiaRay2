import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Container(
          child: Column(
            children: [
              const Text('Login Screen'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/onBoardingScreen');
                },
                child: const Text('Go to Onboarding'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
