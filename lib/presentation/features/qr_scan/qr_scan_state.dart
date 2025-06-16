
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_generator_flutter/data/model/qr_scan_result/qr_scan_result.dart';

part 'qr_scan_state.freezed.dart';

@freezed
abstract class QrScanState with _$QrScanState {
  const factory QrScanState({
    @Default([]) List<QrScanResult> scanResult,
  }) = _QrScanState;

}
