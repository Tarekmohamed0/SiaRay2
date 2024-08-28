import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Container(
          child: Column(
            children: [
              Text('Register Screen'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/loginScreen');
                },
                child: Text('Go to Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
