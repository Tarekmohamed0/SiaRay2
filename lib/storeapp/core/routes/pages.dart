import 'package:flutter/material.dart';
import '../../features/product/presentation/pages/home.dart';
import '../../features/product/presentation/pages/update_product.dart';
import '../error/error.dart';

import 'routes.dart';

class AppRoute {
  static Route<dynamic> generate(RouteSettings? settings) {
    switch (settings?.name) {
      case RoutesName.home:
        // return const PageFadeTransition(child: HomePage()).build;
        return MaterialPageRoute(builder: (_) => const HomeProduct());

      case RoutesName.updateProduct:
        return MaterialPageRoute(builder: (_) => UpdateProduct());
      default:
        // If there is no such named route in the switch statement
        throw const RouteException('Route not found!');
    }
  }
}
