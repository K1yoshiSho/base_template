import 'package:base/src/core/common/exports/main_export.dart';
import 'package:firebase_messaging/firebase_messaging.dart' as fcm;
import 'package:google_api_availability/google_api_availability.dart';
import 'package:base/src/core/common/presentation/components/common/animated_logo.dart';
import 'package:base/src/core/resource/domain/models/token.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  static const String name = "Initial";
  static const String routePath = "/initial";

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    _checkToken();
    _initNotifications();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _checkToken() async {
    try {
      TokenModel? token = await UserSecureStorage.getToken();
      if (token != null) {
        // _profileBloc.add(const GetProfileInfoEvent());
      } else {
        // navigatorKey.currentContext?.goNamed(LoginScreen.name);
      }
    } on Exception catch (e, st) {
      dependenciesContainer.talker.handle(e, st);
      // navigatorKey.currentContext?.goNamed(LoginScreen.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AnimatedLogo(),
      ),
    );
  }

  Future<void> _initNotifications() async {
    fcm.FirebaseMessaging messaging = fcm.FirebaseMessaging.instance;
    if (Platform.isAndroid) {
      GooglePlayServicesAvailability availability = await GoogleApiAvailability.instance.checkGooglePlayServicesAvailability();
      dependenciesContainer.talker.info('🟠 GSM status: $availability');
      if (availability != GooglePlayServicesAvailability.success) {
        dependenciesContainer.talker.good('📲 Huawei is available');
        try {
          const HMSCore().initPlatformState();
        } on Exception catch (e, st) {
          dependenciesContainer.talker.handle(e, st);
          AppNotificationService.initNotifications(messaging: messaging);
          fcm.FirebaseMessaging.onBackgroundMessage(AppNotificationService.firebaseMessagingBackgroundHandler);
        }
      } else {
        dependenciesContainer.talker.good('📲 Google is available');
        AppNotificationService.initNotifications(messaging: messaging);
        fcm.FirebaseMessaging.onBackgroundMessage(AppNotificationService.firebaseMessagingBackgroundHandler);
      }
    } else {
      if (kReleaseMode) {
        AppNotificationService.initNotifications(messaging: messaging);
        fcm.FirebaseMessaging.onBackgroundMessage(AppNotificationService.firebaseMessagingBackgroundHandler);
      }
    }
  }
}
