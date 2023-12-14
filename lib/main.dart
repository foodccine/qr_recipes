import 'package:flutter/material.dart';

import 'app/application.dart';
import 'services/dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependenciesService.setup();
  runApp(Application());
}
