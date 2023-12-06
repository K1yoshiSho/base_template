import 'package:flutter/material.dart';

extension AppThemeExtension on BuildContext {
  /// [theme] - This function returns the ThemeData object for the current context
  ThemeData get theme => Theme.of(this);
}
