import 'dart:ui';

import 'package:flutter/material.dart';

final Duration animateDuration = Duration(milliseconds: 300);

extension PageControllerExtension on PageController {
  void animateToIndex(int index, {Duration? duration, Curve? curve}) {
    animateToPage(index, duration: duration ?? animateDuration, curve: curve ?? Curves.linear);
  }
}

extension ColorGenerate on Color {
  Color get inverted {
    return Color.from(
      alpha: a,
      red: 255 - r,
      green: 255 - g,
      blue: 255 - b,
    );
  }

  /// Generate a color that contrasts and stands out from the original.
  Color get remarkable {
    final hsl = HSLColor.fromColor(this);

    final isLight = hsl.lightness > 0.5;

    // Flip lightness to increase contrast
    final newLightness = isLight
        ? (hsl.lightness - 0.4).clamp(0.0, 1.0)
        : (hsl.lightness + 0.4).clamp(0.0, 1.0);

    return hsl.withLightness(newLightness).toColor();
  }
}
