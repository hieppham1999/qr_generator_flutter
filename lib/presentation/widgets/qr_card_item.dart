import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_generator_flutter/presentation/viewmodels/qr_view_data.dart';

class QrCard extends StatelessWidget {
  final QrViewData qr;

  const QrCard({required this.qr});

  @override
  Widget build(BuildContext context) {
    final content = qr.model;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        title: Text(content.content ?? ''),
        subtitle: Text('Updated: ${DateFormat.Hm().format(qr.updatedAt)}'),
        trailing: IconButton(
          icon: const Icon(Icons.qr_code),
          onPressed: () {
            // Handle view qr details or show qr graphic
          },
        ),
      ),
    );
  }
}