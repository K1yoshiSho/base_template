import 'package:base/src/core/common/exports/main_export.dart';

class L10n {
  static final all = [
    const Locale('ru'),
    const Locale('en'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'em':
        return '🇬🇧';
      case 'ru':
      default:
        return '🇷🇺';
    }
  }
}

extension L10N on BuildContext {
  /// [l10n] - This function returns the AppLocalizations object for the current context
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
