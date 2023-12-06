// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:device_preview/device_preview.dart';
import 'package:base/src/core/common/state/blocs/banner/app_banner_bloc.dart';
import 'package:base/src/core/common/exports/main_export.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:huawei_push/huawei_push.dart' as hms;
import 'package:base/src/core/common/state/blocs/device_info/device_info_bloc.dart';
import 'package:base/src/core/resource/data/providers/collections_notifier.dart';
import 'package:base/src/core/resource/data/providers/location_notifier.dart';
import 'package:base/src/core/resource/data/providers/router_provider.dart';
import 'package:base/src/core/resource/data/repositories/app_banner_repository.dart';
import 'package:base/src/core/resource/data/repositories/card_repository.dart';
import 'package:base/src/core/resource/data/repositories/device_info_repository.dart';

/// [backgroundMessageCallback] - This function is called when a background message is received. (Huawei only)
/// It must be [top-level] function.

void backgroundMessageCallback(hms.RemoteMessage remoteMessage) async {
  if (kDebugMode) {
    print("remoteMessage: ${remoteMessage.toString()}");
  }
  String? data = remoteMessage.data;
  if (data != null) {
    debugPrint(
      'Background message is received, sending local notification.',
    );
    hms.Push.localNotification(
      <String, String>{
        hms.HMSLocalNotificationAttr.TITLE: json.decode(data)['title'],
        hms.HMSLocalNotificationAttr.MESSAGE: json.decode(data)['body'],
        hms.HMSLocalNotificationAttr.NUMBER: json.decode(data)['document_id'].toString(),
      },
    );
  } else {
    debugPrint(
      'Background message is received. There is no data in the message.',
    );
  }
}

/// This is the [main] function of the app and it [initializes] all the
/// required [dependencies, services, settings, and configurations] before running the app.

Future bootstrapper({required bool isProd}) async {
  // The 'runZonedGuarded' method runs a function within the context of a Zone.
  runZonedGuarded(() async {
    // Sets debugZoneErrorsAreFatal to true which ensures that any errors occurring in the framework during startup are treated as fatal.
    BindingBase.debugZoneErrorsAreFatal = true;

    // Ensures that the Flutter app is initialized with WidgetsFlutterBinding.
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    // // Preserves the native splash screen on the screen for some time and displays it until the Flutter app is fully loaded.
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    // Initializes the talker service of the app.
    final Talker talker = TalkerFlutter.init(
        settings: TalkerSettings(
      useHistory: true,
    ));

    dependenciesContainer.init(
      talker: talker,
      appBannerRepository: DataAppBannerRepository(),
      cardRepository: DataCardRepository(),
      deviceInfoRepository: DataDeviceInfoRepository(),
    );

    DartPluginRegistrant.ensureInitialized();

    // Asserts whether the current zone is named "startup".
    assert(widgetsBinding.debugCheckZone('startup'));
    sharedPreference.initSharedPreferences();

    // Initiates the Firebase app and waits until its initialization is completed.
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Initializes the talker service again.
    await initHandling(talker: talker);

    // Sets the preferred screen orientation to portrait up mode.
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    talker.good("📱 App Started");

    // Configures the FlavorConfig settings of the app.
    FlavorConfig(
      name: isProd ? FlavorKey.kProduction : FlavorKey.kDevelopment,
      color: AppPalette.primaryColor,
      location: BannerLocation.topStart,
      variables: {
        FlavorKey.kIsProduction: isProd,
      },
    );

    // Runs the app with MultiProvider, which provides a way to share data across the widget tree.
    runApp(MultiProvider(
      providers: [
        BlocProvider(create: (context) => AppBannerBloc()),
        BlocProvider(create: (context) => DeviceInfoBloc()),
        ChangeNotifierProvider(create: (context) => LocaleNotifier()),
        ChangeNotifierProvider(create: (context) => LocationNotifier()),
        ChangeNotifierProvider(create: (context) => RouterProvider()),
        ChangeNotifierProvider(create: (context) => CollectionsNotifier()),
      ],
      child: DevicePreview(
        enabled: false,
        builder: (context) => const LocaApp(),
      ),
    ));
  }, (error, stackTrace) {
    // If the app is in production mode, records the error in Firebase Crashlytics.
    if (FlavorConfig.instance.name == FlavorKey.kProduction && kDebugMode == false) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    }

    // Handles the error using the talker service.
    dependenciesContainer.talker.handle(error, stackTrace);
  });
}
