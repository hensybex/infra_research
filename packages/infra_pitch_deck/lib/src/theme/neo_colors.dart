import 'package:flutter/material.dart';

/// Core color palette for the NeoConsulting theme.
class NeoColors {
  const NeoColors._();

  static const Color background = Color(0xFF0F0B1F);
  static const Color backgroundAlt = Color(0xFF221048);
  static const Color surface = Color(0xFF16112C);
  static const Color primary = Color(0xFF6EE7FF);
  static const Color secondary = Color(0xFFC084FC);
  static const Color accent = Color(0xFFFACC15);
  static const Color neutral = Color(0xFFB6B4CF);
  static const Color textPrimary = Color(0xFFEFF3FF);
  static const Color textSecondary = Color(0xFFA8A4C3);

  static const Gradient primaryGradient = LinearGradient(
    colors: <Color>[background, backgroundAlt],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

extension NeoColorOpacityX on Color {
  Color neoOpacity(double opacity) =>
      withAlpha((opacity.clamp(0, 1) * 255).round());
}
