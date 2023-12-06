/// [Preferences] is a class that contains all the keys for the shared preferences.

const String appIdentifier = 'base.project.app';

abstract interface class Preferences {
  static const String kAppTheme = 'kAppTheme$appIdentifier';
  static const String kToken = 'token$appIdentifier';
  static const String kLocale = 'locale$appIdentifier';
  static const String kCurrentUser = 'currentUser$appIdentifier';
  static const String kFCMToken = 'fcmToken$appIdentifier';
  static const String kDeviceUUID = 'deviceUUID$appIdentifier';
  static const String kFirstRun = 'firstRun$appIdentifier';
  static const String kSelectedCity = 'selectedCity$appIdentifier';
  static const String kLastFetchedLocation = 'lastFetchedLocation$appIdentifier';
  static const String lCoinsPopup = 'lCoinsPopup$appIdentifier';
  static const String lCoinsModule = 'lCoinsModule$appIdentifier';
}
