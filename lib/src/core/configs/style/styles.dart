import 'package:base/src/core/common/exports/main_export.dart';

/// `AppStyles` - This class contains all app styles (without `TextStyle`).
final class AppStyles {
  static List<BoxShadow> getBoxShadow(BuildContext context) {
    return [
      BoxShadow(
        color: context.theme.appColors.shadow,
        blurRadius: 1,
        spreadRadius: 1,
      )
    ];
  }

  static ButtonStyle iconButtonStyle(BuildContext context) => ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(0.0)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.all<Color>(AppPalette.splash),
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
        iconColor: MaterialStateProperty.all<Color>(context.theme.appColors.text),
        foregroundColor: MaterialStateProperty.all<Color>(context.theme.appColors.text),
      );
}

/// `AppTextStyle` - This class contains all app text styles.
class AppTextStyle {
  // -------------------------------------------------- Custom - Label --------------------------------------------------

  static TextStyle _generateTextStyle(BuildContext context, double fontSize, FontWeight fontWeight, double letterSpacing, double lineSpacing) {
    return TextStyle(
      fontFamily: "Mulish",
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: context.theme.appColors.text,
      letterSpacing: letterSpacing,
      height: lineSpacing,
    );
  }

  /// [H] styles
  static TextStyle h1(BuildContext context) => _generateTextStyle(context, 32, FontWeight.w900, -0.2, 1.2);
  static TextStyle h2(BuildContext context) => _generateTextStyle(context, 26, FontWeight.w900, 0, 1.2);
  static TextStyle h3(BuildContext context) => _generateTextStyle(context, 20, FontWeight.w900, 0, 1.2);
  static TextStyle h4(BuildContext context) => _generateTextStyle(context, 16, FontWeight.w900, 0.2, 1.2);
  static TextStyle h5(BuildContext context) => _generateTextStyle(context, 14, FontWeight.w900, 0, 1.2);
  static TextStyle h6(BuildContext context) => _generateTextStyle(context, 12, FontWeight.w900, 0, 1.2);

  /// [B] styles
  static TextStyle b1(BuildContext context) => _generateTextStyle(context, 19, FontWeight.w400, 0.4, 1.3);
  static TextStyle b2(BuildContext context) => _generateTextStyle(context, 16, FontWeight.w400, 0.4, 1.3);
  static TextStyle b3(BuildContext context) => _generateTextStyle(context, 14, FontWeight.w400, 0.2, 1.4);
  static TextStyle b4(BuildContext context) => _generateTextStyle(context, 12, FontWeight.w400, 0.4, 1.3);
  static TextStyle b5(BuildContext context) => _generateTextStyle(context, 10, FontWeight.w400, 0.4, 1.2);
}
