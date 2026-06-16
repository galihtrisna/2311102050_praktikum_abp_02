import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FcmService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    // Meminta izin notifikasi (khusus untuk iOS & Android 13+)
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) print('User granted permission');

      // Mengambil FCM Token untuk keperluan testing via Postman/Firebase Console
      String? token = await _messaging.getToken();
      if (kDebugMode) print("FCM Token: $token");

      // Menangani notifikasi ketika aplikasi berada di foreground
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (kDebugMode) {
          print('Menerima pesan di foreground: ${message.notification?.title}');
        }
      });
    } else {
      if (kDebugMode) print('User declined or has not accepted permission');
    }
  }
}