import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';

@freezed
abstract class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(Locale('en')) Locale locale,
    @Default(ThemeMode.dark) ThemeMode themeMode,
    @Default(Colors.purple) Color colorSchemeSeed,
    @Default(true) bool notificationsEnabled,
  }) = _AppSettings;
}
