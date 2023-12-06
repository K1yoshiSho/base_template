// ignore_for_file: use_build_context_synchronously

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:base/src/core/common/exports/main_export.dart';

/// [AppNotifications] - This class contains channel keys and permission method.

final class AppNotifications {
  static const String channelGroupKey = 'basic_channel_group';
  static const String channelKey = 'locaKey';
  static const String channelName = 'Base project';
  static const String channelDescription = 'Be local with Base project';

  static Future<void> permissions({required BuildContext context}) async {
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    dependenciesContainer.talker.debug(settings.authorizationStatus);
    if (settings.authorizationStatus == AuthorizationStatus.denied || settings.authorizationStatus == AuthorizationStatus.provisional) {
      showDialog(
          barrierDismissible: false,
          barrierColor: Colors.black38,
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              contentPadding: const EdgeInsets.all(20),
              backgroundColor: context.theme.scaffoldBackgroundColor,
              elevation: 0,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      // image: const DecorationImage(
                      //   image: AssetImage(AppImages.permissionBackground),
                      //   filterQuality: FilterQuality.high,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    height: MediaQuery.sizeOf(context).height * 0.12,
                    width: MediaQuery.sizeOf(context).width,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
                        ),
                        // Align(
                        //   alignment: Alignment.center,
                        //   child: Image.asset(
                        //     height: 50,
                        //     AppImages.notificationPermission,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  // Text(
                  //   context.l10n!.weWantSendNotification,
                  //   style: AppTextStyle.bodyMedium400(context).copyWith(fontSize: 14),
                  // ),
                  const Gap(30),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    child: Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            text: context.l10n.yes,
                            buttonColor: AppPalette.accent500,
                            fontSize: 12,
                            onPressed: () {
                              // AppSettings.openAppSettings(type: (Platform.isIOS) ? AppSettingsType.settings : AppSettingsType.notification).then(
                              //   (value) {
                              //     context.pop();
                              //   },
                              // );
                            },
                          ),
                        ),
                        const Gap(8),
                        Expanded(
                          child: AppButton(
                            text: context.l10n.cancel,
                            isOutline: true,
                            fontSize: 12,
                            textColor: AppPalette.accent500,
                            onPressed: () {
                              context.pop();
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          });
    }
  }
}

/// [AppNotificationService] - This class contains methods for initializing and recieve notifications.

final class AppNotificationService {
  /// `showNotification` - This method shows notification.
  static showNotification({required String title, required String body, required String payload}) async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      AppNotifications.channelKey,
      AppNotifications.channelName,
      channelDescription: AppNotifications.channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      icon: 'loca_notification',
      ticker: 'ticker',
    );
    const NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(DateTime.now().millisecond, title, body, notificationDetails, payload: payload);
  }

  // static showNotificationField({required String title, required String body, required String payload}) async {
  //   AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
  //     AppNotifications.channelKey,
  //     AppNotifications.channelName,
  //     channelDescription: AppNotifications.channelDescription,
  //     importance: Importance.max,
  //     priority: Priority.high,
  //     icon: 'ic_notification',
  //     ticker: 'ticker',
  //     actions: [
  //       AndroidNotificationAction("1", "Ответить", inputs: [
  //         AndroidNotificationActionInput(
  //           label: "Ответить",
  //         )
  //       ]),
  //     ],
  //   );
  //   DarwinInitializationSettings darwinInitializationSettings = DarwinInitializationSettings(notificationCategories: [
  //     DarwinNotificationCategory(
  //       'demoCategory',
  //       actions: <DarwinNotificationAction>[
  //         DarwinNotificationAction.plain('id_1', 'Action 1'),
  //         DarwinNotificationAction.plain(
  //           'id_2',
  //           'Action 2',
  //           options: <DarwinNotificationActionOption>{
  //             DarwinNotificationActionOption.,
  //           },
  //         ),
  //         DarwinNotificationAction.plain(
  //           'id_3',
  //           'Action 3',
  //           options: <DarwinNotificationActionOption>{
  //             DarwinNotificationActionOption.foreground,
  //           },
  //         ),
  //       ],
  //       options: <DarwinNotificationCategoryOption>{
  //         DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
  //       },
  //     )
  //   ]);
  //   NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
  //   await flutterLocalNotificationsPlugin.show(DateTime.now().millisecond, title, body, notificationDetails,
  //       payload: payload);
  // }

  /// `initMessaging` - This method initializes firebase messaging.
  static initNotifications({required FirebaseMessaging messaging}) async {
    await initMessaging();
    await initFirebaseMessagings(messaging);
    await fcmSubscribe(messaging);
    await firebaseMessageHandling();
  }

  /// `firebaseMessagingBackgroundHandler` - This method handles firebase messaging in background.
  static Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
  }
}

/// `FlutterLocalNotificationsPlugin` class to create and display local notifications in the app.

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

/// `NotificationDetails` that stores details about how to display a notification.

NotificationDetails? notificationDetails;

/// `fcmSubscribe` - This method subscribes to topic `all` to firebase messaging.

Future<void> fcmSubscribe(FirebaseMessaging messaging) async {
  messaging.subscribeToTopic('all');
}

/// `initFirebaseMessagings` - This method initializes firebase messaging.

Future<void> initFirebaseMessagings(FirebaseMessaging messaging) async {
  AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
    color: AppPalette.primaryColor,
    AppNotifications.channelKey,
    AppNotifications.channelName,
    channelDescription: AppNotifications.channelDescription,
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );
  DarwinNotificationDetails iosNotificationDetails = const DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  notificationDetails = NotificationDetails(android: androidNotificationDetails, iOS: iosNotificationDetails);

  try {
    final String? fcmToken = await messaging.getToken();
    sharedPreference.setFCMToken(fcmToken ?? "");
    dependenciesContainer.talker.good('fcmToken: $fcmToken');
  } on Exception catch (e, st) {
    dependenciesContainer.talker.handle(e, st);
  }

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    await messaging.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    dependenciesContainer.talker.info('User granted provisional permission');
  } else {
    dependenciesContainer.talker.error('User declined or has not accepted permission');
  }
}

/// `initMessaging` - This method initializes local notifications.

Future<void> initMessaging() async {
  var androiInit = const AndroidInitializationSettings('@drawable/loca_notification');
  var iosInit = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    onDidReceiveLocalNotification: (id, title, body, payload) async {
      dependenciesContainer.talker.info('onDidReceiveLocalNotification');
    },
  );

  InitializationSettings initSetting = InitializationSettings(android: androiInit, iOS: iosInit);

  await flutterLocalNotificationsPlugin.initialize(
    initSetting,
    onDidReceiveNotificationResponse: (details) {
      // navigatorKey.currentContext?.pushNamed(NotificationsScreen.name);
    },
  );
}

/// `firebaseMessageHandling` - This method handles firebase messaging in foreground.

Future<void> firebaseMessageHandling() async {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (kDebugMode) {
      dependenciesContainer.talker.info('Got a message whilst in the foreground');
      dependenciesContainer.talker.info('Message data: ${message.notification.toString()}');
    }

    RemoteNotification? notification = message.notification;
    if (notification != null && Platform.isAndroid) {
      AppNotificationService.showNotification(
          title: message.notification?.title ?? "null", body: message.notification?.body ?? "null", payload: '865');
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    // navigatorKey.currentContext?.goNamed(
    //   DocumentScreen.name,
    //   queryParameters: {ScreenExtras.documentId: message.data['document_id'].toString()},
    //   extra: {ScreenExtras.onGoHome: () {}},
    // );
  });
}
