import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:qr_generator_flutter/core/keys.dart';
import 'package:qr_generator_flutter/data/model/app_settings/app_settings.dart';
import 'package:qr_generator_flutter/utils/app_shared_preference.dart';

abstract class AppSettingRepository {
  Future<void> setAppSetting(AppSettings settings);

  AppSettings? getAppSetting();
}

@Injectable(as: AppSettingRepository)
class AppSettingRepositoryImpl implements AppSettingRepository {
  @override
  AppSettings? getAppSetting() {
    try {
      return AppSettings.fromJson(
        jsonDecode(prefs.getString(AppKey.appSetting) ?? ''),
      );
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<void> setAppSetting(AppSettings settings) async {
    prefs.setString(AppKey.appSetting, jsonEncode(settings.toJson()));
  }
}
