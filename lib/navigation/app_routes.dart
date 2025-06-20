import 'package:flutter/cupertino.dart';
import 'package:qr_generator_flutter/data/model/qr_model/qr_model.dart';

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
  final String? id;
  final QrModel? qrModel;

  const QrCreateRoute({this.id, this.qrModel,})
      : super(path: '/qr-create');
}