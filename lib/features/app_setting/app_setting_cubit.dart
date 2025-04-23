import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_generator_flutter/data/app_settings/app_settings.dart';
import 'package:qr_generator_flutter/data/app_state.dart';

@singleton
class SettingsCubit extends Cubit<CubitState> {
  SettingsCubit() : super(NormalState());

  AppSettings appSettings = AppSettings();

  void changeLocale(Locale locale) {
    appSettings = appSettings.copyWith(locale: locale);
    emit(NormalState());
  }

  void toggleTheme(ThemeMode mode) {
    appSettings = appSettings.copyWith(themeMode: mode);
    emit(NormalState());
  }

  void changeColorSeed(Color color) {
    appSettings = appSettings.copyWith(colorSchemeSeed: color);
    emit(NormalState());
  }

  void setNotifications(bool enabled) {
    appSettings = appSettings.copyWith(notificationsEnabled: enabled);
    emit(NormalState());
  }
}
