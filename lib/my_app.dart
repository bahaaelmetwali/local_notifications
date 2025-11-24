import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:local_notifications/local_notifications.dart';
import 'package:local_notifications/notifcation_details.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? _notificationSubscription;

  void onTapNotificatoin() {
    _notificationSubscription = LocalNotifications.streamController.stream
        .listen((response) {
          log(response.payload!);
          navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (_) =>
                  NotifcationDetailsScreen(notificationResponse: response),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    onTapNotificatoin();
  }

  @override
  void dispose() {
    _notificationSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Title(color: Colors.black, child: Text('Local Notifcations')),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          LocalNotifications.showSingleNotifications();
                        },
                        child: Row(
                          children: [
                            Icon(Icons.notifications),
                            SizedBox(height: 20),
                            Text('singleNotifcations'),
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          LocalNotifications.cancelNotifcations(0);
                        },
                        child: Icon(Icons.close, color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          LocalNotifications.showRepeatedNotifications();
                        },
                        child: Row(
                          children: [
                            Icon(Icons.notifications),
                            SizedBox(height: 20),
                            Text('MultiNotifcations'),
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          LocalNotifications.cancelNotifcations(1);
                        },
                        child: Icon(Icons.close, color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          LocalNotifications.showScheduledNotifications();
                        },
                        child: Row(
                          children: [
                            Icon(Icons.notifications),
                            SizedBox(height: 20),
                            Text('scheduledNotifications'),
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          LocalNotifications.cancelNotifcations(2);
                        },
                        child: Icon(Icons.close, color: Colors.red),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      LocalNotifications.cancelAllNotifcations();
                    },
                    child: Text('cancel all'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
