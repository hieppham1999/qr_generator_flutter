import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator_flutter/features/home/home_cubit.dart';

import '../../di/injection.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homeCubit = getIt.get<HomeCubit>();

    return Scaffold(
      body: BlocProvider(
        create: (_) => HomeCubit(),
        child: Column(
          children: [
            TextField(controller: textEditingController,),

            QrImageView(
              data: homeCubit.qrData,
              version: QrVersions.auto,
              size: 200.0,
            ),

            ElevatedButton(
              onPressed: () => homeCubit.updateQrData(textEditingController.text),
              child: Text('Create QR'),
            ),
          ],
        ),
      ),
    );
  }
}
