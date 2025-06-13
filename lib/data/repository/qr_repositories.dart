import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:qr_generator_flutter/data/data_store/qr_local_ds.dart';
import 'package:qr_generator_flutter/data/entity/qr_entity.dart';
import 'package:qr_generator_flutter/data/mapper/qr_view_data_mapper.dart';
import 'package:qr_generator_flutter/data/model/qr_model/qr_model.dart';
import 'package:qr_generator_flutter/presentation/viewmodels/qr_view_data.dart';
import 'package:uuid/uuid.dart';

abstract class QrRepository {
  Future<void> saveQr(QrModel qrModel);
  Future<List<QrViewData>> getAllQrs();
  Future<void> deleteQr(String id);
  Future<void> updateQr(String id, QrModel qrModel);
}

@Injectable(as: QrRepository)
class QrRepositoryImpl implements QrRepository {
  final QrLocalDataSource localDataSource;

  QrRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveQr(QrModel qrModel) async {
    final entity = QrEntity(
      id: const Uuid().v4(),
      rawJsonData: jsonEncode(qrModel.toJson()),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    await localDataSource.insert(entity);
  }

  @override
  Future<List<QrViewData>> getAllQrs() async {
    final entities = await localDataSource.getAll();
    return entities.map((e) {
      return QrViewDataMapper().mapToModel(e);
    }).toList();
  }

  @override
  Future<void> deleteQr(String id) async {
    await localDataSource.delete(id);
  }

  @override
  Future<void> updateQr(String id, QrModel qrModel) async {
    final existing = await localDataSource.getById(id);
    if (existing == null) {
      throw Exception('Cannot update: QR with ID $id not found');
    }

    final updatedEntity = QrEntity(
      id: existing.id,
      rawJsonData: jsonEncode(qrModel.toJson()),
      createdAt: existing.createdAt,
      updatedAt: DateTime.now(),
    );

    await localDataSource.update(updatedEntity);
  }
}