import 'package:flutter/material.dart';
import 'package:qr_generator_flutter/base/bloc_state_builder.dart';
import 'package:qr_generator_flutter/data/app_settings/app_settings.dart';
import 'package:qr_generator_flutter/data/model/app_language/app_language.dart';
import 'package:qr_generator_flutter/di/injection.dart';
import 'package:qr_generator_flutter/presentation/features/app_setting/app_setting_cubit.dart';
import 'package:qr_generator_flutter/presentation/widgets/app_dropdown.dart';
import 'package:qr_generator_flutter/presentation/widgets/app_tile.dart';
import 'package:qr_generator_flutter/presentation/widgets/color_picker_dot.dart';

class AppSettingPage extends StatelessWidget {
  const AppSettingPage({super.key});

  @override
  Widget build(BuildContext context) {

    final cubit = getIt.get<SettingsCubit>();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CubitStateBuilder<AppSettings>(
          cubit: cubit,
          builder: (_, state) {
            return Column(
              children: [
                AppTile(
                  label: 'Language',
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
                  label: 'Theme mode',
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
                  label: 'Theme color',
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
