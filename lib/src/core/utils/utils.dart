// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:developer';
import 'package:base/src/core/common/exports/intl_export.dart';
import 'package:base/src/core/common/exports/main_export.dart';
import 'package:timeago/timeago.dart' as timeago;

final class AppUtils {
  const AppUtils();

  static T valueOrDefault<T>(T value, T defaultValue) => (value is String && value.isEmpty) || value == null ? defaultValue : value;

  static String dateFormat({required String format, required DateTime? dateTime}) {
    if (dateTime == null) {
      return '';
    }
    if (format == 'relative') {
      return timeago.format(dateTime, locale: sharedPreference.locale.languageCode);
    }
    return DateFormat(format).format(dateTime);
  }

  static String getFileSizeInt(int size) {
    if (size < 1024) {
      return "$size B";
    } else if (size < 1048576) {
      return "${(size / 1024).toStringAsFixed(2)} KB";
    } else if (size < 1073741824) {
      return "${(size / 1048576).toStringAsFixed(2)} MB";
    } else {
      return "${(size / 1073741824).toStringAsFixed(2)} GB";
    }
  }

  static void popUntilPath(BuildContext context, String routePath) {
    while (GoRouter.of(context).routerDelegate.currentConfiguration.matches.last.matchedLocation != routePath) {
      log(GoRouter.of(context).routerDelegate.currentConfiguration.matches.last.matchedLocation);
      if (!context.canPop()) {
        return;
      }
      context.pop();
    }
  }

  static String getTranslatedValue({required String? ru, required String? kz, String? defaultValue, String? localeCode}) {
    return switch (localeCode ?? sharedPreference.locale.languageCode) {
      "ru" => ru?.isNotEmpty == true ? ru! : defaultValue ?? "-",
      "kk" => kz?.isNotEmpty == true ? kz! : defaultValue ?? "-",
      _ => defaultValue ?? "-",
    };
  }

  /// `lauchURL` - launches a URL in the browser or in the app, depending on the [mode] parameter.
  static Future<void> launchURL(String url, {LaunchMode? mode}) async {
    if (!await launchUrl(Uri.parse(url), mode: mode ?? LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  /// [removeToken] - This function removes the token stored in secure storage, clears all providers used by the app, and navigates to the LoginScreen.
  /// If paramIsFromDrawer is true, it is passed as an extra parameter to the LoginScreen. Otherwise, the default value of false is used for this parameter.
  static Future<void> removeToken() async {
    // Log a debug message using an instance of Talker obtained from the service locator
    dependenciesContainer.talker.warning('🥴 remove token');

    // Set the token stored in secure storage to null using await
    await UserSecureStorage.setToken(null);

    // // Access the context of the current navigator and clear all the providers related to Home screen and Create Document Screen
    // // navigatorKey.currentContext?.read<HomeProvider>().clearAll();
    // navigatorKey.currentContext?.read<CreateDocumentProvider>().clearAll();

    // // Navigate to the LoginScreen and replace the current route with it, while passing the extra parameter indicating whether the logout is from the drawer or not.
    // // If [paramIsFromDrawer] is not null, use its value. Otherwise, use the default value of false.
    // navigatorKey.currentContext?.pushReplacementNamed(LoginScreen.name);
  }

  /// [getFileSize] - This function returns the size of a file at the specified filepath in bytes.
  static int getFileSize(String filepath) {
    // Create a new File object for the specified file path and get its length synchronously.
    return File(filepath).lengthSync();
  }

  /// [exitFromAccount] - This function removes the token stored in secure storage, clears all providers used by the app, and navigates to the LoginScreen.
  /// If paramIsFromDrawer is true, it is passed as an extra parameter to the LoginScreen. Otherwise, the default value of false is used for this parameter.
  static Future<void> exitFromAccount() async {
    // Log a debug message using an instance of Talker obtained from the service locator
    dependenciesContainer.talker.debug('Action: exitFromAccount');

    // Set the token stored in secure storage to null using await
    await UserSecureStorage.setToken(null);

    // // Access the context of the current navigator and clear all the providers related to Home screen and Create Document Screen
    // navigatorKey.currentContext?.read<HomeProvider>().clearAll();
    // navigatorKey.currentContext?.read<CreateDocumentProvider>().clearAll();

    // // Navigate to the LoginScreen and replace the current route with it, while passing the extra parameter indicating whether the logout is from the drawer or not.
    // // If [paramIsFromDrawer] is not null, use its value. Otherwise, use the default value of false.
    // navigatorKey.currentContext?.pushReplacementNamed(
    //   LoginScreen.name,
    //   extra: {ScreenExtras.isInitial: false},
    // );
  }

  /// [getLocaizedBool] - This function return localized bool value for a given bool value.
  static String getLocaizedBool(bool input, AppLocalizations appLocalizations) {
    if (input) {
      return appLocalizations.yes;
    } else {
      return appLocalizations.no;
    }
  }

  /// [toSimpleEnumString] - This function return enum string for a given enum.
  static String? toSimpleEnumString<T>(T e) {
    if (e == null) return null;
    return e.toString().split('.')[1];
  }

  /// [convertNumsOfReviewers] - This function return string of reviewers for a given list of numbers for API request.
  static String convertNumsOfReviewers(List<int> numsOfReviewers) {
    return 'id__in[]=${numsOfReviewers.map((number) => '$number').join('&id__in[]=')}';
  }

  static String convertNumsOfNewsFeed(List<int> numsOfReviewers) {
    return 'id__not_in[]=${numsOfReviewers.map((number) => '$number').join('&id__not_in[]=')}';
  }

  /// [getLocaleBackend] - This function return 'kz' instead of 'kk' for a given locale.
  static String getLocaleBackend(String locale) {
    if (locale == 'kk') {
      return 'kz';
    } else {
      return 'ru';
    }
  }

  /// [getDefaultHeadersMultiPart] - This function return default headers for multipart/form-data.
  static Map<String, dynamic> getDefaultHeadersMultiPart() {
    return {
      'content-type': 'multipart/form-data',
      'contentType': 'multipart/form-data',
      "FCM-token": sharedPreference.fcmToken,
      "uuid": sharedPreference.deviceUUID,
      "Lang": sharedPreference.locale.languageCode,
      "cityId": sharedPreference.selectedCity?.id.toString(),
    };
  }

  /// [getDefaultHeaders] - This function return default headers.
  static Map<String, dynamic> getDefaultHeaders() {
    return {
      "FCM-Token": sharedPreference.fcmToken,
      "uuid": sharedPreference.deviceUUID,
      "Lang": sharedPreference.locale.languageCode,
      "cityId": sharedPreference.selectedCity?.id.toString() ?? "1",
    };
  }
}

T provide<T>(BuildContext context) {
  return Provider.of<T>(context);
}

T provideOnce<T>(BuildContext context) {
  return Provider.of<T>(context, listen: false);
}

T? provideOrNull<T>(BuildContext context) {
  try {
    return provide(context);
  } catch (error) {
    return null;
  }
}

T? provideOnceOrNull<T>(BuildContext context) {
  try {
    return provideOnce(context);
  } catch (error) {
    return null;
  }
}
