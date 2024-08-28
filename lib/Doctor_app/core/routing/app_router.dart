import 'package:first_project/Doctor_app/core/features/login/ui/login/login_screen.dart';
import 'package:first_project/Doctor_app/core/features/login/ui/onboarding/onboarding_screen.dart';
import 'package:first_project/Doctor_app/core/features/login/ui/register/register_screen.dart';
import 'package:first_project/Doctor_app/core/routing/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  get initialRoute => null;

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
