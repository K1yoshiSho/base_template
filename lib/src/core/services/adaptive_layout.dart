import 'package:flutter/material.dart';

extension AdaptiveLayout on BuildContext {
  /// [layout] is a function that takes three parameters: [mobile], [tablet] and [desktop].
  Widget layout({
    required Widget mobile,
    required Widget tablet,
    required Widget desktop,
  }) {
    final shortestSide = MediaQuery.of(this).size.shortestSide;

    if (shortestSide < 600) {
      // Mobile layout
      return mobile;
    } else if (shortestSide < 1200 && shortestSide >= 600) {
      // Tablet layout
      return tablet;
    } else {
      // Desktop layout
      return desktop;
    }
  }
}

enum DeviceType {
  phone,
  tablet,
}

DeviceType getDeviceType(BuildContext context) {
  final data = MediaQuery.of(context);
  return data.size.shortestSide < 600 ? DeviceType.phone : DeviceType.tablet;
}

class AppScreenUtil {
  static double getDeviceHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  static bool isTablet(BuildContext context) {
    return getDeviceType(context) == DeviceType.tablet;
  }

  static double getDeviceWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static double getDevicePixelRatio(BuildContext context) {
    return MediaQuery.devicePixelRatioOf(context);
  }

  static double getDeviceTextScaleFactor(BuildContext context) {
    return MediaQuery.textScalerOf(context).scale(14);
  }

  static double getSizeForScreenHeight(BuildContext context, double height,
      {double? verySmall, double? small, double? medium, double? large, double? veryLarge}) {
    if (!AppScreenUtil.isTablet(context)) {
      if (height < 667) {
        return verySmall ?? height * 0.42;
      } else if (height >= 667 && height < 800) {
        return small ?? height * 0.44;
      } else if (height >= 800 && height <= 900) {
        return medium ?? height * 0.45;
      } else if (height > 900 && height <= 950) {
        return large ?? height * 0.525;
      } else {
        return veryLarge ?? height * 0.60;
      }
    } else {
      return height * 0.58;
    }
  }
}
