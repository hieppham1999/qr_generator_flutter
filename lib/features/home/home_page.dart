import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator_flutter/features/home/home_cubit.dart';
import 'package:qr_generator_flutter/widgets/bloc_state_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:qr_generator_flutter/di/injection.dart';
import 'package:qr_generator_flutter/widgets/color_picker_dot.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homeCubit = getIt.get<HomeCubit>();
    return Scaffold(
      appBar: AppBar(title: Text("HomePage")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocStateBuilder(
          cubit: homeCubit,
          builder: (_, _) {
            return Column(
              children: [
                TextField(controller: textEditingController),
                if (homeCubit.qrData.content?.isNotEmpty ?? false)
                  Builder(
                    builder:
                        (context) => Column(
                          children: [
                            Row(
                              children: [
                                Text('Qr module color:'),
                                ColorPickerDot(
                                  selectedColor:
                                      homeCubit.qrData.moduleStyle.color,
                                  onChanged:
                                      (color) =>
                                          homeCubit.updateQrModuleColor(color),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Qr eye color:'),
                                ColorPickerDot(
                                  selectedColor:
                                      homeCubit.qrData.eyeStyle.color,
                                  onChanged:
                                      (color) =>
                                          homeCubit.updateQrEyeColor(color),
                                ),
                              ],
                            ),

                            QrImageView(
                              data: homeCubit.qrData.content ?? '',
                              version: QrVersions.auto,
                              eyeStyle: homeCubit.qrData.eyeStyle,
                              dataModuleStyle: homeCubit.qrData.moduleStyle,
                              embeddedImageEmitsError: true,
                              size: 200.0,
                            ),
                            Text(homeCubit.qrData.content ?? ''),
                          ],
                        ),
                  ),

                ElevatedButton(
                  onPressed:
                      () => homeCubit.updateQrData(textEditingController.text),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: Theme.of(context).textTheme.labelLarge,
                    minimumSize: Size.fromHeight(
                      56,
                    ), // fromHeight use double.infinity as width and 40 is the height
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
