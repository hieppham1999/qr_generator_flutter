
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_generator_flutter/di/injection.config.dart';
import 'package:qr_generator_flutter/utils/app_logger.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  asExtension: true, // default
)
Future<void> configureDependencies() async {

  await getIt.allReady();
  await getIt.init();
}
