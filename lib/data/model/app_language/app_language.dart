import 'dart:ui';

import 'package:qr_generator_flutter/core/languages.dart';

enum AppLanguage {
  english(Locale('en')),
  vietnamese(Locale('vi'));

  const AppLanguage(this.locale);

  final Locale locale;

  String get displayName => switch(this) {
    AppLanguage.english => Languages.translate.english,
    AppLanguage.vietnamese => Languages.translate.vietnamese,
  };

  String get displayNativeName => switch(this) {
    AppLanguage.english => Languages.translate.english_native,
    AppLanguage.vietnamese => Languages.translate.vietnamese_native,
  };
}