import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator_flutter/base/bloc_state_builder.dart';
import 'package:qr_generator_flutter/core/languages.dart';
import 'package:qr_generator_flutter/data/model/qr_model/qr_model.dart';
import 'package:qr_generator_flutter/di/injection.dart';
import 'package:qr_generator_flutter/presentation/features/qr_create/components/qr_customization.dart';
import 'package:qr_generator_flutter/presentation/features/qr_create/qr_create_cubit.dart';
import 'package:qr_generator_flutter/presentation/features/qr_create/qr_create_state.dart';
import 'package:qr_generator_flutter/presentation/widgets/app_dialog.dart';

class QrCreatePage extends StatefulWidget {
  const QrCreatePage({super.key, this.qrModel});

  final QrModel? qrModel;

  @override
  State<QrCreatePage> createState() => _QrCreatePageState();
}

class _QrCreatePageState extends State<QrCreatePage> {
  final cubit = getIt.get<QrCreateCubit>();
  late final TextEditingController textEditingController =
      TextEditingController(text: widget.qrModel?.content);

  bool isContentEditable = true;
  late bool isQrShow = widget.qrModel?.content?.isNotEmpty ?? false;

  bool get isCreate => widget.qrModel == null;

  @override
  void initState() {
    if (!isCreate) {
      cubit.updateQrModel(widget.qrModel!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isCreate ? Languages.translate.createQr : Languages.translate.updateQr)),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CubitStateBuilder<QrCreateState>(
          cubit: cubit,
          builder: (stateContext, state) {
            final qrModel = state.qrModel;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              onEnd: () {
                setState(() {
                  isQrShow = true;
                });
              },
              alignment:
                  qrModel.content?.isNotEmpty ?? false
                      ? Alignment.topCenter
                      : Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTextField(),

                  if (isQrShow)
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                Languages.translate.preview,
                                style: TextTheme.of(context).titleLarge,
                              ),
                            ),

                            Tooltip(
                              message: qrModel.content ?? 'QR',
                              child: QrImageView(
                                data: qrModel.content ?? '',
                                version: qrModel.version,
                                eyeStyle: qrModel.eyeStyle.toLib(),
                                dataModuleStyle: qrModel.moduleStyle.toLib(),
                                embeddedImageEmitsError: true,
                                size: MediaQuery.of(context).size.width * 0.7,
                                backgroundColor: qrModel.backgroundColor,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      final customized = await customizeQr(
                                        qrModel,
                                      );
                                      if (customized != null) {
                                        cubit.updateQrStyle(customized);
                                      }
                                    },
                                    child: Text('${Languages.translate.customize}...'),
                                  ),
                                ),
                                Flexible(
                                  child: ElevatedButton(
                                    onPressed: () => cubit.resetQrStyle(),
                                    child: Text(Languages.translate.reset),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                  if (isQrShow)
                    ElevatedButton(
                      onPressed: () async{
                        Navigator.pop(context);
                        final result = await cubit.saveQr();
                        // if (result) {
                        //   await Future.delayed(const Duration(milliseconds: 500));
                        //   Navigator.pop(context);
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        minimumSize: Size.fromHeight(
                          56,
                        ), // fromHeight use double.infinity as width and 40 is the height
                      ),
                      child: Text(Languages.translate.save),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isContentEditable ? Colors.blue : Colors.grey,
          width: 0.5,
        ),
      ),
      child: TextField(
        controller: textEditingController,
        readOnly: !isContentEditable,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        onSubmitted: (value) => onSubmit(value),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter text here...',
          contentPadding: EdgeInsets.symmetric(vertical: 12),
          suffixIcon: IconButton(
            icon: Icon(
              isContentEditable ? Icons.check : Icons.edit,
              color: isContentEditable ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              if (isContentEditable) {
                onSubmit(textEditingController.text);
              } else {
                setEditable(!isContentEditable);
              }
            },
            tooltip: isContentEditable ? 'Submit' : 'Edit',
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
          (_) => AppDialog(
            title: "Customization",
            body: QrCustomization(
              initModel: _current,
              onChanged: (model) {
                _current = model;
              },
            ),
            positiveText: Languages.translate.buttonSelect,
            negativeText: Languages.translate.buttonCancel,
            returnResultValue: () => _current,
          ),
    );
  }

  void setEditable(bool editable) {
    setState(() {
      isContentEditable = editable;
    });
  }

  void onSubmit(String data) {
    if (data.isNotEmpty) {
      setEditable(false);
      cubit.updateQrData(data);
    }
  }
}
