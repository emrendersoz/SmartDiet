import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light(BuildContext context) {
    return _lightTheme.copyWith(
      inputDecorationTheme: _inputDecorationTheme(_lightTheme),
      appBarTheme: _appBarTheme(_lightTheme),
      cardTheme: _cardTheme(_lightTheme),
    );
  }

  static ThemeData get _lightTheme => FlexThemeData.light(
        scheme: FlexScheme.blue,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
          elevatedButtonRadius: 8,
          filledButtonRadius: 8,
          inputDecoratorRadius: 12,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.baloo2().fontFamily,
        appBarStyle: FlexAppBarStyle.scaffoldBackground,
      );

  static InputDecorationTheme _inputDecorationTheme(ThemeData themeData) {
    return themeData.inputDecorationTheme.copyWith(
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      labelStyle: themeData.textTheme.labelSmall?.copyWith(
        fontSize: 14,
        color: themeData.colorScheme.onSurface.withOpacity(0.6),
      ),
    );
  }

  static AppBarTheme _appBarTheme(ThemeData themeData) {
    return themeData.appBarTheme.copyWith(
      backgroundColor: themeData.scaffoldBackgroundColor,
      surfaceTintColor: themeData.scaffoldBackgroundColor,
    );
  }

  static CardTheme _cardTheme(ThemeData themeData) {
    return themeData.cardTheme.copyWith(
      elevation: 3,
      shadowColor: Colors.transparent,
    );
  }
}
