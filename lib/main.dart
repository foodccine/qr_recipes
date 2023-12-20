import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/application.dart';
import 'services/dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependenciesService.setup();
  setPathUrlStrategy();
  runApp(Application());
}
