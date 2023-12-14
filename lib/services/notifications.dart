import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../app/functions.dart';
import 'dependencies.dart';

class NotificationService {
  static final notificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> setup() async {
    try {
      NotificationSettings firebaseSettings =
          await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        provisional: false,
        sound: true,
      );
      if (firebaseSettings.authorizationStatus ==
          AuthorizationStatus.authorized) {
        FirebaseMessaging.instance.subscribeToTopic('general');
        if (DependenciesService.getCountryCode() != null) {
          FirebaseMessaging.instance.subscribeToTopic(
              'country_${DependenciesService.getCountryCode()}');
        }
        if (DependenciesService.getCity() != null) {
          FirebaseMessaging.instance
              .subscribeToTopic('city_${DependenciesService.getCity()}');
        }
        if (DependenciesService.getLanguageIso() != null) {
          FirebaseMessaging.instance.subscribeToTopic(
              'language_${DependenciesService.getLanguageIso()}');
        }
        if (DependenciesService.getCountryCode() != null &&
            DependenciesService.getLanguageIso() != null) {
          FirebaseMessaging.instance.subscribeToTopic(
              'localize_${DependenciesService.getCountryCode()}_${DependenciesService.getLanguageIso()}');
        }
        FirebaseMessaging.onBackgroundMessage(firebaseBackgroundService);
        initializeNotificationsPlugin();
      }
    } catch (e, stackTrace) {
      AppFunctions.logException(e, stackTrace);
    }
  }

  static Future<void> firebaseBackgroundService(RemoteMessage message) async {
    NotificationService.createNotification(message);
  }

  static void initializeNotificationsPlugin() {
    InitializationSettings pluginSettings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/launcher_icon'),
      iOS: DarwinInitializationSettings(),
    );
    notificationsPlugin.initialize(pluginSettings);
  }

  static void createNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          'foodccine',
          'Foodccine Notifications Channel',
          importance: Importance.max,
          playSound: true,
        ),
      );
      await notificationsPlugin.show(
        id,
        null,
        message.data['description'],
        notificationDetails,
      );
    } catch (e, stackTrace) {
      AppFunctions.logException(e, stackTrace);
    }
  }
}
