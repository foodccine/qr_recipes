import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

import 'app/application.dart';
import 'services/dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enable();
  //await FirebaseService.setup();
  await DependenciesService.setup();
  //await CrashlyticsService.setup();
  //NotificationService.setup();
  //DependenciesService.updateFCMToken();
  runApp(Application());
}
