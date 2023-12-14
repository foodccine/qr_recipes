import 'dart:async';

import '../../../services/dependencies.dart';
import '../../base/api_widget/base_api_viewmodel.dart';

class SplashScreenViewModel extends BaseApiViewModel
    implements SplashScreenViewModelFunctions {
  late Timer timer;
  late Function screenFunction;

  @override
  init(Function onReady) async {
    screenFunction = onReady;
    await DependenciesService.updateRegistryInfo();
    screenFunction();
  }

  @override
  onDispose() {
    timer.cancel();
  }

  @override
  startTimer() {
    timer = Timer(const Duration(seconds: 1, milliseconds: 300), () {
      screenFunction();
    });
  }
}

abstract class SplashScreenViewModelFunctions {
  init(Function onReady);

  startTimer();

  onDispose();
}
