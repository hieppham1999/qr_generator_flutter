import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:qr_generator_flutter/data/database/qr_database.dart';
import 'package:qr_generator_flutter/di/injection.config.dart';
import 'package:sqflite/sqflite.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  asExtension: true, // default
)
Future<void> configureDependencies(String environment) async {
  await getIt.allReady();
  getIt.init(environment: environment);
}

@module
abstract class LoggerModule {
  @prod
  @lazySingleton
  Logger get prodLogger => Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      colors: false,
      printEmojis: false,
    ),
  );

  @dev
  @lazySingleton
  Logger get devLogger => Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      colors: true,
      printEmojis: false,
    ),
  );
}
