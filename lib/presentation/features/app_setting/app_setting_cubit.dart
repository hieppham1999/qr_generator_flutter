import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_generator_flutter/base/base_cubit.dart';
import 'package:qr_generator_flutter/data/app_settings/app_settings.dart';
import 'package:qr_generator_flutter/data/model/app_language/app_language.dart';

@singleton
class SettingsCubit extends BaseCubit<AppSettings> {
  SettingsCubit() : super.normal(AppSettings());

  void changeLocale(AppLanguage language) {
    emitNormal(currentData.copyWith(language: language));

  }

  void toggleTheme(ThemeMode mode) {
    emitNormal(currentData.copyWith(themeMode: mode));
  }

  void changeColorSeed(Color color) {
    emitNormal(currentData.copyWith(colorSchemeSeed: color));

  }

  void setNotifications(bool enabled) {
    emitNormal(currentData.copyWith(notificationsEnabled: enabled));
  }
}
