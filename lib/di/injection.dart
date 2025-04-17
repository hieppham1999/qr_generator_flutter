
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_generator_flutter/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  asExtension: true, // default
)
Future<void> configureDependencies() async {
  getIt.init();
}
