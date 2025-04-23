import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qr_generator_flutter/widgets/color_picker_multi_types.dart';

Future<Color?> pickColor(BuildContext context, [Color? currentColor]) async {
  Color? pickedColor;
  return showDialog(
    context: context,
    builder:
        (context) => Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)!.titleColorPicker,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 550,
                child: MultipleTypeColorPicker(
                  onChanged: (color) {
                    pickedColor = color;
                  },
                  initColor: currentColor,
                ),
              ),
              ElevatedButton(
                child: Text(AppLocalizations.of(context)!.buttonSelect),
                onPressed: () {
                  Navigator.of(context).pop(pickedColor);
                },
              ),
            ],
          ),
        ),
  );
}
