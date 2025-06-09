import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_generator_flutter/navigation/app_navigator.dart';
import 'package:qr_generator_flutter/navigation/app_routes.dart';
import 'package:qr_generator_flutter/utils/app_logger.dart';

class QrScannerPage extends StatelessWidget {
  QrScannerPage({super.key});

  final MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR Code')),
      body: MobileScanner(
        // Use the existing controller
        controller: cameraController,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          if (barcodes.isNotEmpty) {
            final Barcode barcode = barcodes.first;
            if (barcode.rawValue != null) {
              appLogger.d('Barcode found! ${barcode.rawValue}');
              // setState(() {
              //   _scannedQrCode = barcode.rawValue;
              // });
              // Pop the scanner screen after a successful scan
              NavController.pushReplacementNamed(QrCreateRoute(qrContent: barcode.rawValue));
            }
          }
        },
        placeholderBuilder: (_) => const Center(child: Text('Wait for camera...')),
      ),
    );
  }
}
