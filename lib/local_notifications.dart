import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class LocalNotifications {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

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
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'id:0',
        'SingleNotification',
        importance: Importance.high,
        priority: Priority.max,
      ),
      iOS: DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      'sinlgeNote',
      'body',
      notificationDetails,
    );
  }
}
