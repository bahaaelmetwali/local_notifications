import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotifcationDetailsScreen extends StatelessWidget {
  const NotifcationDetailsScreen({
    super.key,
    required this.notificationResponse,
  });
  final NotificationResponse notificationResponse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Text(
            '${notificationResponse.payload}'
            '+'
            '${notificationResponse.id}',
          ),
        ),
      ),
    );
  }
}
