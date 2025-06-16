import 'package:injectable/injectable.dart';
import 'package:qr_generator_flutter/data/dao/qr_dao.dart';
import 'package:qr_generator_flutter/data/entity/qr_entity.dart';

@injectable
class QrLocalDataSource {
  final QrDao dao;

  QrLocalDataSource(this.dao);

  Future<void> insert(QrEntity entity) => dao.insert(entity);

  Future<List<QrEntity>> getAll() => dao.getAll();

  Future<void> delete(String id) => dao.delete(id);

  Future<void> update(QrEntity entity) => dao.update(entity);

  Future<QrEntity?> getById(String id) => dao.getById(id);
}