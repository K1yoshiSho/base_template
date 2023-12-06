import 'dart:io';

import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Size get size => MediaQuery.sizeOf(this);

  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  double get height => MediaQuery.sizeOf(this).height;

  double get width => MediaQuery.sizeOf(this).width;

  double get bottomPadding => Platform.isIOS ? 90 : 75;
}
