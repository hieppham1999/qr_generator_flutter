import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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
              if (homeCubit.qrData.content?.isNotEmpty ?? false) Builder(
                  builder: (context) =>
                      Column(
                        children: [
                          TextButton(onPressed: () async {
                            var pickedColor = defaultQrColor;
                            await showDialog(
                              context: context,
                              builder: (context) =>
                                  AlertDialog(
                                    title: const Text('Pick a color!'),
                                    content: SingleChildScrollView(
                                      child: ColorPicker(
                                        pickerColor: defaultQrColor,
                                        onColorChanged: (color) {
                                          pickedColor = color;
                                        },
                                      ),
                                    ),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        child: const Text('Got it'),
                                        onPressed: () {
                                          homeCubit.updateQrColor(pickedColor);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                            );
                          }, child: Text("Change Color")),
                          QrImageView(
                            data: homeCubit.qrData.content ?? '',
                            version: QrVersions.auto,
                            eyeStyle: QrEyeStyle(
                                eyeShape: QrEyeShape.square,
                                color: defaultQrColor),
                            dataModuleStyle: homeCubit.qrData.moduleStyle,
                            embeddedImageEmitsError: true,
                            size: 200.0,
                          ),
                          Text(homeCubit.qrData.content ?? ''),
                        ],
                      )),

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
