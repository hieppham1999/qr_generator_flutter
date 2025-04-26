import 'package:flutter/material.dart';
import 'package:qr_generator_flutter/features/app_setting/app_setting_page.dart';
import 'package:qr_generator_flutter/features/home/home_page.dart';
import 'package:qr_generator_flutter/navigation/app_routes.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const AppSettingPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(child: Text('Page not found')),
      ),
    );
  }
}