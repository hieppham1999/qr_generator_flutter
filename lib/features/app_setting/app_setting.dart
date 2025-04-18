import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppSettings extends Equatable {
  final Locale locale;
  final ThemeMode themeMode;
  final bool notificationsEnabled;

  const AppSettings({
    this.locale = const Locale('en'),
    this.themeMode = ThemeMode.system,
    this.notificationsEnabled = true,
  });

  AppSettings copyWith({
    Locale? locale,
    ThemeMode? themeMode,
    bool? notificationsEnabled,
  }) {
    return AppSettings(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }

  @override
  List<Object?> get props => [locale, themeMode, notificationsEnabled];
}
