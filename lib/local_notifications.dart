import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

abstract class LocalNotifications {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static onTap(NotificationResponse response) {}
  //init_local_notifications
  static Future<void> init() async {
    InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  //notifaction details
  static NotificationDetails notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      'id:0',
      'SingleNotification',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('note'),
    ),
    iOS: DarwinNotificationDetails(),
  );
  //single notifications
  static Future<void> showSingleNotifications() async {
    await flutterLocalNotificationsPlugin.show(
      0,
      'single',
      'body',
      notificationDetails,
    );
  }
  //repeated notifications

  static Future<void> showRepeatedNotifications() async {
    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'repeated',
      'body',
      RepeatInterval.everyMinute,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exact,
    );
  }
  //scheduled notifications

  static Future<void> showScheduledNotifications() async {
    tz.initializeTimeZones();
    final TimezoneInfo timezoneInfo = await FlutterTimezone.getLocalTimezone();
    final String currentTimeZone = timezoneInfo.localizedName!.name;
    log(currentTimeZone);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      'Scheduled',
      'body',
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
      notificationDetails,

      androidScheduleMode: AndroidScheduleMode.exact,
    );
  }
}
