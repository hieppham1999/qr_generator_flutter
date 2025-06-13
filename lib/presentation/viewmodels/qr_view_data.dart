import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_generator_flutter/data/model/qr_model/qr_model.dart';

part 'qr_view_data.freezed.dart';
part 'qr_view_data.g.dart';

@freezed
abstract class QrViewData with _$QrViewData {

  const factory QrViewData({
    required String id,
    required QrModel model,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _QrViewData;


  /// For JSON (if needed for local cache / export)
  factory QrViewData.fromJson(Map<String, dynamic> json) => _$QrViewDataFromJson(json);
}
