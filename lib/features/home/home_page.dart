import 'package:flutter/material.dart';
import 'package:qr_generator_flutter/features/home/home_cubit.dart';
import 'package:qr_generator_flutter/widgets/bloc_state_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:qr_generator_flutter/di/injection.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homeCubit = getIt.get<HomeCubit>();
    return Scaffold(
      appBar: AppBar(title: Text("HomePage"),),
      body: BlocStateBuilder(
        cubit: homeCubit,
        builder: (_,_) => Column(
          children: [
            TextField(controller: textEditingController,),

            // QrImageView(
            //   data: homeCubit.qrData,
            //   version: QrVersions.auto,
            //   size: 200.0,
            // ),
            Text(homeCubit.qrData),

            ElevatedButton(
              onPressed: () => homeCubit.updateQrData(textEditingController.text),
              child: Text(AppLocalizations.of(context)!.btnGenerate),
            ),
          ],
        ),
      ),
    );
  }
}
