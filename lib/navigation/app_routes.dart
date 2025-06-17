import 'package:flutter/cupertino.dart';

sealed class AppRoutes {
  final String path;
  const AppRoutes({required this.path});
}

class HomeRoute extends AppRoutes {
  const HomeRoute() : super(path: '/');
}

class SettingsRoute extends AppRoutes {
  const SettingsRoute() : super(path: '/settings');
}

class QrScanRoute extends AppRoutes {
  const QrScanRoute() : super(path: '/qr-scan');
}

class QrCreateRoute extends AppRoutes {
  final String? qrContent;

  const QrCreateRoute({this.qrContent,})
      : super(path: '/qr-create');
}