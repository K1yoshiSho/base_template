import 'dart:math';

import 'package:flutter/material.dart';

/// `AppPalette` is abstract because we don’t ever need to instantiate it. `_GreyColors` is private, because we don’t allow access to it directly, but only through the AppPalette.

abstract interface class AppPalette {
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  // Const colors
  static const Color inactiveColor = Color(0xffE2E8F0);
  static const Color grayText = Color.fromARGB(255, 144, 144, 144);
  static const Color abyss = Color(0xFF0B1632);
  static const Color primary = Color(0xFF353E4D);
  static const Color success = Color(0xFF00E878);
  static const Color splash = Color.fromARGB(60, 119, 117, 117);
  static const Color shimmerH = Color.fromARGB(66, 212, 212, 212);
  static const Color splashMButton = Color.fromARGB(51, 158, 158, 158);
  static const Color highlight = Color.fromARGB(73, 119, 117, 117);
  static const Color background = Color(0xffFAFBFF);
  static const Color darkBackground = Colors.black;
  static const Color blue300 = Color(0xff93C5FD);
  static const Color orange = Color(0xffE5714C);
  static const Color green = Color(0xFF08A652);

  /// Danger
  static const Color danger = Color(0xFFef4444);
  static const Color danger100 = Color(0xFFfef2f2);

  /// Grey
  // static const gray = _GreyColors();
  static const Color gray100 = Color(0xffF6F6F6);
  static const Color gray200 = Color(0xFFECECEC);
  static const Color gray300 = Color(0xffE2E2E2);
  static const Color gray600 = Color(0xffA4A4A4);
  static const Color gray700 = Color(0xff909090);
  static const Color gray800 = Color(0xff7C7C7C);
  static const Color gray900 = Color(0xff676767);
  static const Color gray1000 = Color(0xff535353);

  /// Accent
  static const Color accent100 = Color(0xfff8faff);
  static const Color accent200 = Color(0xffE5EDFD);
  static const Color accent500 = Color(0xff6485C6);
  static const Color accent600 = Color(0xFF3C4A7C);

  static const Color greenSuccessColor = Color(0xFF00E878);
  static const Color darkGrey = Color(0xFF464646);
  static const Color lightGrey = Color(0xFF7D7D7D);
  static const Color cancelColor = Color(0xFFFFFFFF);
  static const Color mainPink = Color(0xFFF41A80);
  static const Color mainBlue = Color(0xFF0EA1F1);
  static const Color mainYellow = Color(0xFFFDBD01);
  static const Color mainGreen = Color(0xFF13D075);
  static const Color menuBlack = Color(0xFF141414);
  static const Color textBlack = Color(0xFF2F2F2F);
  static const Color grey2 = Color(0xFF4F4F4F);

  static const mainColors = [
    AppPalette.mainGreen,
    AppPalette.mainYellow,
    AppPalette.mainBlue,
    AppPalette.mainPink,
  ];

  static const randomColors = [
    AppPalette.mainGreen,
    AppPalette.mainYellow,
    AppPalette.mainBlue,
    AppPalette.mainPink,
    AppPalette.mainGreen,
    AppPalette.mainYellow,
    AppPalette.mainBlue,
    AppPalette.mainPink,
    AppPalette.mainGreen,
    AppPalette.mainYellow,
    AppPalette.mainBlue,
    AppPalette.mainPink,
    AppPalette.mainGreen,
    AppPalette.mainYellow,
    AppPalette.mainBlue,
    AppPalette.mainPink,
  ];

  static int get genMainColorsId => Random().nextInt(AppPalette.mainColors.length);

  static Color get randomColor => randomColors[Random().nextInt(AppPalette.randomColors.length)];

  ///

  static const Color greyTextColor = Color(0xFFA0A0A0);
  static const Color slightlyBlackColor = Color(0xFF0A0A0A);
  static const Color greySecondTextColor = Color(0xFF8A8A91);
  static const Color greySubTitleTextColor = Color(0xFF9BA5B7);
  static const Color followTextColor = Color(0xFF8292AE);
  static const Color greySubTextColor = Color(0xFF151523);
  static const Color blackTextColor = Color(0xFF353E4D);
  static const Color whiteTextColor = Color(0xFFD0D0D0);
  static const Color blackTextColor2 = Color(0xFF2B2B2D);
  static const Color blackTextColor3 = Color(0xFF4D4D52);
  static const Color greyTextColor2 = Color(0xFF737373);
  static const Color activeTabColor = Color(0xFF272728);

  static const Color greyBackGround = Color(0xFFF3F3F3);

  static const Color gridOneTextColor = Color(0xFFEB755B);
  static const Color gridTwoTextColor = Color(0xFFB1432B);
  static const Color bottomTabColor = Color(0xFFA18787);
  static const Color bottomActiveTabColor = Color(0xFFD35A3F);

  static const Color dividerColor = Color(0xFFE2E2E2);

  static Gradient boxLinearGradient = const LinearGradient(
    colors: <Color>[AppPalette.gridTwoTextColor, AppPalette.gridOneTextColor],
  );

  static Gradient boxGreyLinearGradient = LinearGradient(
    colors: <Color>[
      AppPalette.greyTextColor.withOpacity(.5),
      AppPalette.greyTextColor.withOpacity(.5),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static Color getColor(int index) {
    final length = mainColors.length;
    if (index < length) {
      return mainColors[index];
    }
    if ((index + 1) % length == 0) {
      return mainColors.last;
    }
    final colorIndex = length - ((index + 1) % length);
    return mainColors[colorIndex - 1];
  }

  static Shader linearGradient = const LinearGradient(
    colors: <Color>[AppPalette.gridTwoTextColor, AppPalette.gridOneTextColor],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  static const MaterialColor primaryColor = MaterialColor(
    0xFF353E4D,
    <int, Color>{
      50: primary,
      100: primary,
      200: primary,
      300: primary,
      400: primary,
      500: primary,
      600: primary,
      700: primary,
      800: primary,
      900: primary,
    },
  );
}
