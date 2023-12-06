import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:base/src/core/resource/domain/models/city.dart';
import 'package:base/src/core/resource/domain/models/latlng.dart';
import 'package:base/src/core/resource/domain/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:base/src/core/resource/data/db/preferences.dart';

/// Creates an instance of the [SharedPreferenceHelper] class and assigns it to a variable called sharedPreference.
final sharedPreference = SharedPreferenceHelper();

class SharedPreferenceHelper {
  late SharedPreferences _sharedPreference;

  /// A method that initializes the `SharedPreferences` instance.
  initSharedPreferences() async {
    _sharedPreference = await SharedPreferences.getInstance();
  }

  /// A getter that returns the `_sharedPreference` instance.
  SharedPreferences get prefs => _sharedPreference;

  /// A method that clears all values in the `_sharedPreference` instance.
  Future<void> clearAll() async {
    await _sharedPreference.clear();
  }

  /// Methods for settings and getting `kAppTheme`
  bool get isDarkMode => _sharedPreference.getBool(Preferences.kAppTheme) ?? false;
  Future setDarkMode(bool value) async => await _sharedPreference.setBool(Preferences.kAppTheme, value);

  Locale get locale => Locale(_sharedPreference.getString(Preferences.kLocale) ?? 'ru');
  Future setLocale(Locale value) async => await _sharedPreference.setString(Preferences.kLocale, value.languageCode);

  /// Methods for settings and getting `kFCMToken`
  String get fcmToken => _sharedPreference.getString(Preferences.kFCMToken) ?? '';
  Future setFCMToken(String value) async => await _sharedPreference.setString(Preferences.kFCMToken, value);

  /// Methods for settings and getting `kDeviceUUID`
  String get deviceUUID => _sharedPreference.getString(Preferences.kDeviceUUID) ?? '';
  Future setDeviceUUID(String value) async => await _sharedPreference.setString(Preferences.kDeviceUUID, value);

  /// Methods for settings and getting `kFirstRun`
  Future setFirstRun(bool value) async => await _sharedPreference.setBool(Preferences.kFirstRun, value);
  bool get isFirstRun => _sharedPreference.getBool(Preferences.kFirstRun) ?? true;

  /// Methods for settings and getting `kCurrentUser`
  UserModel get currentUser {
    Map<String, dynamic> jsonObject = json.decode(_sharedPreference.getString(Preferences.kCurrentUser) ?? "{}");
    return UserModel.fromJson(jsonObject);
  }

  Future setCurrentUser(UserModel value) async => await _sharedPreference.setString(Preferences.kCurrentUser, json.encode(value.toJson()));

  /// Methods for settings and getting `kSelectedCity`
  CityModel? get selectedCity {
    Map<String, dynamic>? jsonObject =
        _sharedPreference.getString(Preferences.kSelectedCity) != null ? json.decode(_sharedPreference.getString(Preferences.kSelectedCity)!) : null;
    return jsonObject != null ? CityModel.fromJson(jsonObject) : null;
  }

  Future setCity(CityModel? value) async => await _sharedPreference.setString(Preferences.kSelectedCity, json.encode(value!.toJson()));

  /// Methods for settings and getting `kLastFetchedLocation`
  LatLng? get lastLocation {
    Map<String, dynamic>? jsonObject = _sharedPreference.getString(Preferences.kLastFetchedLocation) != null
        ? json.decode(_sharedPreference.getString(Preferences.kLastFetchedLocation)!)
        : null;
    return jsonObject != null ? LatLng.fromJson(jsonObject) : null;
  }

  Future setLocation(LatLng? value) async => await _sharedPreference.setString(Preferences.kLastFetchedLocation, json.encode(value!.toJson()));

  /// Methods for settings and getting `lCoinsPopup`
  bool get isCoinsPopupVisibile => _sharedPreference.getBool(Preferences.lCoinsPopup) ?? true;
  Future setCoinsPopup(bool value) async => await _sharedPreference.setBool(Preferences.lCoinsPopup, value);

  /// Methods for settings and getting `lCoinsModule`
  bool get isCoinsModuleActive => _sharedPreference.getBool(Preferences.lCoinsModule) ?? true;
  Future setCoinsModule(bool value) async => await _sharedPreference.setBool(Preferences.lCoinsModule, value);
}
