import 'package:flutter/material.dart';
import 'package:qr_generator_flutter/di/injection.dart';
import 'package:qr_generator_flutter/features/home/home_page.dart';


void main() async {
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Generator Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}