import 'package:flutter/material.dart';
import 'package:qr_generator_flutter/core/typography.dart';

class AppTheme {
  static ThemeData light({Color? seedColor}) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: seedColor ?? Colors.blue,
    );
  }

  static ThemeData dark({Color? seedColor}) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: seedColor ?? Colors.blueGrey,
    );
  }
}