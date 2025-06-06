import 'package:flutter/material.dart';
import 'package:qr_generator_flutter/data/qr_model/qr_model.dart';
import 'package:qr_generator_flutter/widgets/color_picker_dot.dart';

class QrCustomization extends StatefulWidget {
  const QrCustomization({
    super.key,
    this.initModel = const QrModel(),
    required this.onChanged,
  });

  final QrModel initModel;
  final Function(QrModel model) onChanged;

  @override
  State<QrCustomization> createState() => _QrCustomizationState();
}

class _QrCustomizationState extends State<QrCustomization> {
  late QrModel _current = widget.initModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Qr module color:'),
            ColorPickerDot(
              selectedColor: _current.moduleStyle.color,
              onChanged: (color) {
                setState(() {
                  _current = _current.copyWith(
                    moduleStyle: _current.moduleStyle.copyWith(color: color),
                  );
                });
                widget.onChanged(_current);
              },
            ),
          ],
        ),
        Row(
          children: [
            Text('Qr eye color:'),
            ColorPickerDot(
              selectedColor: _current.eyeStyle.color,
              onChanged: (color) {
                setState(() {
                  _current = _current.copyWith(
                    eyeStyle: _current.eyeStyle.copyWith(color: color),
                  );
                });

                widget.onChanged(_current);
              },
            ),
          ],
        ),
      ],
    );
  }
}
