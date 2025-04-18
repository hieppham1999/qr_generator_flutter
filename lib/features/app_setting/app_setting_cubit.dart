import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_generator_flutter/features/app_setting/app_setting.dart';
import 'package:qr_generator_flutter/features/app_state.dart';

typedef AppSettingState = NormalState<AppSettings>;

@singleton
class SettingsCubit extends Cubit<CubitState<AppSettings>> {
  SettingsCubit() : super(NormalState<AppSettings>());


  void changeLocale(Locale locale) {
    emit(state.state?.copyWith(locale: locale) as CubitState<AppSettings>);
  }

  void toggleTheme(ThemeMode mode) {
    emit(state.state?.copyWith(themeMode: mode) as CubitState<AppSettings>);
  }

  void setNotifications(bool enabled) {
    emit(state.state?.copyWith(notificationsEnabled: enabled) as CubitState<AppSettings>);
  }
}
