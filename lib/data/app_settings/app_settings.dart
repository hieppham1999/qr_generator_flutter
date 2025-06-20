import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_generator_flutter/data/model/app_language/app_language.dart';

part 'app_settings.freezed.dart';

@freezed
abstract class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(AppLanguage.english) AppLanguage language,
    @Default(ThemeMode.dark) ThemeMode themeMode,
    @Default(Colors.purple) Color colorSchemeSeed,
    @Default(true) bool notificationsEnabled,
  }) = _AppSettings;
}
