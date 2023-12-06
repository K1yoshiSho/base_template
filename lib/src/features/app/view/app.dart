part of '../app.dart';

/// This code defines the [LocaApp] class which extends StatefulWidget and WidgetsBindingObserver.
class LocaApp extends StatefulWidget with WidgetsBindingObserver {
  const LocaApp({super.key});

  @override
  State<LocaApp> createState() => _LocaAppState();
}

class _LocaAppState extends State<LocaApp> with WidgetsBindingObserver {
  late final GoRouter _router = createRouter();
  late final AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  /// `initState` - removes `token`, sets up the loading indicator using `EasyLoading` package and `removes native splash` screen.
  @override
  void initState() {
    _setUUID();
    _initDeepLinks();

    _router.routerDelegate.addListener(() {
      dependenciesContainer.talker.logTyped(
        TalkerLog(
          _router.routerDelegate.currentConfiguration.last.matchedLocation,
          title: WellKnownTitles.route.title,
          pen: AnsiPen()..rgb(r: 0.5, g: 0.5, b: 1.0),
          logLevel: LogLevel.info,
        ),
        logLevel: LogLevel.info,
      );
      provideOnce<RouterProvider>(context).setRoute(_router.routerDelegate.currentConfiguration.last.matchedLocation);
    });
    if (sharedPreference.isFirstRun) {
      FlutterSecureStorage storage = const FlutterSecureStorage();
      storage.deleteAll();
      sharedPreference.setFirstRun(false);
    }
    timeago.setLocaleMessages("ru", timeago.RuMessages());
    timeago.setLocaleMessages("en", timeago.EnMessages());

    super.initState();

    // Setting up EasyLoading instance
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 1500)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = AppPalette.primaryColor
      ..backgroundColor = Colors.white
      ..indicatorColor = AppPalette.primaryColor
      ..textColor = AppPalette.primaryColor
      ..maskColor = Colors.white.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;

    FlutterNativeSplash.remove();
  }

  Future<void> _setUUID() async {
    final String uuid = await DeviceUuid().getUUID() ?? "";
    sharedPreference.setDeviceUUID(uuid);
  }

  Future<void> _initDeepLinks() async {
    _appLinks = AppLinks();

    // Check initial link if app was in cold state (terminated)
    // final appLink = await _appLinks.getInitialAppLink();
    // if (appLink != null) {
    //   dependenciesContainer.talker.debug('getInitialAppLink: $appLink');
    //   openAppLink(appLink);
    // }

    // Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      dependenciesContainer.talker.debug('onAppLink: $uri');
      openAppLink(uri);
    });
  }

  void openAppLink(Uri uri) {
    navigatorKey.currentContext?.push(uri.path);
  }

  // Called when the widget is removed from the widget tree.
  @override
  void dispose() {
    if (kDebugMode) {}
    WidgetsBinding.instance.removeObserver(this);

    Push.disableLogger();
    _linkSubscription?.cancel();
    super.dispose();
  }

  // Build function that returns a MaterialApp instance with necessary configurations.
  @override
  Widget build(BuildContext context) {
    Locale locale = Provider.of<LocaleNotifier>(context).getLocale;
    return UpgradeAlert(
      navigatorKey: navigatorKey,
      upgrader: Upgrader(
        debugLogging: false,
        languageCode: sharedPreference.locale.languageCode,
        dialogStyle: Platform.isIOS ? UpgradeDialogStyle.cupertino : UpgradeDialogStyle.material,
      ),
      child: MaterialApp.router(
        title: "Base project",
        onGenerateTitle: (context) => "Base project",
        locale: locale,
        routerConfig: _router,
        supportedLocales: L10n.all,
        theme: AppTheme.dark,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: (FlavorConfig.instance.name == FlavorKey.kDevelopment) ? true : false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        builder: (context, child) {
          child = DevicePreview.appBuilder(context, child);
          child = EasyLoading.init()(context, child);
          child = MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)), child: child);
          return child;
        },
      ),
    );
  }
}
