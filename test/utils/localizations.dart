// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:base/src/core/common/exports/main_export.dart';

Future<AppLocalizations> getLocalizations(WidgetTester t) async {
  late AppLocalizations result;
  await t.pumpWidget(
    MaterialApp(
      supportedLocales: L10n.all,
      locale: const Locale("ru"),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: Material(
        child: Builder(
          builder: (BuildContext context) {
            result = AppLocalizations.of(context)!;
            return Container();
          },
        ),
      ),
    ),
  );
  return result;
}

Future<BuildContext> getContext(WidgetTester t) async {
  late BuildContext result;
  await t.pumpWidget(
    MaterialApp(
      supportedLocales: L10n.all,
      locale: const Locale("ru"),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: Material(
        child: Builder(
          builder: (BuildContext context) {
            result = context;
            return Container();
          },
        ),
      ),
    ),
  );
  return result;
}
