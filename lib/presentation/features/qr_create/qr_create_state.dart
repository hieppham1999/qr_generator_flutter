import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_generator_flutter/data/model/qr_model/qr_model.dart';

part 'qr_create_state.freezed.dart';

@freezed
abstract class QrCreateState with _$QrCreateState {
  factory QrCreateState({String? id, required QrModel qrModel}) = _QrCreateState;

  factory QrCreateState.df() => _QrCreateState(qrModel: QrModel());
}
