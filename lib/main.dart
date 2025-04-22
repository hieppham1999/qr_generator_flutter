import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qr_generator_flutter/core/theme.dart';
import 'package:qr_generator_flutter/core/typography.dart';
import 'package:qr_generator_flutter/di/injection.dart';
import 'package:qr_generator_flutter/features/app_setting/app_setting_cubit.dart';
import 'package:qr_generator_flutter/features/home/home_page.dart';
import 'package:qr_generator_flutter/widgets/bloc_state_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() async {
  await configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final settingCubit = getIt.get<SettingsCubit>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocStateBuilder(
      cubit: settingCubit,

      builder: (_,_) => MaterialApp(
        title: 'QR Generator Flutter',

        debugShowCheckedModeBanner: false,
        themeMode: settingCubit.appSettings.themeMode,
        theme: AppTheme.light(seedColor: settingCubit.appSettings.colorSchemeSeed),
        darkTheme: AppTheme.dark(seedColor: settingCubit.appSettings.colorSchemeSeed),
        locale: settingCubit.appSettings.locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: HomePage(),
      ),
    );
  }
}