import 'package:flutter/material.dart';
import 'package:qr_generator_flutter/base/bloc_state_builder.dart';
import 'package:qr_generator_flutter/core/languages.dart';
import 'package:qr_generator_flutter/data/model/app_language/app_language.dart';
import 'package:qr_generator_flutter/data/model/app_settings/app_settings.dart';
import 'package:qr_generator_flutter/di/injection.dart';
import 'package:qr_generator_flutter/presentation/features/app_setting/app_setting_cubit.dart';
import 'package:qr_generator_flutter/presentation/widgets/app_dropdown.dart';
import 'package:qr_generator_flutter/presentation/widgets/app_scaffold.dart';
import 'package:qr_generator_flutter/presentation/widgets/app_tile.dart';
import 'package:qr_generator_flutter/presentation/widgets/color_picker_dot.dart';

class AppSettingPage extends StatefulWidget {
  const AppSettingPage({super.key});

  @override
  State<AppSettingPage> createState() => _AppSettingPageState();
}

class _AppSettingPageState extends State<AppSettingPage> {

  final cubit = getIt.get<SettingsCubit>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(Languages.translate.settings),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CubitStateBuilder<AppSettings>(
          cubit: cubit,
          builder: (_, state) {
            return Column(
              children: [
                AppTile(
                  label: Languages.translate.language,
                  trailing: AppDropdown<AppLanguage>(
                    items: AppLanguage.values,
                    value: state.language,
                    onChanged: (AppLanguage? value) {
                      if (value == null) return;
                      cubit.changeLocale(value);
                      },
                    itemBuilder: (AppLanguage item) {
                      return Text(item.displayName);
                    },
                  ),
                ),

                SizedBox(height: 8),

                AppTile(
                  label: Languages.translate.darkMode,
                  trailing: AppDropdown<ThemeMode>(
                    items: ThemeMode.values,
                    value: state.themeMode,
                    onChanged: (ThemeMode? value) {
                      if (value == null) return;
                      cubit.toggleTheme(value);
                    },
                    itemBuilder: (ThemeMode item) {
                      return Text(item.name);
                    },
                  ),
                ),

                SizedBox(height: 8),

                AppTile(
                  label: Languages.translate.themeColor,
                  trailing: ColorPickerDot(
                    selectedColor: state.colorSchemeSeed,
                    onChanged: (color) {
                      cubit.changeColorSeed(color);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
