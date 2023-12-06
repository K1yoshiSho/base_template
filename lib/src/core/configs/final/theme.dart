import 'package:base/src/core/common/exports/main_export.dart';
import 'package:base/src/core/configs/themes/dark.dart';

class AppTheme {
  //
  // Light theme
  //

  static final light = DarkTheme.copyWith(
    extensions: [
      _lightAppColors,
    ],
  );

  static final _lightAppColors = AppColorsExtension(
    primary: DarkTheme.colorScheme.primary,
    onPrimary: DarkTheme.colorScheme.onPrimary,
    secondary: DarkTheme.colorScheme.secondary,
    onSecondary: DarkTheme.colorScheme.onSecondary,
    error: DarkTheme.colorScheme.error,
    onError: DarkTheme.colorScheme.onError,
    background: DarkTheme.colorScheme.background,
    onBackground: DarkTheme.colorScheme.onBackground,
    surface: DarkTheme.colorScheme.surface,
    onSurface: DarkTheme.colorScheme.onSurface,
    standart: Colors.white,
    divider: AppPalette.gray200,
    text: AppPalette.abyss,
    primaryIcon: AppPalette.primaryColor,
    selectedTile: AppPalette.accent100,
    grayOpacity: Colors.white,
    grayOpacityText: const Color.fromARGB(255, 83, 83, 83),
    blueOrigin: const Color(0xFF2248CD),
    orange500: const Color(0xFFF97316),
    green500: const Color(0xFF22C55E),
    scaffoldBackground: AppPalette.background,
    border: AppPalette.gray300,
    card: Colors.white,
    shadow: AppPalette.gray200,
    grayCard: AppPalette.gray100,
    accent100: AppPalette.accent100,
    danger100: AppPalette.danger100,
    gray300: AppPalette.gray300,
    shimmerBase: const Color(0xffB4B4B4),
    shimmerHighlight: AppPalette.white,
  );

  //
  // Dark theme
  //

  static final dark = DarkTheme.copyWith(
    extensions: [
      _darkAppColors,
    ],
  );

  static final _darkAppColors = AppColorsExtension(
    primary: DarkTheme.colorScheme.primary,
    onPrimary: DarkTheme.colorScheme.onPrimary,
    secondary: DarkTheme.colorScheme.secondary,
    onSecondary: DarkTheme.colorScheme.onSecondary,
    error: DarkTheme.colorScheme.error,
    onError: DarkTheme.colorScheme.onError,
    background: DarkTheme.colorScheme.background,
    onBackground: DarkTheme.colorScheme.onBackground,
    surface: DarkTheme.colorScheme.surface,
    onSurface: DarkTheme.colorScheme.onSurface,
    standart: Colors.black,
    divider: AppPalette.darkGrey,

    ///Color.fromARGB(255, 56, 66, 87)
    text: Colors.white,
    primaryIcon: AppPalette.accent500,
    selectedTile: Colors.white.withOpacity(0.1),
    grayOpacity: Colors.white.withOpacity(0.08),
    grayOpacityText: Colors.white.withOpacity(0.5),
    blueOrigin: const Color.fromARGB(255, 66, 107, 255),
    orange500: const Color(0xFFF97316),
    green500: const Color(0xFF22C55E),
    scaffoldBackground: const Color(0xff282c34),
    border: AppPalette.gray800,
    card: const Color(0xff141414),
    shadow: const Color.fromARGB(255, 35, 35, 35).withOpacity(0.2),
    grayCard: const Color.fromARGB(255, 56, 66, 87),
    accent100: const Color.fromARGB(255, 56, 66, 87),
    danger100: const Color(0xff534141),
    gray300: const Color.fromARGB(255, 56, 66, 87),
    shimmerBase: const Color.fromARGB(255, 25, 25, 25),
    shimmerHighlight: const Color.fromARGB(255, 85, 85, 85),
  );
}
