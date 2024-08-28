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
              Text('Login Screen'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/onBoardingScreen');
                },
                child: Text('Go to Onboarding'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
