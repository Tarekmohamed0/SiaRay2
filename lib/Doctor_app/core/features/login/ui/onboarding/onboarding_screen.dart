import 'package:first_project/Doctor_app/core/features/login/ui/onboarding/widgets/Doc_logo_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
        child: const Column(
          children: [
            DocLogoName(),
          ],
        ),
      ),
    )));
  }
}
