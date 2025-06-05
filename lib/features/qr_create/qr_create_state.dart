import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_generator_flutter/data/qr_model/qr_model.dart';

part 'qr_create_state.freezed.dart';

@freezed
class QrCreateState with _$QrCreateState {
  @override
  final QrModel qrModel;

  QrCreateState({this.qrModel = const QrModel()});
}
