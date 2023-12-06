import 'dart:math';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:base/src/core/common/exports/main_export.dart';

/// `kMaxEventNameLength` - This constant contains the maximum length of an event name.
const kMaxEventNameLength = 40;

/// `kMaxParameterLength` - This constant contains the maximum length of a parameter.
const kMaxParameterLength = 100;

final class Analytics {
  const Analytics._();

  /// [logFirebaseEvent] - This function logs a Firebase event.
  static Future<void> logFirebaseEvent({required String eventName, Map<String?, dynamic>? parameters}) async {
    parameters ??= {};
    final params = parameters.map((k, v) => MapEntry(k!, v));
    for (final entry in params.entries) {
      if (entry.value is! num) {
        var valStr = entry.value.toString();
        if (valStr.length > kMaxParameterLength) {
          valStr = valStr.substring(0, min(valStr.length, kMaxParameterLength));
        }
        params[entry.key] = valStr;
      }
    }
    try {
      await FirebaseAnalytics.instance.logEvent(name: eventName, parameters: params);

      dependenciesContainer.talker.logTyped(
          TalkerLog(
            'Firebase event logged: $eventName',
            title: "Firebase Analytics",
            pen: AnsiPen()..rgb(r: 255, g: 255, b: 0),
            logLevel: LogLevel.warning,
          ),
          logLevel: LogLevel.warning);
    } on Exception catch (e, st) {
      dependenciesContainer.talker.handle(e, st);
    }
  }
}
