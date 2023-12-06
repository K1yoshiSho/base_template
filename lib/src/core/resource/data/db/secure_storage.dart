import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:base/src/core/resource/domain/models/token.dart';
import 'package:base/src/core/resource/data/db/preferences.dart';

/// This class is called [UserSecureStorage] for preserving user data in the secure storage.

class UserSecureStorage {
  /// Here, we create a static const `FlutterSecureStorage` object, with `encryptedSharedPreferences` enabled for Android.

  static const FlutterSecureStorage storage = FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  /// Methods for settings and getting `kToken`
  static Future<TokenModel?> getToken() async {
    String? token = await storage.read(key: Preferences.kToken);
    Map<String, dynamic>? jsonObject = token != null ? json.decode(token) : null;
    return jsonObject != null ? TokenModel.fromJson(jsonObject) : null;
  }

  static Future setToken(TokenModel? value) async => await storage.write(key: Preferences.kToken, value: json.encode(value?.toJson()));
}
