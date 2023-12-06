import 'package:flutter/material.dart';

/// `LocaleProvider` - This class contains `Locale provider` for locale feature.

class RouterProvider extends ChangeNotifier {
  String? currentRoute;

  String? get getCurrentRoute => currentRoute;

  void setRoute(String value) {
    currentRoute = value;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
