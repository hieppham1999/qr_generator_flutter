import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator_flutter/base/bloc_state_builder.dart';
import 'package:qr_generator_flutter/core/languages.dart';
import 'package:qr_generator_flutter/di/injection.dart';
import 'package:qr_generator_flutter/features/qr_create/qr_create_cubit.dart';
import 'package:qr_generator_flutter/features/qr_create/qr_create_state.dart';
import 'package:qr_generator_flutter/widgets/color_picker_dot.dart';

class QrCreatePage extends StatefulWidget {
  const QrCreatePage({super.key, this.qrContent});

  final String? qrContent;

  @override
  State<QrCreatePage> createState() => _QrCreatePageState();
}

class _QrCreatePageState extends State<QrCreatePage> {
  final cubit = getIt.get<QrCreateCubit>();
  late final TextEditingController textEditingController =
      TextEditingController(text: widget.qrContent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QR Create")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocStateBuilder<QrCreateState>(
          cubit: cubit,
          builder: (_, state) {
            final qrModel = state.qrModel;

            return Column(
              children: [
                TextField(controller: textEditingController),
                if (qrModel.content?.isNotEmpty ?? false)
                  Builder(
                    builder:
                        (context) => Column(
                          children: [
                            Row(
                              children: [
                                Text('Qr module color:'),
                                ColorPickerDot(
                                  selectedColor: qrModel.moduleStyle.color,
                                  onChanged:
                                      (color) =>
                                          cubit.updateQrModule(color: color),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Qr eye color:'),
                                ColorPickerDot(
                                  selectedColor: qrModel.eyeStyle.color,
                                  onChanged:
                                      (color) =>
                                          cubit.updateQrEyeColor(color: color),
                                ),
                              ],
                            ),

                            QrImageView(
                              data: qrModel.content ?? '',
                              version: QrVersions.auto,
                              eyeStyle: qrModel.eyeStyle,
                              dataModuleStyle: qrModel.moduleStyle,
                              embeddedImageEmitsError: true,
                              size: 200.0,
                            ),
                            Text(qrModel.content ?? ''),
                          ],
                        ),
                  ),

                ElevatedButton(
                  onPressed:
                      () => cubit.updateQrData(textEditingController.text),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: Theme.of(context).textTheme.labelLarge,
                    minimumSize: Size.fromHeight(
                      56,
                    ), // fromHeight use double.infinity as width and 40 is the height
                  ),
                  child: Text(Languages.translate.btnGenerate),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
