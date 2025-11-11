import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

import 'neo_colors.dart';

/// NeoConsulting theme factory – centralises Material & FlutterDeck styling.
class NeoTheme {
  const NeoTheme._();

  static ThemeData materialDark() {
    final base = FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: NeoColors.primary,
        primaryContainer: Color(0xFF123B5F),
        secondary: NeoColors.secondary,
        secondaryContainer: Color(0xFF32175C),
        tertiary: NeoColors.accent,
        tertiaryContainer: Color(0xFF4F3400),
        error: Color(0xFFFF6B6B),
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 12,
      appBarStyle: FlexAppBarStyle.material,
      subThemesData: const FlexSubThemesData(
        useMaterial3Typography: true,
        defaultRadius: 18,
        thinBorderWidth: 1,
        thickBorderWidth: 2,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
      swapColors: false,
      keyColors: const FlexKeyColors(
        keepPrimary: true,
        keepSecondary: true,
        keepTertiary: true,
      ),
    );

    final inter = GoogleFonts.interTextTheme(base.textTheme);
    final display = GoogleFonts.spaceGroteskTextTheme(inter);

    return base.copyWith(
      scaffoldBackgroundColor: NeoColors.background,
      canvasColor: NeoColors.surface,
      textTheme: display.apply(
        bodyColor: NeoColors.textPrimary,
        displayColor: NeoColors.textPrimary,
      ),
      colorScheme: base.colorScheme.copyWith(
        surface: NeoColors.surface,
        onSurface: NeoColors.textPrimary,
        onPrimary: Colors.black,
      ),
    );
  }

  static FlutterDeckThemeData deckDark() {
    final material = materialDark();

    final deckTextTheme = FlutterDeckTextTheme(
      display: GoogleFonts.spaceGrotesk(
        fontSize: 96,
        fontWeight: FontWeight.w700,
        height: 1.05,
        letterSpacing: -1.8,
        color: NeoColors.textPrimary,
      ),
      header: GoogleFonts.spaceGrotesk(
        fontSize: 64,
        fontWeight: FontWeight.w600,
        letterSpacing: -1.2,
        color: NeoColors.textPrimary,
      ),
      title: GoogleFonts.spaceGrotesk(
        fontSize: 48,
        fontWeight: FontWeight.w600,
        color: NeoColors.textPrimary,
      ),
      subtitle: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        height: 1.25,
        color: NeoColors.textSecondary,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 26,
        fontWeight: FontWeight.w400,
        height: 1.35,
        color: NeoColors.textPrimary,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: NeoColors.textSecondary,
      ),
      bodySmall: GoogleFonts.ibmPlexMono(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: NeoColors.textSecondary,
      ),
    );

    final base = FlutterDeckThemeData.fromThemeAndText(material, deckTextTheme);

    return base.copyWith(
      slideTheme: const FlutterDeckSlideThemeData(
        backgroundColor: NeoColors.background,
        color: NeoColors.textPrimary,
      ),
      footerTheme: FlutterDeckFooterThemeData(
        slideNumberTextStyle: GoogleFonts.ibmPlexMono(
          fontSize: 16,
          color: NeoColors.textSecondary,
          letterSpacing: 0.8,
        ),
        slideNumberColor: NeoColors.textSecondary,
      ),
      headerTheme: FlutterDeckHeaderThemeData(
        color: NeoColors.textSecondary,
        textStyle: GoogleFonts.ibmPlexMono(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.6,
          color: NeoColors.textSecondary,
        ),
      ),
    );
  }
}
