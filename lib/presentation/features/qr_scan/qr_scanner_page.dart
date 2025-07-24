import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_generator_flutter/base/bloc_state_builder.dart';
import 'package:qr_generator_flutter/core/languages.dart';
import 'package:qr_generator_flutter/data/model/qr_model/qr_model.dart';
import 'package:qr_generator_flutter/data/model/qr_scan_result/qr_scan_result.dart';
import 'package:qr_generator_flutter/di/injection.dart';
import 'package:qr_generator_flutter/navigation/app_navigator.dart';
import 'package:qr_generator_flutter/navigation/app_routes.dart';
import 'package:qr_generator_flutter/presentation/features/qr_scan/qr_scan_cubit.dart';
import 'package:qr_generator_flutter/presentation/features/qr_scan/qr_scan_state.dart';
import 'package:qr_generator_flutter/presentation/widgets/app_tile.dart';
import 'package:qr_generator_flutter/utils/app_logger.dart';

class QrScannerPage extends StatefulWidget {
  QrScannerPage({super.key});

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  final MobileScannerController cameraController = MobileScannerController(
    // returnImage: true,
    // cameraResolution: Size(320, 320),
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  final cubit = getIt.get<QrScanCubit>();

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CubitStateBuilder<QrScanState>(
      cubit: cubit,
      builder:
          (context, state) => Scaffold(
            appBar: AppBar(
              title: const Text('Scan QR Code'),
              actions: [
                IconButton(
                  onPressed: () {
                    showScannedQrList(context, cubit.scanResult);
                  },
                  icon: Badge(
                    isLabelVisible: cubit.scanResult.isNotEmpty,
                    label:
                        cubit.scanResult.isNotEmpty
                            ? Text(cubit.scanResult.length.toString())
                            : null,
                    child: Icon(Icons.qr_code),
                  ),
                ),
              ],
            ),
            body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final Size layoutSize = constraints.biggest;

                final double scanWindowWidth = layoutSize.width / 2;

                final Rect scanWindow = Rect.fromCenter(
                  center: layoutSize.center(Offset.zero),
                  width: scanWindowWidth,
                  height: scanWindowWidth,
                );
                return MobileScanner(
                  // Use the existing controller
                  controller: cameraController,
                  overlayBuilder: (_, constraint) {
                    return CustomPaint(
                      size: constraints.biggest,
                      painter: HolePainter(holeSize: scanWindowWidth),
                    );
                  },
                  scanWindow: scanWindow,
                  onDetect: (capture) {
                    final List<Barcode> barcodes = capture.barcodes;
                    if (barcodes.isNotEmpty) {
                      final Barcode barcode = barcodes.first;
                      if (barcode.rawValue != null) {
                        appLogger.d('Barcode found! ${barcode.rawValue}');

                        cubit.addBarcode(capture.image, barcode);

                        // Pop the scanner screen after a successful scan
                        // NavController.pushReplacementNamed(QrCreateRoute(qrContent: barcode.rawValue));
                      }
                    }
                  },
                  placeholderBuilder:
                      (_) => const Center(child: Text('Wait for camera...')),
                );
              },
            ),
          ),
    );
  }

  void showScannedQrList(BuildContext context, List<QrScanResult> qrList) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Languages.translate.scannedQrList,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              if (qrList.isEmpty)
                Text(Languages.translate.emptyQrList)
              else
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: qrList.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final qr = qrList[index];
                    return AppTile(
                      label: qr.barcode.displayValue ?? '',
                      trailing: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.copy),
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(text: qr.barcode.rawValue ?? ''),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(Languages.translate.copiedToClipboard),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              cameraController.pause();
                              NavController.pushNamed(
                                QrCreateRoute(
                                  qrModel: QrModel.clone(qr.barcode.rawValue),
                                ),
                              )?.then((_) => cameraController.start());
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.save),
                            onPressed: () {
                              cubit.saveQr(qr.barcode.rawValue);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(Languages.translate.qrSaved)),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

class HolePainter extends CustomPainter {
  final double holeSize;

  HolePainter({required this.holeSize});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.black.withValues(alpha: 0.5)
          ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCenter(
      center: center,
      width: holeSize,
      height: holeSize,
    );

    canvas.saveLayer(Rect.largest, Paint());

    // Draw full screen
    canvas.drawRect(Offset.zero & size, paint);

    // Clear center hole
    final clearPaint =
        Paint()
          ..color = Colors.transparent
          ..blendMode = BlendMode.clear;
    canvas.drawRect(rect, clearPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant HolePainter oldDelegate) =>
      oldDelegate.holeSize != holeSize;
}
