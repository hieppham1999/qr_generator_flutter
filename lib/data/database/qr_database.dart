// qr_database.dart
import 'dart:async';
import 'package:qr_generator_flutter/data/dao/qr_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

@lazySingleton
class QrDatabase {
  static const _dbName = 'qr_app.db';
  static const _dbVersion = 1;

  late final Database _database;
  late final QrDao qrDao;

  /// Initialize the database
  Future<void> init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    _database = await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        await db.execute(QrDao.createTable);
      },
    );

    qrDao = QrDao(_database);
  }

  /// Getter for the database instance
  Database get instance => _database;

  /// Close the database connection
  Future<void> close() async {
    await _database.close();
  }
}