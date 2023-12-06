import 'package:huawei_push/huawei_push.dart';
import 'package:base/bootstrap.dart';
import 'package:base/src/core/common/exports/main_export.dart';

/// [HMSCore] - This class contains methods for HMS Push Kit.

final class HMSCore {
  const HMSCore();

  /// [Token] events
  void _onTokenEvent(String token) {
    // sharedPreference.setHMSToken(token);
    showResult('HMS token:', token);
  }

  void _onTokenError(Object error) {
    PlatformException e = error as PlatformException;
    showResult('TokenErrorEvent', e.message!);
  }

  /// [_onMessageReceived] - This function handles the message received event.

  void _onMessageReceived(RemoteMessage remoteMessage) {
    String? data = remoteMessage.data;
    if (data != null) {
      Push.localNotification(
        <String, String>{
          HMSLocalNotificationAttr.TITLE: json.decode(data)['title'],
          HMSLocalNotificationAttr.MESSAGE: json.decode(data)['body'],
          HMSLocalNotificationAttr.NUMBER: json.decode(data)['document_id'].toString(),
        },
      );
      showResult('onMessageReceived', 'Data: $data');
    } else {
      showResult('onMessageReceived', 'No data is present.');
    }
  }

  /// [Handler] for receiving messages.

  void _onMessageReceiveError(Object error) {
    showResult('onMessageReceiveError', error.toString());
  }

  void _onRemoteMessageSendStatus(String event) {
    showResult('RemoteMessageSendStatus', 'Status: $event');
  }

  void _onRemoteMessageSendError(Object error) {
    PlatformException e = error as PlatformException;
    showResult('RemoteMessageSendError', 'Error: $e');
  }

  /// [_onNotificationOpenedApp] - This function handles the notification opened event.

  void _onNotificationOpenedApp(dynamic initialNotification) {
    if (initialNotification != null) {
      showResult('onNotificationOpenedApp', initialNotification['extras'].toString());
      // navigatorKey.currentContext?.goNamed(DocumentScreen.name,
      //     queryParameters: {ScreenExtras.documentId: initialNotification['extras']['notification']['number'].toString()},
      //     extra: {ScreenExtras.onGoHome: () {}});
    }
  }

  /// [initPlatformState] - This function initializes HMS Push Kit.

  Future<void> initPlatformState() async {
    Push.enableLogger();
    Push.getToken("");
    await Push.setAutoInitEnabled(true);

    Push.getTokenStream.listen(
      _onTokenEvent,
      onError: _onTokenError,
    );

    final dynamic initialNotification = await Push.getInitialNotification();
    _onNotificationOpenedApp(initialNotification);

    Push.onNotificationOpenedApp.listen(
      _onNotificationOpenedApp,
    );

    Push.onMessageReceivedStream.listen(
      _onMessageReceived,
      onError: _onMessageReceiveError,
    );
    Push.getRemoteMsgSendStatusStream.listen(
      _onRemoteMessageSendStatus,
      onError: _onRemoteMessageSendError,
    );

    bool? backgroundMessageHandler = await Push.registerBackgroundMessageHandler(
      backgroundMessageCallback,
    );
    debugPrint('backgroundMessageHandler registered: $backgroundMessageHandler');
    dependenciesContainer.talker.good('backgroundMessageHandler registered: $backgroundMessageHandler');
  }

  /// [removeBackgroundMessageHandler] - This function removes the background message handler.

  void removeBackgroundMessageHandler() async {
    await Push.removeBackgroundMessageHandler();
  }

  /// [deleteToken] - This function deletes the token.

  void deleteToken() async {
    String result = await Push.deleteToken('');
    showResult('deleteToken', result);
  }

  /// [Subscribe] and [unsubscribe] to a topic.

  void subscribe(String topic) async {
    try {
      String result = await Push.subscribe(topic);
      showResult('subscribe', result);
    } catch (e) {
      showResult('subscribe', '$e');
    }
  }

  void unsubscribe(String topic) async {
    try {
      String result = await Push.unsubscribe(topic);
      showResult('unsubscribe', result);
    } catch (e) {
      showResult('unsubscribe', '$e');
    }
  }

  /// Ebable and disable [auto init].

  void enableAutoInit() async {
    String result = await Push.setAutoInitEnabled(true);
    showResult('enableAutoInit', result);
  }

  void disableAutoInit() async {
    String result = await Push.setAutoInitEnabled(false);
    showResult('disableAutoInit', result);
  }

  void isAutoInitEnabled() async {
    bool result = await Push.isAutoInitEnabled();
    showResult('isAutoInitEnabled', result.toString());
  }

  /// [Get] initial notification and intent.

  void getInitialNotification() async {
    final dynamic initialNotification = await Push.getInitialNotification();
    showResult('getInitialNotification', initialNotification.toString());
  }

  void getInitialIntent() async {
    final String? initialIntent = await Push.getInitialIntent();
    showResult('getInitialIntent', initialIntent);
  }

  void showResult(
    String name, [
    String? msg = 'Button pressed.',
  ]) {
    msg ??= '';
    dependenciesContainer.talker.debug('[$name]: $msg');
  }
}
