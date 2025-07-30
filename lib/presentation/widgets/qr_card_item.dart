import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator_flutter/data/model/qr_model/qr_model.dart';
import 'package:qr_generator_flutter/navigation/app_navigator.dart';
import 'package:qr_generator_flutter/navigation/app_routes.dart';
import 'package:qr_generator_flutter/presentation/viewmodels/qr_view_data.dart';

class QrCard extends StatelessWidget {
  final QrViewData qr;
  final BorderRadius borderRadius;

  const QrCard({
    super.key,
    required this.qr,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  Widget build(BuildContext context) {
    final content = qr.model;

    return InkWell(
      onTap: () {
        NavController.pushNamed(
          QrCreateRoute(
            id: qr.id,
            qrModel: qr.model.copyWith(type: QrType.clone),
          ),
        );
      },
      borderRadius: borderRadius,
      child: Ink(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.width * 0.22,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: QrImageView(
                data: qr.model.content ?? '',
                version: qr.model.version,
                eyeStyle: qr.model.eyeStyle.toLib(),
                dataModuleStyle: qr.model.moduleStyle.toLib(),
                embeddedImageEmitsError: true,
                // size: MediaQuery.of(context).size.width * 0.2,
                backgroundColor: qr.model.backgroundColor,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(content.content ?? ''),
                  Text('Updated: ${DateFormat.yMd().format(qr.updatedAt)}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
