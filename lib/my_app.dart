import 'package:flutter/material.dart';
import 'package:local_notifications/local_notifications.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                      Icon(Icons.close, color: Colors.red),
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
                      Icon(Icons.close, color: Colors.red),
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
                      Icon(Icons.close, color: Colors.red),
                    ],
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
