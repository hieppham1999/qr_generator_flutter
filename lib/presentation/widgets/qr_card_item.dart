import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator_flutter/data/model/qr_model/qr_model.dart';
import 'package:qr_generator_flutter/navigation/app_navigator.dart';
import 'package:qr_generator_flutter/navigation/app_routes.dart';
import 'package:qr_generator_flutter/presentation/viewmodels/qr_view_data.dart';

class QrCard extends StatelessWidget {
  final QrViewData qr;

  const QrCard({required this.qr});

  @override
  Widget build(BuildContext context) {
    final content = qr.model;

    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        // color: Theme.of(context).,
        elevation: 2,
        child: ListTile(
          title: Text(content.content ?? ''),
          subtitle: Text('Updated: ${DateFormat.yMd().format(qr.updatedAt)}'),
          onTap: () {
            NavController.pushNamed(QrCreateRoute(id: qr.id, qrModel: qr.model.copyWith(type: QrType.clone)));
          },
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: QrImageView(
              data: qr.model.content ?? '',
              version: qr.model.version,
              eyeStyle: qr.model.eyeStyle.toLib(),
              dataModuleStyle: qr.model.moduleStyle.toLib(),
              embeddedImageEmitsError: true,
              size: 50,
              backgroundColor: qr.model.backgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}