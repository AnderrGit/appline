import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MessagingService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static Future<void> initialize() async {
    // Solicitar permisos
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('Permisos otorgados');
    }

    debugPrint('Token: ${await _messaging.getToken()}');

    // Listeners
    FirebaseMessaging.onMessage.listen((message) {
      debugPrint(
          'Mensaje recibido en primer plano: ${message.notification?.title}');
    });
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  }

  static Future<void> _backgroundHandler(RemoteMessage message) async {
    debugPrint('Mensaje en segundo plano: ${message.notification?.title}');
  }

  static Future<String?> getToken() async {
    return await _messaging.getToken();
  }
}
