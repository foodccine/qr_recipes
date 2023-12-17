import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_recipes/presentation/views/recipe/recipe_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../app/settings.dart';
import '../presentation/resources/styles_manager.dart';
import '../presentation/resources/themes_manager.dart';
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
  late GoRouter goRouter;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(StatusBarStyle.statusBarStyle);
    WidgetsBinding.instance.addObserver(this);
    goRouter = GoRouter(routes: [
      GoRoute(
          path: '/',
          builder: (context, state) {
            print(state.uri.queryParameters.values);
            return Directionality(
              textDirection: getLayoutDirection(),
              child: ResponsiveSizer(
                builder: (
                  BuildContext context,
                  Orientation orientation,
                  ScreenType screenType,
                ) =>
                    RecipeScreen(
                  brandId: state.uri.queryParameters['brandId'],
                  recipeId: state.uri.queryParameters['recipeId'] != null
                      ? int.parse(state.uri.queryParameters['recipeId']!)
                      : null,
                  baseUrl: 'https://qr.foodccine.com/#' + state.uri.toString(),
                ),
              ),
            );
          }),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: AppSettings.showBanner,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      theme: getAppTheme(),
      routerConfig: goRouter,
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
