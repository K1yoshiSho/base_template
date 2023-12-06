// ignore_for_file: depend_on_referenced_packages
import 'package:base/bootstrap.dart';
import 'package:base/src/core/common/exports/main_export.dart';

/// This is the [main] function of the app and it [initializes] all the
/// required [dependencies, services, settings, and configurations] before running the app.

Future main() async {
  await bootstrapper(isProd: false);
}
