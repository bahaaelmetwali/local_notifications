import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class LocalNotifications {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static NotificationDetails notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      'id:0',
      'SingleNotification',
      importance: Importance.high,
      priority: Priority.high,
    ),
    iOS: DarwinNotificationDetails(),
  );
  static Future<void> init() async {
    InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print(
          'User tapped notification in foreground/background: ${response.payload}',
        );
      },
      onDidReceiveBackgroundNotificationResponse:
          (NotificationResponse response) {
            print(
              'User tapped notification in background: ${response.payload}',
            );
          },
    );
  }

  static Future<void> showSingleNotifications() async {
    await flutterLocalNotificationsPlugin.show(
      0,
      'sinlgenote',
      'body',
      notificationDetails,
    );
  }
}
