import 'dart:ui';

extension ColorGenerate on Color {
  Color inverted() {
    return Color.from(
      alpha: a,
      red: 255 - r,
      green: 255 - g,
      blue: 255 - b,
    );
  }
}
