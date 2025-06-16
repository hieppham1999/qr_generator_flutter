import 'package:flutter/material.dart';
import 'package:qr_generator_flutter/core/languages.dart';
import 'package:qr_generator_flutter/presentation/widgets/app_dialog.dart';
import 'package:qr_generator_flutter/presentation/widgets/color_picker_multi_types.dart';

Future<Color?> pickColor(BuildContext context, [Color? currentColor]) async {
  Color? pickedColor;
  return showDialog(
    context: context,
    builder:
        (_) => AppDialog(
          body: SizedBox(
            height: 400,
            child: MultipleTypeColorPicker(
              onChanged: (color) {
                pickedColor = color;
              },
              initColor: currentColor,
            ),
          ),
          positiveText: Languages.translate.buttonSelect,
          negativeText: Languages.translate.buttonCancel,
          returnResultValue: () => pickedColor,
        ),
  );
}
