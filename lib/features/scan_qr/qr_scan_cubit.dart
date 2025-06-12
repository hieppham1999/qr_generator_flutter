import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_generator_flutter/base/base_cubit.dart';
import 'package:qr_generator_flutter/data/model/qr_scan_result/qr_scan_result.dart';
import 'package:qr_generator_flutter/features/scan_qr/qr_scan_state.dart';

@injectable
class QrScanCubit extends BaseCubit<QrScanState> {
  QrScanCubit() : super.normal(QrScanState());

  List<QrScanResult> get scanResult => currentData.scanResult;

  void addBarcode(Uint8List? image, Barcode barcode) {
    if (currentData.scanResult.any(
      (item) => item.barcode.rawValue == barcode.rawValue,
    )) {
      return;
    } else {
      emitNormal(
        currentData.copyWith(
          scanResult: [
            ...currentData.scanResult,
            QrScanResult(image: image, barcode: barcode),
          ],
        ),
      );
    }
  }
}
