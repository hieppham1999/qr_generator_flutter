import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppSettings extends Equatable {
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

  AppSettings copyWith({
    Locale? locale,
    ThemeMode? themeMode,
    Color? colorSchemeSeed,
    bool? notificationsEnabled,
  }) {
    return AppSettings(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
      colorSchemeSeed: colorSchemeSeed ?? this.colorSchemeSeed,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }

  @override
  List<Object?> get props => [
    locale,
    themeMode,
    colorSchemeSeed,
    notificationsEnabled,
  ];
}
