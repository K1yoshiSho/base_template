// ignore_for_file: non_constant_identifier_names

import 'package:base/src/core/common/exports/main_export.dart';

/// `DarkTheme` - This is dark theme of the application.
final ThemeData DarkTheme = ThemeData(
  scaffoldBackgroundColor: AppPalette.black,
  brightness: Brightness.light,
  splashColor: AppPalette.splash,
  dividerColor: AppPalette.gray800,
  menuButtonTheme: MenuButtonThemeData(
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppPalette.darkBackground)),
  ),
  tooltipTheme: const TooltipThemeData(
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 56, 66, 87),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    textStyle: TextStyle(
      fontFamily: "Mulish",
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.white,
    ),
  ),
  menuTheme: MenuThemeData(
    style: MenuStyle(backgroundColor: MaterialStateProperty.all(AppPalette.darkBackground)),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: AppPalette.darkBackground,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  menuBarTheme: MenuBarThemeData(
    style: MenuStyle(backgroundColor: MaterialStateProperty.all(AppPalette.darkBackground)),
  ),
  dividerTheme: const DividerThemeData(
    color: Color.fromARGB(255, 56, 66, 87),
    thickness: 1,
    space: 0,
  ),
  splashFactory: NoSplash.splashFactory,
  highlightColor: AppPalette.splash,
  primaryColor: const Color.fromRGBO(53, 62, 77, 1),
  unselectedWidgetColor: AppPalette.white,
  primaryColorLight: AppPalette.gray800,
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(0.0)),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.all<Color>(AppPalette.splash),
      shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
      iconColor: MaterialStateProperty.all<Color>(Colors.white),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
  ),
  listTileTheme: ListTileThemeData(
    selectedColor: Colors.white,
    selectedTileColor: const Color.fromARGB(255, 56, 66, 87),
    horizontalTitleGap: 5,
    tileColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color.fromARGB(255, 56, 66, 87),
    showDragHandle: false,
    modalBackgroundColor: Colors.white,
    modalElevation: 0,
    elevation: 0,
  ),
  dialogTheme: DialogTheme(
    backgroundColor: const Color(0xff282c34),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white, size: 20),
  textTheme: const TextTheme(
    labelLarge: TextStyle(
      fontFamily: "Mulish",
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color.fromARGB(255, 120, 128, 134),
    ),
    labelMedium: TextStyle(
      fontFamily: "Mulish",
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Color.fromARGB(255, 120, 128, 134),
    ),
    labelSmall: TextStyle(
      fontFamily: "Mulish",
      fontWeight: FontWeight.w400,
      fontSize: 10,
      color: Color.fromARGB(255, 120, 128, 134),
    ),
    titleLarge: TextStyle(
      fontFamily: "Mulish",
      fontWeight: FontWeight.w700,
      fontSize: 22,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontFamily: "Mulish",
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontFamily: "Mulish",
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Mulish",
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Mulish",
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontFamily: "Mulish",
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Colors.white,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 20,
    ),
    filled: true,
    floatingLabelStyle: const TextStyle(
      fontFamily: "Mulish",
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.red,
    ),
    helperStyle: const TextStyle(
      fontFamily: "Mulish",
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.red,
    ),
    prefixIconColor: Colors.white,
    suffixIconColor: Colors.white,
    fillColor: AppPalette.darkBackground,
    focusColor: Colors.white,
    hoverColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppPalette.gray800,
        width: 1.5,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppPalette.gray800,
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppPalette.primaryColor,
        width: 1.5,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppPalette.gray800,
        width: 1.5,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppPalette.danger,
        width: 1.5,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppPalette.danger,
        width: 1.5,
      ),
    ),
    labelStyle: const TextStyle(
      fontFamily: "Mulish",
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.white,
    ),
    hintStyle: const TextStyle(
      fontFamily: "Mulish",
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: AppPalette.grayText,
    ),
    iconColor: Colors.white,
  ),
  buttonTheme: const ButtonThemeData(
    splashColor: AppPalette.splash,
    highlightColor: AppPalette.splash,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.all<Color>(AppPalette.highlight),
      foregroundColor: MaterialStateProperty.all<Color>(AppPalette.accent500),
      shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
    ),
  ),
  actionIconTheme: ActionIconThemeData(
    closeButtonIconBuilder: (context) => const Icon(Icons.close, color: AppPalette.abyss),
  ),
  datePickerTheme: DatePickerThemeData(
    backgroundColor: AppPalette.darkBackground,
    elevation: 0,
    shadowColor: AppPalette.splash,
    surfaceTintColor: AppPalette.splash,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    headerBackgroundColor: AppPalette.primaryColor,
    headerForegroundColor: Colors.white,
    headerHeadlineStyle: const TextStyle(
      fontFamily: "Mulish",
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    headerHelpStyle: const TextStyle(
      fontFamily: "Mulish",
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    weekdayStyle: const TextStyle(
      fontFamily: "Mulish",
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    dayStyle: const TextStyle(
      fontFamily: "Mulish",
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    rangePickerElevation: 0,
    rangePickerShadowColor: AppPalette.splash,
    rangePickerSurfaceTintColor: AppPalette.splash,
    rangePickerHeaderHeadlineStyle: const TextStyle(
      fontFamily: "Mulish",
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    rangePickerHeaderForegroundColor: AppPalette.accent100,
    rangeSelectionBackgroundColor: AppPalette.accent200,
    rangePickerHeaderBackgroundColor: AppPalette.success,
    rangePickerBackgroundColor: AppPalette.accent100,
    rangeSelectionOverlayColor: MaterialStateProperty.all(AppPalette.success),
    rangePickerHeaderHelpStyle: const TextStyle(
      fontFamily: "Mulish",
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    yearStyle: const TextStyle(
      fontFamily: "Mulish",
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppPalette.accent500,
    ),
    dayOverlayColor: MaterialStateProperty.all(AppPalette.splash),
    yearOverlayColor: MaterialStateProperty.all(AppPalette.splash),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppPalette.accent500,
    selectionColor: const Color(0xFF3C4A7C).withOpacity(0.40),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    circularTrackColor: Colors.transparent,
    color: AppPalette.accent500,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppPalette.accent500,
  ),
  appBarTheme: const AppBarTheme(
    color: AppPalette.black,
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: 'Mulish',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Colors.white,
    ),
    // systemOverlayStyle: SystemUiOverlayStyle(
    //   statusBarBrightness: Brightness.light,
    //   statusBarColor: AppPalette.abyssColor,
    // ),
    iconTheme: IconThemeData(color: Colors.white, size: 20),
  ),
  tabBarTheme: const TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: Colors.transparent,
  ),
  switchTheme: SwitchThemeData(
    overlayColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) return AppPalette.accent500;
      return AppPalette.gray300;
    }),
    thumbColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) return AppPalette.accent500;
      return AppPalette.gray300;
    }),
    trackColor: MaterialStateProperty.all(const Color(0xFFE0E2D8)),
  ).copyWith(
    thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return AppPalette.gray300;
      }
      if (states.contains(MaterialState.selected)) {
        return AppPalette.accent500;
      }
      return AppPalette.gray300;
    }),
    trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return AppPalette.gray300;
      }
      if (states.contains(MaterialState.selected)) {
        return AppPalette.accent500;
      }
      return AppPalette.gray300;
    }),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(AppPalette.accent500),
  ).copyWith(
    fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return AppPalette.gray300;
      }
      if (states.contains(MaterialState.selected)) {
        return AppPalette.accent500;
      }
      return AppPalette.gray300;
    }),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return AppPalette.accent500;
      }
      return Colors.transparent;
    }),
    overlayColor: MaterialStateProperty.all(AppPalette.splash),
    side: const BorderSide(
      color: AppPalette.gray300,
      width: 1.5,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    checkColor: MaterialStateProperty.all(Colors.white),
  ),
  canvasColor: AppPalette.darkBackground,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppPalette.primaryColor,
    onPrimary: Colors.black,
    onSurface: Colors.black,
    primary: AppPalette.randomColor,
    background: AppPalette.black,
  ),
);
