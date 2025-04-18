import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
  final homeCubit = getIt.get<SettingsCubit>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocStateBuilder(
      cubit: homeCubit,

      builder: (_,_) => MaterialApp(
        title: 'QR Generator Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        locale: Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: HomePage(),
      ),
    );
  }
}