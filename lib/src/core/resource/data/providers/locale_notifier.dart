import 'package:flutter/material.dart';
import 'package:base/src/core/resource/data/db/shared_preferences.dart';

/// `LocaleProvider` - This class contains `Locale provider` for locale feature.

class LocaleNotifier extends ChangeNotifier {
  Locale? locale;

  Locale get getLocale => locale ?? sharedPreference.locale;

  void setLocale(Locale value) {
    locale = value;
    sharedPreference.setLocale(value);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
