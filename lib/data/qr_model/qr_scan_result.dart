import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'qr_scan_result.freezed.dart';

@freezed
abstract class QrScanResult with _$QrScanResult  {
  const factory QrScanResult({
    @Default(null) Uint8List? image,
    required Barcode barcode,
  }) = _QrScanResult;
}