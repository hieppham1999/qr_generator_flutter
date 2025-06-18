import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_generator_flutter/navigation/app_routes.dart';
import 'package:qr_generator_flutter/presentation/features/app_setting/app_setting_page.dart';
import 'package:qr_generator_flutter/presentation/features/main_screen/main_screen.dart';
import 'package:qr_generator_flutter/presentation/features/qr_create/qr_create_page.dart';
import 'package:qr_generator_flutter/presentation/features/qr_scan/qr_scanner_page.dart';
import 'package:qr_generator_flutter/utils/app_logger.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    final logger = GetIt.I<AppLogger>();
    logger.i("Try to open route \"${settings.name}\" with args $args");

    if (args is! AppRoutes) {
      // handle the first page
      if (settings.name == '/') {
        return MaterialPageRoute(builder: (_) => MainScreen());
      }
      return _errorRoute();
    }

    switch (args) {
      case HomeRoute():
          return MaterialPageRoute(builder: (_) => MainScreen());
      case SettingsRoute():
          return MaterialPageRoute(builder: (_) => const AppSettingPage());
      case QrScanRoute():
        return MaterialPageRoute(builder: (_) => QrScannerPage());
      case QrCreateRoute():
        return MaterialPageRoute(
          builder:
              (_) =>
              QrCreatePage(
                qrModel: args.qrModel,
              ),
        );
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