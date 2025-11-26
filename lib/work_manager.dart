import 'package:local_notifications/local_notifications.dart';
import 'package:workmanager/workmanager.dart';

class SetupWorkManager {
  // registerScheduledNotifcations
  static Future<void> registerScheduledNotifcations() async {
    await Workmanager().registerOneOffTask('scheduled', 'showNotifications');
  }

  // registersingleNotifcations
  static Future<void> registerSingleNotifcations() async {
    await Workmanager().registerPeriodicTask('single', 'singleNotifications');
  }

  //init
  static Future<void> init() async {
    await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
    await SetupWorkManager.registerScheduledNotifcations();
  }
}

//callbackDispatcher
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == 'showNotifications') {
      await LocalNotifications.showScheduledNotifications();
    }
    if (task == 'singleNotifications') {
      await LocalNotifications.showSingleNotifications();
    }
    return Future.value(true);
  });
}
