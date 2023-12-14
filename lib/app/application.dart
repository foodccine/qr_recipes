import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../app/settings.dart';
import '../presentation/resources/styles_manager.dart';
import '../presentation/resources/themes_manager.dart';
import '../presentation/views/main/main_screen.dart';
import '../presentation/views/splash/splash_screen.dart';
import '../services/dependencies.dart';

class Application extends StatefulWidget {
  const Application._initialize();

  static const instance = Application._initialize();

  factory Application() => instance;

  @override
  _ApplicationState createState() => _ApplicationState();
}

@injectable
class _ApplicationState extends State<Application> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(StatusBarStyle.statusBarStyle);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: AppSettings.showBanner,
      theme: getAppTheme(),
      builder: (context, child) => Directionality(
        textDirection: getLayoutDirection(),
        child: ResponsiveSizer(
          builder: (
            BuildContext context,
            Orientation orientation,
            ScreenType screenType,
          ) =>
              child!,
        ),
      ),
      onGenerateRoute: (RouteSettings settings) {
        var routes = <String, WidgetBuilder>{
          AppRoutes.splashRoute: (ctx) => const SplashScreen(),
          AppRoutes.mainRoute: (ctx) => const MainScreen(),
          /* AppRoutes.recipeDetailsRoute: (ctx) =>
              RecipeDirectionsScreen(settings.arguments as RecipeFullModel),*/
        };
        WidgetBuilder? builder = routes[settings.name];
        return MaterialPageRoute(builder: (ctx) => builder!(ctx));
      },
      initialRoute: AppSettings.initialRoute,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  TextDirection getLayoutDirection() {
    if (DependenciesService.getLanguageDirection() != null) {
      if (DependenciesService.getLanguageDirection() == 'rtl') {
        return TextDirection.rtl;
      } else if (DependenciesService.getLanguageDirection() == 'ltr') {
        return TextDirection.ltr;
      } else {
        return AppSettings.defaultLanguageDirection;
      }
    } else {
      return AppSettings.defaultLanguageDirection;
    }
  }
}
