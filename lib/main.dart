import 'package:flutter/material.dart';
import 'package:local_notifications/local_notifications.dart';
import 'package:local_notifications/my_app.dart';
import 'package:local_notifications/work_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  await SetupWorkManager.init();
  runApp(const MyApp());
}
