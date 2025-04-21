import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_generator_flutter/features/app_setting/app_setting.dart';
import 'package:qr_generator_flutter/data/app_state.dart';

typedef AppSettingState = NormalState<AppSettings>;

@singleton
class SettingsCubit extends Cubit<CubitState<AppSettings>> {
  SettingsCubit() : super(NormalState<AppSettings>(AppSettings()));


  void changeLocale(Locale locale) {
    emit(CubitState.normal(state.data?.copyWith(locale: locale) ?? AppSettings()));
  }

  void toggleTheme(ThemeMode mode) {
    emit(CubitState.normal(state.data?.copyWith(themeMode: mode) ?? AppSettings()));
  }

  void changeColorSeed(Color color) {
    emit(CubitState.normal(state.data?.copyWith(colorSchemeSeed: color) ?? AppSettings()));
  }

  void setNotifications(bool enabled) {
    emit(CubitState.normal(state.data?.copyWith(notificationsEnabled: enabled) ?? AppSettings()));
  }
}
