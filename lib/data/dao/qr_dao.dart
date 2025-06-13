import 'package:qr_generator_flutter/data/entity/qr_entity.dart';
import 'package:sqflite/sqflite.dart';


class QrDao {
  final Database db;

  QrDao(this.db);

  static const tableName = 'qr_table';

  static const createTable = '''
    CREATE TABLE $tableName (
      id TEXT PRIMARY KEY,
      rawJsonData TEXT NOT NULL,
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL
    )
  ''';

  Future<void> insert(QrEntity entity) async {
    await db.insert(
      tableName,
      entity.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> update(QrEntity entity) async {
    await db.update(
      tableName,
      entity.toJson(),
      where: "id = ?",
      whereArgs: [entity.id],
    );
  }

  Future<List<QrEntity>> getAll() async {
    final maps = await db.query(tableName);
    return maps.map((e) => QrEntity.fromJson(e)).toList();
  }

  Future<void> delete(String id) async {
    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<QrEntity?> getById(String id) async {
    final result = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return QrEntity.fromJson(result.first);
    }
    return null;
  }
}