
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator_flutter/base/bloc_state_builder.dart';
import 'package:qr_generator_flutter/core/languages.dart';
import 'package:qr_generator_flutter/data/qr_model/qr_model.dart';
import 'package:qr_generator_flutter/di/injection.dart';
import 'package:qr_generator_flutter/features/qr_create/components/qr_customization.dart';
import 'package:qr_generator_flutter/features/qr_create/qr_create_cubit.dart';
import 'package:qr_generator_flutter/features/qr_create/qr_create_state.dart';
import 'package:qr_generator_flutter/widgets/app_dialog.dart';

class QrCreatePage extends StatefulWidget {
  const QrCreatePage({super.key, this.qrContent});

  final String? qrContent;

  @override
  State<QrCreatePage> createState() => _QrCreatePageState();
}

class _QrCreatePageState extends State<QrCreatePage> {
  final cubit = getIt.get<QrCreateCubit>();
  late final TextEditingController textEditingController = TextEditingController(text: widget.qrContent);

  bool isContentEditable = true;

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
                _buildTextField(),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (qrModel.content?.isNotEmpty ?? false)
                          Builder(
                            builder:
                                (context) => Column(
                              children: [
                                Text('QR Preview'),



                                Tooltip(
                                  message: qrModel.content ?? 'QR',
                                  child: QrImageView(
                                    data: qrModel.content ?? '',
                                    version: QrVersions.auto,
                                    eyeStyle: qrModel.eyeStyle,
                                    dataModuleStyle: qrModel.moduleStyle,
                                    embeddedImageEmitsError: true,
                                    size: 200.0,
                                    backgroundColor: Colors.blueAccent,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          final customized = await customizeQr(qrModel);
                                          if (customized != null) {
                                            cubit.updateQrStyle(customized);
                                          }
                                        },
                                        child: Text('Customize...'),
                                      ),
                                    ),
                                    Flexible(
                                      child: ElevatedButton(
                                        onPressed: () => cubit.resetQrStyle(),
                                        child: Text('Reset'),
                                      ),
                                    ),
                                  ],
                                )

                              ],
                            ),
                          ),
                      ],
                    ),
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

  Widget _buildTextField() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(horizontal: 12,),
      decoration: BoxDecoration(
        color: isContentEditable ? Colors.white : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isContentEditable ? Colors.blue : Colors.grey,
          width: 1.5,
        ),
        boxShadow: [
          if (isContentEditable)
            BoxShadow(
              color: Colors.blue.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
        ],
      ),
      child: TextField(
        controller: textEditingController,
        readOnly: !isContentEditable,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isContentEditable ? Colors.black : Colors.grey,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter text here...',
          contentPadding: EdgeInsets.symmetric(vertical: 12),
          suffixIcon: IconButton(
            icon: Icon(
              isContentEditable ? Icons.edit : Icons.lock,
              color: isContentEditable ? Colors.blue : Colors.grey,
            ),
            onPressed: () {

              setState(() {
                isContentEditable = !isContentEditable;
              });
            },
            tooltip: isContentEditable ? 'Edit' : 'Locked',
          ),
        ),
        cursorColor: Colors.blue,
      ),
    );
  }

  Future<QrModel?> customizeQr(QrModel current) {
    QrModel _current = current.copyWith();
    return showDialog<QrModel>(
      context: context,
      builder:
          (_) =>
          AppDialog(
            body: QrCustomization(initModel: _current, onChanged: (model) {
              _current = model;
            },),
            positiveText: Languages.translate.buttonSelect,
            negativeText: Languages.translate.buttonCancel,
            returnResultValue: () => _current,
          ),
    );
  }
}


