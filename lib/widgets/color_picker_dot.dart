import 'package:flutter/material.dart';
import 'package:qr_generator_flutter/utils/dialogs.dart';

// const Color _kDefaultSelectedColor = Colors.white;

class ColorPickerDot extends StatelessWidget {
  const ColorPickerDot({
    super.key,
    this.selectedColor,
    required this.onChanged,
  });

  final Color? selectedColor;
  final Function(Color color) onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final pickedColor = await pickColor(context, selectedColor);
        if (pickedColor != null) {
          onChanged.call(pickedColor);
        }
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selectedColor,
          border: Border.all(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
