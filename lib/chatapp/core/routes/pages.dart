import 'package:first_project/chatapp/features/login/presentation/pages/login_screen.dart';
import 'package:first_project/chatapp/features/register/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';
import '../../features/chat/presentation/pages/caht_screen.dart';
import '../error/error.dart';

import 'routes.dart';

class AppRoute {
  static Route<dynamic> generate(RouteSettings? settings) {
    switch (settings?.name) {
      case RoutesName.login:
        // return const PageFadeTransition(child: HomePage()).build;
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case RoutesName.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      case RoutesName.chat:
        return MaterialPageRoute(builder: (_) => const CahtScreen());
      default:
        // If there is no such named route in the switch statement
        throw const RouteException('Route not found!');
    }
  }
}
