import 'package:flutter/material.dart';
import 'package:base/src/core/configs/final/theme.dart';

/// `ThemeExtension` template for custom colors.
///
/// For example purposes, it has all required fields from the default Material `ColorScheme`.
/// But you can add, rename and delete any fields your need.
///
/// ### Motivation
///
/// At the beginning, you may not know if your colors will fit into the Material `ColorScheme`,
/// but you still decided to start using `ColorScheme`, and only then realize that you need additional fields.
/// You will create `ThemeExtension` for only the additional fields, and as the result, you will have your colors
/// scattered between the `ColorScheme` and `ThemeExtension` with a few extra colors.
///
/// With this template, you can collect all fields in one place,
/// and don't worry about future changes to the Material or your design.
///
/// Or you can just quickly copy-paste this file and rename fields to your needs.
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.card,
    required this.divider,
    required this.text,
    required this.primaryIcon,
    required this.selectedTile,
    required this.grayOpacity,
    required this.grayOpacityText,
    required this.blueOrigin,
    required this.orange500,
    required this.green500,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.error,
    required this.onError,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.scaffoldBackground,
    required this.border,
    required this.standart,
    required this.shadow,
    required this.grayCard,
    required this.accent100,
    required this.danger100,
    required this.gray300,
    required this.shimmerBase,
    required this.shimmerHighlight,
  });

  final Color card;
  final Color divider;
  final Color text;
  final Color primaryIcon;
  final Color selectedTile;
  final Color grayOpacity;
  final Color grayOpacityText;
  final Color blueOrigin;
  final Color orange500;
  final Color green500;
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color error;
  final Color onError;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color scaffoldBackground;
  final Color border;
  final Color standart;
  final Color shadow;
  final Color grayCard;
  final Color accent100;
  final Color danger100;
  final Color gray300;
  final Color shimmerBase;
  final Color shimmerHighlight;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? card,
    Color? divider,
    Color? text,
    Color? primaryIcon,
    Color? selectedTile,
    Color? grayOpacity,
    Color? grayOpacityText,
    Color? blueOrigin,
    Color? orange500,
    Color? green500,
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? error,
    Color? onError,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? scaffoldBackground,
    Color? border,
    Color? standart,
    Color? shadow,
    Color? grayCard,
    Color? accent100,
    Color? danger100,
    Color? gray300,
    Color? shimmerBase,
    Color? shimmerHighlight,
  }) {
    return AppColorsExtension(
      card: card ?? this.card,
      divider: divider ?? this.divider,
      text: text ?? this.text,
      primaryIcon: primaryIcon ?? this.primaryIcon,
      selectedTile: selectedTile ?? this.selectedTile,
      grayOpacity: grayOpacity ?? this.grayOpacity,
      grayOpacityText: grayOpacityText ?? this.grayOpacityText,
      blueOrigin: blueOrigin ?? this.blueOrigin,
      orange500: orange500 ?? this.orange500,
      green500: green500 ?? this.green500,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      border: border ?? this.border,
      standart: standart ?? this.standart,
      shadow: shadow ?? this.shadow,
      grayCard: grayCard ?? this.grayCard,
      accent100: accent100 ?? this.accent100,
      danger100: danger100 ?? this.danger100,
      gray300: gray300 ?? this.gray300,
      shimmerBase: shimmerBase ?? this.shimmerBase,
      shimmerHighlight: shimmerHighlight ?? this.shimmerHighlight,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      card: Color.lerp(card, other.card, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      text: Color.lerp(text, other.text, t)!,
      primaryIcon: Color.lerp(primaryIcon, other.primaryIcon, t)!,
      selectedTile: Color.lerp(selectedTile, other.selectedTile, t)!,
      grayOpacity: Color.lerp(grayOpacity, other.grayOpacity, t)!,
      grayOpacityText: Color.lerp(grayOpacityText, other.grayOpacityText, t)!,
      blueOrigin: Color.lerp(blueOrigin, other.blueOrigin, t)!,
      orange500: Color.lerp(orange500, other.orange500, t)!,
      green500: Color.lerp(green500, other.green500, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      scaffoldBackground: Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      border: Color.lerp(border, other.border, t)!,
      standart: Color.lerp(standart, other.standart, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      grayCard: Color.lerp(grayCard, other.grayCard, t)!,
      accent100: Color.lerp(accent100, other.accent100, t)!,
      danger100: Color.lerp(danger100, other.danger100, t)!,
      gray300: Color.lerp(gray300, other.gray300, t)!,
      shimmerBase: Color.lerp(shimmerBase, other.shimmerBase, t)!,
      shimmerHighlight: Color.lerp(shimmerHighlight, other.shimmerHighlight, t)!,
    );
  }
}

/// Optional. If you also want to assign colors in the `ColorScheme`.
extension ColorSchemeBuilder on AppColorsExtension {
  ColorScheme toColorScheme(Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      error: error,
      onError: onError,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
    );
  }
}

/// Here you should define getters for your `ThemeExtension`s.
///
/// Never use `Theme.of(context).extension<MyColors>()!`
/// how they do it in the [official documentation](https://api.flutter.dev/flutter/material/ThemeExtension-class.html),
/// because it's not safe. Always create a getter for your `ThemeExtension` and use it instead.
///
/// Usage example: `Theme.of(context).appColors`.
extension AppThemeExt on ThemeData {
  AppColorsExtension get appColors => extension<AppColorsExtension>() ?? AppTheme.light.appColors;
}

extension ColorTranslation on Color {
  MaterialColor toMaterialColor() {
    final swatch = {
      50: Color.fromRGBO((red + (255 - red) * 0.95).toInt(), (green + (255 - green) * 0.95).toInt(), (blue + (255 - blue) * 0.95).toInt(), 1),
      100: Color.fromRGBO((red + (255 - red) * 0.9).toInt(), (green + (255 - green) * 0.9).toInt(), (blue + (255 - blue) * 0.9).toInt(), 1),
      200: Color.fromRGBO((red + (255 - red) * 0.8).toInt(), (green + (255 - green) * 0.8).toInt(), (blue + (255 - blue) * 0.8).toInt(), 1),
      300: Color.fromRGBO((red + (255 - red) * 0.7).toInt(), (green + (255 - green) * 0.7).toInt(), (blue + (255 - blue) * 0.7).toInt(), 1),
      400: Color.fromRGBO((red + (255 - red) * 0.6).toInt(), (green + (255 - green) * 0.6).toInt(), (blue + (255 - blue) * 0.6).toInt(), 1),
      500: Color.fromRGBO((red + (255 - red) * 0.5).toInt(), (green + (255 - green) * 0.5).toInt(), (blue + (255 - blue) * 0.5).toInt(), 1),
      600: Color.fromRGBO((red + (255 - red) * 0.4).toInt(), (green + (255 - green) * 0.4).toInt(), (blue + (255 - blue) * 0.4).toInt(), 1),
      700: Color.fromRGBO((red + (255 - red) * 0.3).toInt(), (green + (255 - green) * 0.3).toInt(), (blue + (255 - blue) * 0.3).toInt(), 1),
      800: Color.fromRGBO((red + (255 - red) * 0.2).toInt(), (green + (255 - green) * 0.2).toInt(), (blue + (255 - blue) * 0.2).toInt(), 1),
      900: Color.fromRGBO((red + (255 - red) * 0.1).toInt(), (green + (255 - green) * 0.1).toInt(), (blue + (255 - blue) * 0.1).toInt(), 1),
    };
    return MaterialColor(value, swatch);
  }
}
