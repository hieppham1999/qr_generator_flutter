import 'dart:convert';
import 'package:qr_generator_flutter/data/entity/qr_entity.dart';
import 'package:qr_generator_flutter/data/model/qr_model/qr_model.dart';
import 'package:sqflite/sqflite.dart';


class QrDao {
  final Database db;

  QrDao(this.db);

  static const String tableName = 'qr_codes';

  /// Create table SQL
  static const createTable = '''
    CREATE TABLE $tableName (
      id TEXT PRIMARY KEY,
      rawJsonData TEXT NOT NULL,
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL
    )
  ''';

  /// Insert or update a QR code
  Future<void> upsert(QrModel model, {required String id}) async {
    final now = DateTime.now();
    final entity = QrEntity(
      id: id,
      rawJsonData: jsonEncode(model.toJson()),
      createdAt: now,
      updatedAt: now,
    );
    await db.insert(
      tableName,
      entity.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Get all saved QR codes
  Future<List<QrModel>> getAll() async {
    final result = await db.query(tableName, orderBy: 'updatedAt DESC');
    return result
        .map((e) => QrModel.fromJson(jsonDecode(e['rawJsonData'] as String)))
        .toList();
  }

  /// Get single QR code by ID
  Future<QrModel?> getById(String id) async {
    final result = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isEmpty) return null;
    return QrModel.fromJson(jsonDecode(result.first['rawJsonData'] as String));
  }

  /// Delete QR by ID
  Future<void> delete(String id) async {
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Clear all QR codes
  Future<void> clearAll() async {
    await db.delete(tableName);
  }
}