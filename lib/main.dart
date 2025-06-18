import 'package:flutter/material.dart';
import 'package:qr_generator_flutter/core/theme.dart';
import 'package:qr_generator_flutter/data/app_settings/app_settings.dart';
import 'package:qr_generator_flutter/data/database/qr_database.dart';
import 'package:qr_generator_flutter/di/injection.dart';
import 'package:qr_generator_flutter/navigation/app_navigator.dart';
import 'package:qr_generator_flutter/navigation/app_router.dart';
import 'package:qr_generator_flutter/base/bloc_state_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qr_generator_flutter/presentation/features/app_setting/app_setting_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const env = String.fromEnvironment('env', defaultValue: 'dev');
  await configureDependencies(env);

  final db = getIt<QrDatabase>();
  await db.init();

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
    return CubitStateBuilder<AppSettings>(
      cubit: settingCubit,

      builder: (_,state) => MaterialApp(
        title: 'QR Generator Flutter',
        navigatorKey: NavigatorKey.key,
        onGenerateRoute: AppRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        themeMode: state.themeMode,
        theme: AppTheme.light(seedColor: state.colorSchemeSeed),
        darkTheme: AppTheme.dark(seedColor: state.colorSchemeSeed),
        locale: state.locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}