import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator_flutter/features/home/home_cubit.dart';
import 'package:qr_generator_flutter/utils/functions.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocStateBuilder(
          cubit: homeCubit,
          builder: (_context,_) {

            final defaultQrColor = Theme.of(context).scaffoldBackgroundColor.inverted();

            return Column(
            children: [
              TextField(controller: textEditingController,),

              if (homeCubit.qrData.isNotEmpty) QrImageView(
                data: homeCubit.qrData,
                version: QrVersions.auto,
                eyeStyle: QrEyeStyle(eyeShape: QrEyeShape. square, color: defaultQrColor),
                dataModuleStyle: QrDataModuleStyle(dataModuleShape: QrDataModuleShape. square, color: defaultQrColor),
                size: 200.0,
              ),
              if (homeCubit.qrData.isNotEmpty) Text(homeCubit.qrData),

              ElevatedButton(
                onPressed: () => homeCubit.updateQrData(textEditingController.text),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  minimumSize: Size.fromHeight(56), // fromHeight use double.infinity as width and 40 is the height
                ),
                child: Text(AppLocalizations.of(context)!.btnGenerate),
              ),
            ],
          );
          },
        ),
      ),
    );
  }
}
