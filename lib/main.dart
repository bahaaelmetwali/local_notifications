import 'package:flutter/material.dart';
import 'package:local_notifications/local_notifications.dart';
import 'package:local_notifications/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  runApp(const MyApp());
}
