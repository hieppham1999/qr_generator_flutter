import 'package:flutter/material.dart';
import 'package:qr_generator_flutter/widgets/app_dialog.dart';
import 'package:qr_generator_flutter/widgets/color_picker_multi_types.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<Color?> pickColor(BuildContext context, [Color? currentColor]) async {
  Color? pickedColor;
  return showDialog(
    context: context,
    builder:
        (_) => AppDialog(
          body: SizedBox(
            height: 550,
            child: MultipleTypeColorPicker(
              onChanged: (color) {
                pickedColor = color;
              },
              initColor: currentColor,
            ),
          ),
          positiveText: AppLocalizations.of(context)!.buttonSelect,
          negativeText: AppLocalizations.of(context)!.buttonCancel,
          returnResultValue: () => pickedColor,
        ),
  );
}
