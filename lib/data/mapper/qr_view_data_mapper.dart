import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:qr_generator_flutter/data/entity/qr_entity.dart';
import 'package:qr_generator_flutter/data/mapper/mapper.dart';
import 'package:qr_generator_flutter/presentation/viewmodels/qr_view_data.dart';

@injectable
class QrViewDataMapper
    implements Mapper<QrEntity, QrViewData> {
  QrViewDataMapper();

  @override
  QrEntity mapToEntity(QrViewData model) {
    return QrEntity(
      id: model.id,
      rawJsonData: jsonEncode(model.toJson()),
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  @override
  QrViewData mapToModel(QrEntity entity) {
    final json = jsonDecode(entity.rawJsonData) as Map<String, dynamic>;
    return QrViewData.fromJson(json);
  }
}
