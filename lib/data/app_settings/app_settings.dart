import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';

@freezed
class AppSettings with _$AppSettings {
  final Locale locale;
  final ThemeMode themeMode;
  final Color colorSchemeSeed;
  final bool notificationsEnabled;

  const AppSettings({
    this.locale = const Locale('en'),
    this.themeMode = ThemeMode.dark,
    this.colorSchemeSeed = Colors.blue,
    this.notificationsEnabled = true,
  });
}
