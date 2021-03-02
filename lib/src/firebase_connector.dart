import 'package:flutter_apns/src/connector.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FirebasePushConnector extends PushConnector {
  final firebase = FirebaseMessaging.instance;

  @override
  final isDisabledByUser = ValueNotifier(false);

  @override
  void configure({onMessage, onLaunch, onResume, onBackgroundMessage}) {
    // NOTE: None of this Firebase code will be used, we will
    //       only call the Connector when we have an iOS instance.
    // firebase.configure(
    //   onMessage: onMessage,
    //   onLaunch: onLaunch,
    //   onResume: onResume,
    //   onBackgroundMessage: onBackgroundMessage,
    // );

    // firebase.onTokenRefresh.listen((value) {
    //   token.value = value;
    // });
  }

  @override
  final token = ValueNotifier(null);

  @override
  void requestNotificationPermissions() {
    // firebase.requestNotificationPermissions();
  }

  @override
  String get providerType => 'GCM';

  @override
  Future<void> unregister() async {
    // await firebase.setAutoInitEnabled(false);
    // await firebase.deleteInstanceID();

    token.value = null;
  }
}
